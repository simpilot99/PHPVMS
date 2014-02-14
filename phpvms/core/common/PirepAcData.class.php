<?php

   /**
 * Pirep Auto Accept & Decline for PHPvms
 * For more information, visit www.baggelis.com
 *
 * Pirep Auto Accept & Decline is licenced under the following license:
 *   Creative Commons Attribution Non-commercial Share Alike (by-nc-sa)
 *   View license.txt in the root, or visit http://creativecommons.org/licenses/by-nc-sa/3.0/
 *
 * @author Vangelis Boulasikis
 * @copyright Copyright (c) 2014, Vangelis Boulasikis
 * @link http://www.baggelis.com
 * @license http://creativecommons.org/licenses/by-nc-sa/3.0/
 */

    class PirepAcData extends Codondata {

        public function get_criteria() {
            $query = "SELECT *
            FROM ".TABLE_PREFIX."autopirep";

            return DB::get_results($query);
        }

        public function get_settings() {
            $query = "SELECT *
            FROM ".TABLE_PREFIX."autopirep_settings";

            return DB::get_row($query);
        }

        public static function getCriteriaById($id)
        {

            $criteria = DB::get_row('SELECT * FROM '.TABLE_PREFIX.'autopirep 
                WHERE `id`=\''.$id.'\'');

            return $criteria;
        }

        public function editSettings($setting_id,$landing_rate, $send_mail_to_admin, $send_mail_to_pilot, $admin_code)
        {

            /*  $sql = "UPDATE ".TABLE_PREFIX."autopirep_settings 
            SET `landing_rate`='$landingrate', `sendmail_to_admin`='$sendmailtoadmin',`sendmail_to_pilot`='$sendmailtopilot', `admin_rejecting`=$admincode 
            WHERE setting_id=1";

            $res = DB::query($sql);

            if(DB::errno() != 0)
            return false;



            return true;           */ 
            $id = DB::escape($setting_id);      
            $landingrate = DB::escape($landing_rate);
            $mailadmin = DB::escape($send_mail_to_admin);
            $mailpilot = DB::escape($send_mail_to_pilot);  
            $admincode = DB::escape($admin_code); 

            $sql = "UPDATE phpvms_autopirep_settings 
            SET landing_rate='$landingrate', sendmail_to_admin='$mailadmin',sendmail_to_pilot='$mailpilot', admin_rejecting='$admincode'                               
            WHERE setting_id=$id";

            $res = DB::query($sql);

            if(DB::errno() != 0)
                return false;

            return true;
        }
        public static function addcriteria($name, $value, $custommsg)
        {

            $name = DB::escape($name);
            $value = DB::escape($value); 
            $custommsg = DB::escape($custommsg);

            $sql = "INSERT INTO " .TABLE_PREFIX."autopirep (
            `criteria_description`, `criteria_variable`, `criteria_custom_message`) 
            VALUES ('$name', '$value','$custommsg' )";

            $res = DB::query($sql);

            if(DB::errno() != 0)
                return false;



            return true;
        }

        public static function editCriteria($id, $criteria_description, $criteria_variable,$custommsg, $enabled=true)
        {
            $code = DB::escape($criteria_description);
            $name = DB::escape($criteria_variable);
            $msg = DB::escape($custommsg); 

            if($enabled) $enabled = 1;
            else $enabled = 0;

            $sql = "UPDATE ".TABLE_PREFIX."autopirep 
            SET `criteria_description`='$code', `criteria_variable`='$name',`criteria_custom_message`='$msg', `enabled`=$enabled 
            WHERE id=$id";

            $res = DB::query($sql);

            if(DB::errno() != 0)
                return false;



            return true;
        }
        public static function deleteCriteria($id)
        {
            if($id == '') return false;
            $id = intval($id);

            $sql = 'DELETE FROM '. TABLE_PREFIX.'autopirep
            WHERE id='.$id;

            $res = DB::query($sql);

        }

        public function reject_pirep_post($id)
        {
            $pirepid = $id;


            PIREPData::ChangePIREPStatus($pirepid, PIREP_REJECTED); // 2 is rejected
            $pirep_details = PIREPData::GetReportDetails($pirepid);

            // If it was previously accepted, subtract the flight data
            if(intval($pirep_details->accepted) == PIREP_ACCEPTED)
            {
                PilotData::UpdateFlightData($pirep_details->pilotid, -1 * floatval($pirep->flighttime), -1);
            }

            //PilotData::UpdatePilotStats($pirep_details->pilotid);
            RanksData::CalculateUpdatePilotRank($pirep_details->pilotid);
            PilotData::resetPilotPay($pirep_details->pilotid);
            StatsData::UpdateTotalHours();



            # Call the event
            CodonEvent::Dispatch('pirep_rejected', 'PIREPAdmin', $pirep_details);
        } 

        public function approve_pirep_post($id)
        {
            $pirepid = $id;   

            if($pirepid == '') return;

            $pirep_details  = PIREPData::GetReportDetails($pirepid);

            # See if it's already been accepted
            if(intval($pirep_details->accepted) == PIREP_ACCEPTED) return;

            # Update pilot stats
            SchedulesData::IncrementFlownCount($pirep_details->code, $pirep_details->flightnum);
            PIREPData::ChangePIREPStatus($pirepid, PIREP_ACCEPTED); // 1 is accepted
            PilotData::UpdateFlightData($pirep_details->pilotid, $pirep_details->flighttime, 1);
            PilotData::UpdatePilotPay($pirep_details->pilotid, $pirep_details->flighttime);

            RanksData::CalculateUpdatePilotRank($pirep_details->pilotid);
            PilotData::GenerateSignature($pirep_details->pilotid);
            StatsData::UpdateTotalHours();



            # Call the event
            CodonEvent::Dispatch('pirep_accepted', 'PIREPAdmin', $pirep_details);
        }

        public function search($id)
        {     
            
            //Get Pirep Details for Email  
            $pirepdetails = PIREPData::getReportDetails($id);

            //Get Proper Pilot ID
            $pilotid=PilotData::GetPilotCode($pirepdetails->code,$pirepdetails->pilotid) ;

            //Get Pilot EMAIL
            $userinfo = PilotData::getPilotData($pirepdetails->pilotid);

            //Get Settings from DB
            $sqlset ="SELECT *
            FROM ".TABLE_PREFIX."autopirep_settings";

            $settings = DB::get_row($sqlset); 
            $adminid=PilotData::parsePilotID($settings->admin_rejecting) ;



            //Select the Criteria that are enabled 
            $sql = "SELECT *
            FROM ".TABLE_PREFIX."autopirep
            WHERE enabled = '1'";


            $ret = DB::get_results($sql);  


            if(empty($ret)and $pirepdetails->landingrate < $settings->landing_rate)
                self::approve_pirep_post($id);
            
              if   (empty($ret))
              self::approve_pirep_post($id);
              else
                foreach($ret as $criteria)
                {

                    //Seacrh the pirep for criteria 

                    $sql2 = "SELECT * FROM ".TABLE_PREFIX."pireps WHERE pirepid='$id'
                    AND log LIKE '%$criteria->criteria_variable%'";

                    $ret2 = DB::get_row($sql2);
                    if(empty($ret2))
                        self::approve_pirep_post($id);
                    else

                        foreach($ret2 as $criteria2)    
                        {    
                            self::reject_pirep_post($id)  ;    
                            PIREPData::addComment($ret2->pirepid,$adminid,"Your Pirep has been rejected because you " .$criteria->criteria_custom_message) ;
                            break;  
                    } 


            }
           
                if($pirepdetails->landingrate < $settings->landing_rate)
                self::reject_pirep_post($id)  ;
                 if($pirepdetails->landingrate < $settings->landing_rate)
                PIREPData::addComment($pirepdetails->pirepid,$adminid,"Your Pirep has been rejected because you exeeded maximum landing rate of" .$settings->landing_rate) ;
           
                
               
              
              //Get Pirep Againt to check status  1 for accepted 2 declined
              $pirepdetailsafter = PIREPData::getReportDetails($id);
            //If sendmail_to_admin=1 send email to admin 
              
              
             if ($settings->sendmail_to_admin == '1' && $pirepdetailsafter->accepted =='2')  
            {  

                $sub = "PIREP {$pirepdetails->pirepid} by {$pilotid} ({$pirepdetails->depicao} - {$pirepdetails->arricao}) has been rejected ";
                $message="PIREP {$pirepdetails->pirepid} has been submitted by {$pilotid} {$pirepdetails->firstname} {$pirepdetails->lastname } and has been rejected\n\n" ;

                $email = Config::Get('EMAIL_REJECTED_PIREP');
                if(empty($email))
                {
                    $email = ADMIN_EMAIL;
                }     

                   Util::SendEmail($email, $sub, $message);  
                   

            }
         

            //If sendmail_to_pilot=1 send email to pilot that the pirep has been rejected 

            if ($settings->sendmail_to_pilot == '1' && $pirepdetailsafter->accepted =='2')  
            {  

                $sub = "Your PIREP {$pirepdetails->pirepid}({$pirepdetails->depicao} - {$pirepdetails->arricao}) has been rejected ";
                $message="Your PIREP {$pirepdetails->pirepid}({$pirepdetails->depicao} - {$pirepdetails->arricao}) has been rejected\n\n" 
                ."if you wish to see the reason please visit the company Website \n";

                $email = $userinfo->email;


                Util::SendEmail($email, $sub, $message);  
                


            }
                      
                  
        } 

    }    


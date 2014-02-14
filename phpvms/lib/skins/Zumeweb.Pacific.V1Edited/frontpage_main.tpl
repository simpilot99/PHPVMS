<?php include_once("analyticstracking.php") ?>
<style>
#innerwrapper{
background:none;
border:none;
padding:0px;
}
.fadein { 
position:relative; height:200px; width:970px; margin:0 auto;
background: url("slideshow-bg.png") repeat-x top transparent;
padding: 10px;
 }
.fadein img { position:absolute; left:0px; top:10px; }
</style>
 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script>
$(function(){
	$('.fadein img:gt(0)').hide();
	setInterval(function(){$('.fadein :first-child').fadeOut().next('img').fadeIn().end().appendTo('.fadein');}, 3000);
});
</script>
</head>
<body>
<div class="fadein">

<img src="http://hawaiianairwayspireps.comoj.com/phpvms/lib/skins/Zumeweb.Pacific.V1Edited/images/default/web_banner.png">
<img src="http://hawaiianairwayspireps.comoj.com/phpvms/lib/skins/Zumeweb.Pacific.V1Edited/images/default/banner2.png">
<img src="http://hawaiianairwayspireps.comoj.com/phpvms/lib/skins/Zumeweb.Pacific.V1Edited/images/default/banner3.png">
</div>
<div class="row-fluid">
	<div class="span9">
		<h3>Welcome to Hawaiian Airways Virtual Airline
		<div class="box">
			<p><font size="2" color="red">Users can now add their own routes to the schedule. Find out how <a href="http://www.youtube.com/watch?v=53HEKoWBDRQ">here.</a></font></p>
			
			<p> Welcome to the Hawaiian Airways PHPVMS Flight Logging System. We are pleased to welcome all pilots to our state of the art, professional booking system that will now be used throughout the Hawaiian Airways family. This system is using PHPVMS which was actually designed for Flight Simulator. We found that it also works quite well with YSFlight and so we decided to use it. Please read an important welcome message on how to use the system here:&nbsp;<a href="http://hawaiianairwayspireps.comoj.com/phpvms/index.php/pages/welcomemessage">http://hawaiianairwayspireps.comoj.com/phpvms/index.php/pages/welcomemessage</a>.</p>	
<p>
	This system will be used for all passenger and cargo flights including OAVA flights. It will also cover all destinations across Hawaii, the UK and the Canary Islands.</p>
<p>
	The system will ask you for your fuel used when logging a PIREP. As a standard rule of thumb, each kg of fuel is 0.01% on YSFlight. Therefore, if I used 10% of YSFlight fuel on my flight, I will put 1000kg in the PIREP.</p>
<p>
	Thanks. TB1.</p>
</div>	
		</div>
		<div class="span3">
		<h3>Navigation</h3><div class="box"><ul class="nav nav-list">
  <li class="active"><a href="http://hawaiianairwayspireps.comoj.com/phpvms/index.php/"><i class="icon-home icon-white"></i> Home</a></li>
  <li><a href="http://www.hawaiianairwaysva.com/"><i class="icon-home"></i> Hawaiian Airways Website</a></li>
  <li><a href="http://hawaiianairwayspireps.comoj.com/phpvms/index.php/schedules"><i class="icon-plane"></i> Book a Flight</a></li>
  <li><a href="http://hawaiianairwayspireps.comoj.com/phpvms/index.php/vFleetTracker"><i class="icon-plane"></i> Fleet Tracker</a></li>
  <li><a href="http://hawaiianairwayspireps.comoj.com/phpvms/index.php/airports"><i class="icon-road"></i> Airports</a></li>
  <li><a href="http://hawaiianairwayspireps.comoj.com/phpvms/index.php/timetable"><i class="icon-time"></i> Timetable</a></li>
  <li><a href="http://hawaiianairwayspireps.comoj.com/phpvms/index.php/pireps/mine"><i class="icon-plane"></i> My PIREPS</a></li>
  <li><a href="http://hawaiianairwayspireps.comoj.com/phpvms/index.php/pireps/routesmap"><i class="icon-plane"></i> PIREPS Route Map</a></li>
  <li><a href="http://hawaiianairwayspireps.comoj.com/phpvms/index.php/finances"><i class="icon-signal"></i> Airline Finances</a></li>
  <li><a href="http://hawaiianairwayspireps.comoj.com/phpvms/index.php/RealScheduleLite"><i class="icon-plane"></i> Jumpseat Booking</a></li>
  <li><a href="http://hawaiianairwayspireps.comoj.com/phpvms/index.php/CurrentFlights"><i class="icon-plane"></i> Latest Flights</a></li>
  <li><a href="http://hawaiianairwayspireps.comoj.com/phpvms/index.php/Flights"><i class="icon-plane"></i> Historic Flights</a></li>

 </ul>
 </div>
 </div>
			

			
			
			
			
			
			
			
			
			
</div>			
<div class="row-fluid">	
	<div class="span9">
		<h3>Tweets & Partners</h3>
		<div class="box">
		<center>
<a class="twitter-timeline" href="https://twitter.com/HAVA_YSFlight" data-widget-id="344865417484963840">Tweets by @HAVA_YSFlight</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
</a>	
<div class="partners" >
	<a href="https://sites.google.com/site/fastairwaysfa/" target="_blank">
		<img src="<?php echo SITE_URL; ?>/lib/skins/Zumeweb.Pacific.V1Edited/images/default/partner_logo.png" class="partnerimg">
	</a>
	<a href="http://ysfhq.com/" target="_blank">
		<img src="<?php echo SITE_URL; ?>/lib/skins/Zumeweb.Pacific.V1Edited/images/default/partner_logo_2.png" class="partnerimg">
	</a>
	<a href="http://penguinairwaysva.webs.com/" target="_blank">
		<img src="<?php echo SITE_URL; ?>/lib/skins/Zumeweb.Pacific.V1Edited/images/default/partner_logo_3.png" class="partnerimg">
	</a>
</div>

</center>
		</div>
		
						</div>
	<div class="span3">
	<h3><strong>Quick</strong>Stats</h3>
		<div class="box">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><b><span class="badge badge-info"><?php echo StatsData::PilotCount(); ?></div></b></td>
    <td>Pilots</td>
  </tr>
  <tr>
    <td><b><span class="badge badge-info"><?php echo StatsData::TotalAircraftInFleet(); ?></div></b></td>
    <td>Aircraft</td>
  </tr>
  <tr>
    <td><b><span class="badge badge-info"><?php echo StatsData::TotalSchedules(); ?></div></b></td>
    <td>Schedules</td>
  </tr>
  <tr>
    <td><b><span class="badge badge-info"><?php echo StatsData::TotalFlights(); ?></div></b></td>
    <td>Completed Flights</td>
  </tr>
  <tr>
    <td><b><span class="badge badge-info"><?php echo StatsData::TotalFlightsToday(); ?></div></b></td>
    <td>Flight(s) Today</td>
  </tr>
  <tr>
  <td><b><span class="badge badge-info"><?php echo number_format(StatsData::TotalPaxCarried()); ?></div></b></td>
    <td>Passengers Carried</td>
  </tr>
  <tr>
    <td><b><span class="badge badge-info"><?php echo number_format(StatsData::TotalFuelBurned()); ?> lbs</div></b></td>
    <td>Fuel Burned</td>
  </tr>
  <tr>
    <td><b><span class="badge badge-info"><?php echo StatsData::TotalHours(); ?></div></b></td>
    <td>Hours Flown</td>
  </tr>
  <tr>
    <td><b><span class="badge badge-info"><?php echo number_format(StatsData::TotalMilesFlown()); ?></div></b></td>
    <td>Miles Flown</td>
  </tr>
		</div>
	</div>
 </table>
		    
	</div>
			
			<div class="span12">
     <h3>Newest Pilots</h3>
     <div class="box">
	 <right>
     <?php MainController::Run('Pilots', 'RecentFrontPage', 10); ?>	 
	 
	 </div>
	 </div>
	 </div>
	        </div>
			</div>

<div class="row-fluid">	
  <div class="span12">
  <div class="box">
  <table width="100%" border="0" bordercolor="#FFFFFF">
    <h3><center>Latest Flights (All Times in Zulu)</h3>
    </div>
    <?php
    $count = 5;
    $pireps = PIREPData::getRecentReportsByCount($count);
  ?>
  
<style type="text/css">
  table th { text-align: center; color:black; font-weight:bold;}
  table td { text-align: center; }
</style>
   <thead>
    <tr>
    <style type="text/css">
{ text-align: center; }
</style>
      <th>Flight Number</th>
      <th>Pilot</th>
      <th>Departure</th>
      <th>Arrival</th>
      <th>Flight Duration</th>
      <th>Aircraft</th>
	  <th>Registration</th>
      <th>Date of Flight</th>
      <th>Flight Status</th>
    </tr>
    </font>
    <tbody>
      
    <?php

    if(count($pireps) > 0)
    {
      foreach ($pireps as $pirep)
      {
        {
          $pilotinfo = PilotData::getPilotData($pirep->pilotid);
          $pilotid = PilotData::getPilotCode($pilotinfo->code, $pilotinfo->pilotid);
          
          if($pirep->accepted == '0') $status = 'REJECTED';
          if($pirep->accepted == '1') $status = 'ACCEPTED';
          else $status = 'PENDING'; 
          
          /*$aircraft = OperationsData::getAircraftInfo($pirep->aircraft);*/
        } 
    ?>
	
        <tr>
        <td class="small"><a href="<?php echo SITE_URL?>/index.php/pireps/view/<?php echo '' . $pirep->pirepid . ''; ?>"><?php echo $pirep->code.$pirep->flightnum; ?></a></td>
        <td class="small"><a href="<?php echo SITE_URL?>/index.php/profile/view/<?php echo '' . $pilotinfo->pilotid . ''; ?>"><?php echo $pilotinfo->firstname.' '.$pilotinfo->lastname; ?></td>
		<td class="small"><?php echo '<a href=" '.SITE_URL.'/index.php/airports/get_airport?icao='.$pirep->depicao.'">'.$pirep->depicao.'</a>';?></td>
		<td class="small"><?php echo '<a href=" '.SITE_URL.'/index.php/airports/get_airport?icao='.$pirep->arricao.'">'.$pirep->arricao.'</a>';?></td>
        <td class="small"><?php echo $pirep->flighttime; ?> hours</td>
		<td class="small"><a href="<?php echo SITE_URL?>/index.php/vFleetTracker/view/<?php echo '' . $pirep->registration . ''; ?>"><?php echo $pirep->aircraft; ?></a></td>
		<td class="small"><a href="<?php echo SITE_URL?>/index.php/vFleetTracker/view/<?php echo '' . $pirep->registration . ''; ?>"><?php echo $pirep->registration; ?></a></td>
        <td class="small"><?php echo date(DATE_FORMAT, $pirep->submitdate); ?></td>
        <td class="small"><?php
            
            if($pirep->accepted == PIREP_ACCEPTED) {
                if($pirep->submitdate+($pirep->flighttime*60*60)>time()) echo '<font color="blue">In Flight</font>'; // as long as a single flight duration has not elapsed, show it as in flight
                else echo '<font color="green">Landed</font>'; //more than a flight duration has elapsed, show it as landed
            } elseif($pirep->accepted == PIREP_REJECTED)
                echo '<font color="red">Rejected</font>';
            elseif($pirep->accepted == PIREP_PENDING)
                echo '<font color="orange">Awaiting Information</font>';
            elseif($pirep->accepted == PIREP_INPROGRESS)
                echo '<font color="blue">In Flight</font>';
            
            ?>
            
              <?php if($pirep->accepted == PIREP_ACCEPTED && !($pirep->submitdate+($pirep->flighttime*60*60)>time())): ?><font color="green">at <?php echo date('H:i', $pirep->submitdate+($pirep->flighttime*60*60));?>z</font><?php endif; ?>
	
        <?php
                          $schedule = SchedulesData::getScheduleByFlight($pirep->code,$pirep->flightnum);
                          $fltime = explode(".", $schedule->flighttime);
                          $minstar = substr($fltime[1],0,1);
                          $minstarmin = substr($fltime[1],1,2);
                          $flmin = $minstar * 10;
                          $flhou = $fltime[0] * 60;
                          $flminu = $flhou + $flmin + $minstarmin;
                        
                          $actfltime = explode(".", $pirep->flighttime);
                          $actminstar = substr($actfltime[1],0,1);
                          $actminstarmin = substr($actfltime[1],1,2);
                          $actflmin = $actminstar * 10;
                          $actflhou = $actfltime[0] * 60;
                          $actflminu = $actflhou + $actflmin + $actminstarmin;
                        
                        if (!($pirep->submitdate+($pirep->flighttime*60*60)>time())) { // new line
                          if(($flminu - 20) > $actflminu) {
                            echo '<font color="blue">and Was Early</font>';
                          } elseif (($flminu + 15) < $actflminu) {
                            echo '<font color="red">and Was Delayed</font>';
                          } else {
                            echo '<font color="green"> and Was On Time</font>';
                          }
                        } // new line
						
                          ?>
	
	</li>
</td>
        </tr>
        <?php
      }
    }
    else
    {
        echo '<tr><td>There are no recent flights!</td></tr>';
    }
    ?>
    
    
    
     </tbody>
     </div>
  </table>
  
<?php MainController::Run('FrontBids', 'RecentFrontPage', 5); ?>

 </body>
<?php

  
class VastatsData
{	 
	
	public static function pagecounter()
	{			
						$sql="SELECT * FROM counter";
						$result=mysql_query($sql);
						
						$rows=mysql_fetch_array($result);
						$counter=$rows['counter']; 
						
						if(empty($counter)){
						$counter=1;
						$sql1="INSERT INTO $tbl_name(counter) VALUES('$counter')";
						$result1=mysql_query($sql1);
						}
						
						$addcounter=$counter+1;
						$sql2="update counter set counter='$addcounter'";
						$result2=mysql_query($sql2);
						
						echo $addcounter;
	}
	
	public static function usersonline()
	{			
						session_start();
						$session=session_id();
						$time=time();
						$time_check=$time-600;
						
						$sql="SELECT * FROM user_online WHERE session='$session'";
						$result=mysql_query($sql);
						
						$count=mysql_num_rows($result);
						
						if($count=="0"){
						$sql1="INSERT INTO user_online(session, time)VALUES('$session', '$time')";
						$result1=mysql_query($sql1);
						}
						else {
						"$sql2=UPDATE user_online SET time='$time' WHERE session = '$session'";
						$result2=mysql_query($sql2);
						}
						
						$sql3="SELECT * FROM user_online";
						$result3=mysql_query($sql3);
						
						$count_user_online=mysql_num_rows($result3);
						
						echo $count_user_online;
						  
						$sql4="DELETE FROM user_online WHERE time<$time_check";
						$result4=mysql_query($sql4);
	}
	public static function totalpaxcarried()
	{
						$query = 'SELECT *
								FROM '.TABLE_PREFIX.'pireps
								WHERE accepted=1';
						
						$result=DB::get_results($query);
						
						$totalpax=0;
						foreach ($result as $pax)
							{
								$totalpax= ($pax->load + $totalpax);
							}
							echo $totalpax;
						
	}
	public static function totalflightstoday()
	{
						$query = 'SELECT COUNT(*) AS total 
								FROM '.TABLE_PREFIX.'pireps
								WHERE submitdate >= NOW() -172800';
						$result=DB::get_row($query);
						if (!$result){
							echo 0;
						}
						else {
							echo $result->total;
						}
						
	}
	public static function totalfuelburned()
	{
						$query = 'SELECT fuelused
								FROM '.TABLE_PREFIX.'pireps
								WHERE accepted=1';
						
						$result=DB::get_results($query);
						
						$totalfuel=0;
						foreach ($result as $fuel)
							{
								$totalfuel= ($fuel->fuelused + $totalfuel);
							}
							echo $totalfuel;
						
	}
	public static function totalmilesflown()
	{
						$query = 'SELECT distance
								FROM '.TABLE_PREFIX.'pireps
								WHERE accepted=1';
						
						$result=DB::get_results($query);
						
						$totalmiles=0;
						foreach ($result as $miles)
							{
								$totalmiles= ($miles->distance + $totalmiles);
							}
							echo $totalmiles;
						
	}
	public static function totalaircraftinfleet()
	{
						$query = 'SELECT COUNT(*) AS total FROM '.TABLE_PREFIX.'aircraft';
						$result=DB::get_row($query);
						echo $result->total;
						
	}
	public static function totalnewsitems()
	{
						$query = 'SELECT COUNT(*) AS total FROM '.TABLE_PREFIX.'news';
						$result=DB::get_row($query);
						echo $result->total;
	}
	public static function totalschedules()
	{
						$query = 'SELECT COUNT(*) AS total FROM '.TABLE_PREFIX.'schedules';
						$result=DB::get_row($query);
						echo $result->total;
	}
}
?>
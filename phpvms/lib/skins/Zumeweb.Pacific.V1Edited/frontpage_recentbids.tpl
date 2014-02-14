<?php
$lastbid = SchedulesData::GetAllBids();
if (count($lastbid) > 0)
{ ?>

<div class="row-fluid">	
  <div class="span12">
  <div class="box">
  <table width="100%" border="0" bordercolor="#FFFFFF">
<h3><center>Upcoming Departures</h3>
    </div>

<style type="text/css">
  table th { text-align: center; color:black; font-weight:bold;}
  table td { text-align: center; }
</style>
   <thead>
    <tr>
    <style type="text/css">
{ text-align: center; }
</style>    
<th><div align="center">Flight Number</div></th>
<th><div align="center">Pilot</div></th>
<th><div align="center">Departure</div></th>	
<th><div align="center">Arrival</div></th>
<th><div align="center">Flight Duration</div></th>
<th><div align="center">Aircraft</th>
<th><div align="center">Registration</div></th>
</tr>
    </thead>    
<tbody>
<?php

foreach($lastbids as $lastbid)
{
?>

<?php
$flightid = $lastbid->id
?>	

    <td height="25" width="10%" align="center"><span><a href="<?php echo SITE_URL?>/index.php/schedules/details/<?php echo '' . $flightid . '';?> "><?php echo $lastbid->code; ?><?php echo $lastbid->flightnum; ?></span></td>
   <?php
$params = $lastbid->pilotid;

$pilot = PilotData::GetPilotData($params);
$pname = $pilot->firstname;
$psurname = $pilot->lastname;
?>
   <td height="25" width="10%" align="center"><span><a href="<?php echo SITE_URL?>/index.php/profile/view/<?php echo '' . $params . ''; ?>"><?php echo $pname; ?> <?php echo $psurname; ?></span></td>
   <td height="25" width="10%" align="center"><span><?php echo '<a href=" '.SITE_URL.'/index.php/airports/get_airport?icao='.$lastbid->depicao.'">'.$lastbid->depicao.'</a>';?></span></td>
   <td height="25" width="10%" align="center"><span><?php echo '<a href=" '.SITE_URL.'/index.php/airports/get_airport?icao='.$lastbid->arricao.'">'.$lastbid->arricao.'</a>';?></span></td>
   <td height="25" width="10%" align="center"><span><?php echo $lastbid->flighttime; ?> hours</span></td>
   <td height="25" width="10%" align="center"><span><a href="<?php echo SITE_URL?>/index.php/vFleetTracker/view/<?php echo '' . $lastbid->registration . ''; ?>"><?php echo $lastbid->aircraft; ?></a></td>
   <td height="25" width="10%" align="center"><span><a href="<?php echo SITE_URL?>/index.php/vFleetTracker/view/<?php echo '' . $lastbid->registration . ''; ?>"><?php echo $lastbid->registration; ?></a></td>
   
</tr>
</div>
</div>
</div>
         <?php
                 }
                        } else { ?>
						<div class="row-fluid">	
  <div class="span12">
  <div class="box">
  <table width="100%" border="0" bordercolor="#FFFFFF">
<h3><center>There Are No Upcoming Departures!</h3>
    </div>
                        <?php
                        }
         ?>
</tbody>
</table>
</div>
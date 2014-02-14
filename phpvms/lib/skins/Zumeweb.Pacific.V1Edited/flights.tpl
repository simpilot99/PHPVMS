<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.0-beta.1/css/jquery.dataTables.css">
 
<!-- jQuery -->
<script type="text/javascript" charset="utf8" src="//code.jquery.com/jquery-1.10.2.min.js"></script>
 
<!-- DataTables -->
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.0-beta.1/js/jquery.dataTables.js"></script>


<center>
<?php
$count = 5000;
$pireps = PIREPData::getRecentReportsByCount($count);
?>
       <script type="text/javascript">
$(document).ready(function() {
        $('#historic').dataTable( {
                "sPaginationType": "full_numbers"
        } );
} );
                </script> 
<div class="row-fluid">	
  <div class="span12">
  <div class="box">
  <table width="100%" border="0" bordercolor="#FFFFFF">
  <table id="historic" class="display"">
  <table>
    <h3><center>This Table Displays All Historic Filed PIREPS (All Times in Zulu)</h3>
    </div>
<?php
		$count = 5000;
		$pireps = PIREPData::getRecentReportsByCount($count);
		?>
		<table class="standard-table">
		  <table width="100%" border="0" bordercolor="#FFFFFF">
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
      <th>Date of Flight
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
	</center>
<script>
$(function() {
    $("header, footer").hide();
});
</script>
<script>
<div>
$('#target-div').load('http://hawaiianairwayspireps.comoj.com/phpvms/index.php/FlightBoardSmall #body');
</script>
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
<table width="100%" border="0" bordercolor="#FFFFFF">
   <thead>
      <tr align="center" valign="middle" bgcolor="#7D95AF">
      <th>Flight Number</th>
      <th>Pilot</th>
      <th>Departure</th>
      <th>Arrival</th>
      <th>Flight Duration</th>
      <th>Aircraft</th>
      <th>Date of Flight
      <th>Flight Status (Time in Zulu)</th>
         </tr>
        </thead>
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
        <td class="small"><?php echo $pirep->depicao; ?></td>
        <td class="small"><?php echo $pirep->arricao; ?></td>
        <td class="small"><?php echo $pirep->flighttime; ?></td>
        <td class="small"><?php echo $pirep->aircraft; ?></td>
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
            
              <?php if($pirep->accepted == PIREP_ACCEPTED && !($pirep->submitdate+($pirep->flighttime*60*60)>time())): ?><font color="green">at <?php echo date('H:i', $pirep->submitdate+($pirep->flighttime*60*60));?></font><?php endif; ?>
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
	</div>
	</body>
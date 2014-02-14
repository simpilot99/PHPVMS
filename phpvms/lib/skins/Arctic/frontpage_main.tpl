<style>
#bodytext{
padding:0px;
}
.bodytext{padding:5px;}
</style>
<div class="innerwrapper" style="margin-top:0px;">


</div>

<script>
$(document).ready(function(){
	 $('.carousel').carousel({
  interval: 2000
})

});
</script>
<div class="bodytext">
<div class="row">
  <div class="col-md-4">
  <div class="span3"><h3>Newest Pilots</h3>
		<?php MainController::Run('Pilots', 'RecentFrontPage', 5); ?>
		
		<h3>Statistics</h3>
	<table cellspacing="0" border="0" style="width: 210px; font-size:12px;">
	<tbody><tr>
                <td><strong>Total Hours:</strong></td>
                <td style><span class="label label-default"><?php echo StatsData::TotalHours (); ?></span></td>
               
	</tr>

		<tr>
		<td><strong>Total Flights:</strong></td>
                <td><span class="label label-default"><?php echo StatsData::TotalFlights(); ?></span></td>
               </tr>
             <tr>
           <td><strong>Miles Flown:</strong></td>
           <td><span class="label label-default"><?php echo StatsData::totalmilesflown(); ?>nm</span></td>
           </tr>
          

           
           <tr>
           <td><strong>Pilot Recruitment Status:</strong></td>
           <td><span class="label label-success">Open</span></td>
           </tr>
           <tr>
           <td><strong>Staff Recruitment Status:</strong></td>
           <td><span class="label label-danger">Closed</span></td>
           </tr>
        
	</table>
	
	<h3>Latest News</h3>
	<i>Latest News Module here</i>
	</div>
  </div>
  <div class="col-md-7" >
  <h3>About</h3>
  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam id velit a leo tincidunt blandit. Sed et nunc vel justo pretium fermentum. Mauris adipiscing lacus a mi dapibus gravida. Nullam vitae vulputate nibh. Morbi condimentum tempor imperdiet. Phasellus et nibh at elit hendrerit interdum. Aliquam in convallis odio, et congue ligula. Fusce a facilisis felis. Mauris malesuada nunc eu venenatis ultrices. Nunc eget est felis. Cras accumsan luctus erat non tempus. Praesent in mauris arcu. Maecenas semper nec augue nec hendrerit. Nullam eget porttitor velit. Ut eleifend velit sit amet ultrices aliquet. </p>
	<h3>Live Flights</h3>
	<</div>
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
            
              <?php if($pirep->accepted == PIREP_ACCEPTED && !($pirep->submitdate+($pirep->flighttime*60*60)>time())): ?><font color="green">at <?php echo date('H:i', $pirep->submitdate+($pirep->flighttime*60*60));?>z</font><?php endif; ?>
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
<div class="row-fluid">	
  <div class="span12">
  <div class="box">
  <table width="100%" border="0" bordercolor="#FFFFFF">
    <h3>Flight <?php echo $pirep->code . $pirep->flightnum; ?></h3>
    </div>
	<tr>


<td width="50%">
<ul>
	<li><strong>Flown By: </strong><a href="<?php echo SITE_URL.'/index.php/profile/view/'.$pirep->pilotid?>">
			<?php echo $pirep->firstname.' '.$pirep->lastname?></a></li>
	<li><strong>Departure Airport: </strong>
	<?php echo '<a href=" '.SITE_URL.'/index.php/airports/get_airport?icao='.$pirep->depicao.'">'.$pirep->depname.'</a>';?></li>
	<li><strong>Arrival Airport: </strong><?php echo '<a href=" '.SITE_URL.'/index.php/airports/get_airport?icao='.$pirep->arricao.'">'.$pirep->arrname.'</a>';?></li>
	<li><strong>Aircraft Flown: </strong><a href="<?php echo SITE_URL?>/index.php/vFleetTracker/view/<?php echo '' . $pirep->registration . ''; ?>"><?php echo $pirep->aircraft; ?></a></li>
	<li><strong>Aircraft Registration: </strong><a href="<?php echo SITE_URL?>/index.php/vFleetTracker/view/<?php echo '' . $pirep->registration . ''; ?>"><?php echo $pirep->registration; ?></a></li>
	<li><strong>Flight Distance: </strong><?php echo $pirep->distance;?> Nautical Miles</li>
	<li><strong>Flight Time: </strong> <?php echo $pirep->flighttime; ?></li>
	<li><strong>Flight Type: </strong>
	<?php

		if($pirep->flighttype == "P")
			echo 'Passenger';
			if($pirep->flighttype == "C")
			echo 'Cargo';
			
		?>
	<li><strong>Date Submitted: </strong> <?php echo date(DATE_FORMAT, $pirep->submitdate);?></li>
	<li><strong>Flight Status: </strong>
		<?php
            
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
                        
                          if(($flminu - 20) > $actflminu) {
                          echo '<font color="blue">and Was Early</font>';
                          } elseif (($flminu + 15) < $actflminu) {
                          echo '<font color="red">and Was Delayed</font>';
                          } else {
                          echo '<font color="green"> and Was On Time</font>'; }
						
                          ;?>
	
	</li>
</ul>
</td>
<td width="50%" valign="top" align="right">
<table class="balancesheet" cellpadding="0" cellspacing="0" width="100%">

	<tr class="balancesheet_header">
		<td align="" colspan="2">Flight Details</td>
	</tr>
	<tr>
		<td align="right"><strong>Gross Revenue: </strong> <br /> 
			(Load=<?php echo $pirep->load;?> units, either pax or lbs of cargo, @ <?php echo FinanceData::FormatMoney($pirep->price);?> per unit)<br />
		<td align="right" valign="top"><?php echo FinanceData::FormatMoney($pirep->load * $pirep->price);?></td>
	</tr>
	<tr>
		<td align="right"><strong>Fuel Cost: </strong><br />
			(<?php echo $pirep->fuelused;?> lbs of fuel used @ $ <?php echo $pirep->fuelunitcost?> per pound)<br />
		<td align="right" valign="top"><?php echo FinanceData::FormatMoney($pirep->fuelused * $pirep->fuelunitcost);?></td>
	</tr>
	<tr>
		<td align="right"><strong>Pilot Pay: </strong><br />
		(This pilot earns <?php echo FinanceData::FormatMoney($pirep->pilotpay);?> p/hr)<br />
		<td align="right" valign="top"><?php echo FinanceData::FormatMoney($pirep->pilotpay * $pirep->flighttime);?></td>
	</tr>
	<tr>
		<td align="right"><strong>Expenses: </strong><br />
		<td align="right" valign="top"><?php echo FinanceData::FormatMoney($pirep->expenses);?></td>
	</tr>
	<tr>
		<td align="right"><strong>Net Revenue: </strong><br />
		<td align="right" valign="top"><?php echo FinanceData::FormatMoney($pirep->revenue);?></td>
	</tr>
	</table>
</td>
</tr>
</table>

<?php
if($fields)
{
?>
<h3>Flight Details</h3>			
<ul>
	<?php
	foreach ($fields as $field)
	{
		if($field->value == '')
		{
			$field->value = '-';
		}
	?>		
		<li><strong><?php echo $field->title ?>: </strong><?php echo $field->value ?></li>
<?php
	}
	?>
</ul>	
<?php
}
?>

<?php
if($pirep->log != '')
{
?>
<h3>Additional Log Information:</h3>
<p>
	<?php
	/* If it's FSFK, don't show the toggle. We want all the details and pretty
		images showing up by default */
	if($pirep->source != 'fsfk')
	{
		?>
	<p><a href="#" onclick="$('#log').toggle(); return false;">View Log</a></p>
	<p id="log" style="display: none;">
	<?php
	}
	else
	{
		echo '<p>';
	}
	?>
		<div>
		<?php
		# Simple, each line of the log ends with *
		# Just explode and loop.
		$log = explode('*', $pirep->log);
		foreach($log as $line)
		{
			echo $line .'<br />';
		}
		?>
		</div>
	</p>
</p>
<?php
}
?>

<?php
if($comments)
{
echo '<h3>Comments</h3>
	<table id="tabledlist" class="tablesorter">
<tbody>';

foreach($comments as $comment)
{
?>

<tr>
	<td width="15%" nowrap><strong><?php echo $comment->firstname . ' ' .$comment->lastname?></strong></td>
	<td align="left"><?php echo $comment->comment?></td>
</tr>
<?php
}

echo '</tbody></table>';
}
?>
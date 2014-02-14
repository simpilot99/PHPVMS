<aside>
	<section class="box" style="margin-top: 0px;">
		<h1>News</h1>
		<?php SimpleNews::NewsList(); ?>
	</section>
	
	<section class="box">
		<h1>Statistics</h1>
		Total Pilots: <?php echo StatsData::PilotCount(); ?><br />Pilots Pending: <?php echo count(PilotData::GetPendingPilots())?><br />Total Hours: <?php echo StatsData::TotalHours(); ?><br />Total Flights: <?php echo StatsData::TotalFlights(); ?><br />Total Distance Flown: <?php echo StatsData::TotalMilesFlown(); ?><br />Total Schedules: <?php echo StatsData::TotalSchedules (); ?><br />Total News Items: <?php echo StatsData::TotalNewsItems (); ?><br />Total Passangers Carried: <?php echo StatsData::TotalPaxCarried (); ?><br />Total Aircrafts In Fleet: <?php echo StatsData::TotalAircraftInFleet () ; ?>
	</section>
	
	<section class="box">
		<h1>Latest Pilots</h1>
		<?php MainController::Run('Pilots', 'RecentFrontPage', 5); ?>
	</section>
</aside>
<section id="contentFrontPage">
	<h1>Welcome to yourvaname!</h1>
	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vitae massa auctor, ornare lorem id, scelerisque lectus. Maecenas tellus massa, consectetur vitae massa ut, faucibus congue nibh. In placerat ac turpis at luctus. Nam neque mauris, mollis eu auctor sit amet, dictum non tellus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aliquam in arcu placerat, porta orci nec, faucibus lorem.
	<article>
		<h3>Latest Flights</h3>
		<?php
$count = 5;
$pireps = PIREPData::getRecentReportsByCount($count);
?>
		<table widtd="100%">
			<thead>
				<tr>
				<th>Flight No</th>
				<th>Departure</th>
				<th>Arrival</th>
				<th>Duration</th>
				<th>Pilot</th>
				<th>Status</th>
				</tr>
				</thead>
				<tbody>
				
			 <?php

			if(count($pireps) > 0)
			{
			  foreach ($pireps as $pirep)
			  {
			  {
				$pilotinfo = Pilotdata::getPilotdata($pirep->pilotid);
				$pilotid = Pilotdata::getPilotCode($pilotinfo->code, $pilotinfo->pilotid);
				
				if($pirep->accepted == '0') $status = 'REJECTED';
				if($pirep->accepted == '1') $status = 'ACCEPTED';
				else $status = 'PENDING'; 
			} 
			?>
				<tr>
				<td><?php echo $pirep->code.$pirep->flightnum; ?></td>
				<td><?php echo $pirep->depicao; ?></td>
				<td><?php echo $pirep->arricao; ?></td>
				<td><?php echo $pirep->flighttime; ?></td>
				<td><?php echo $pilotinfo->firstname.' '.$pilotinfo->lastname; ?></td>
				<td><?php
					
					if($pirep->accepted == PIREP_ACCEPTED)
						echo 'Accepted';
					elseif($pirep->accepted == PIREP_REJECTED)
						echo 'Rejected';
					elseif($pirep->accepted == PIREP_PENDING)
						echo 'Approval Pending';
					elseif($pirep->accepted == PIREP_INPROGRESS)
						echo 'Flight in Progress';
					
					?>
				</td>
				</tr>
				<?php
			  }}
			else
			{
				echo '<tr><td colspan="6">No flights yet made, first cooming soon!</td></tr>';
			}
			?>
			</tbody>
		</table>
	</article>
	<article>
		<h3>Live Flights</h3>
		<?php Template::Show('acarsmap.tpl'); ?>
	</article>
</section>
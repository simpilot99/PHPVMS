<?php
/**
Module Created By Vansers

This module is only use for phpVMS (www.phpvms.net) - (A Virtual Airline Admin Software)

@Created By Vansers
@Copyrighted @ 2011
@Under CC 3.0
@http://creativecommons.org/licenses/by-nc-sa/3.0/

// Version 1.0 (September 7.12) - Module Created
**/
?>
<?php
	if(!$flights)
	{
		echo '<div id="error">No Flights Flown with this aircraft!</div>';
		return;
	}
?>
<table id="tabledlist" class="tablesorter">
<thead>
<tr>
	<th>Flight Number</th>
	<th>Departure</th>
	<th>Arrival</th>
	<th>Flight Time</th>
	<th>Flight Date</th>
    <th>View</th>
</tr>
</thead>
<tbody>
<?php
foreach($flights as $flight)
{	
?>
<tr>
	<td><center><a href="<?php echo SITE_URL?>/index.php/pireps/view/<?php echo '' . $flight->flightnum . ''; ?>"><?php echo $flight->code.$flight->flightnum; ?></a>
	</center></td>
	<td><center><?php echo '<a href=" '.SITE_URL.'/index.php/airports/get_airport?icao='.$flight->depicao.'">'.$flight->depicao.'</a>';?>
	</center></td>
	<td><center><?php echo '<a href=" '.SITE_URL.'/index.php/airports/get_airport?icao='.$flight->arricao.'">'.$flight->arricao.'</a>';?></center></td>
	<td><center><?php echo $flight->flighttime; ?></center></td>
	<td><center><?php echo date(DATE_FORMAT, $flight->submitdate); ?></center></td>
    <td><center><a href="<?php echo url('/pireps/view/'.$flight->pirepid);?>">View</a></center></td>
<?php
}
?>
</tbody>
</table>
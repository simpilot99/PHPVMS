<table>
	<tr>
		<th>Flight Number</th>
		<th>Departure</th>
		<th>Arrival</th>
		<th>Aircraft</th>
		<th>Flight Time</th>
		<th>Submitted</th>
	</tr>

<?php
foreach($pireps as $report)
	{
	?>
	<tr>
		<td><?php echo $report->code . $report->flightnum; ?></td>
		<td><?php echo $report->depicao; ?></td>
		<td><?php echo $report->arricao; ?></td>
		<td><?php echo $report->aircraft . " ($report->registration)"; ?></td>
		<td><?php echo $report->flighttime; ?></td>
		<td><?php echo date(DATE_FORMAT, $report->submitdate); ?></td>
	</tr>
	<?php
	}
?>
</table>

<p></p>

<table>
<?php
if ($index != $count)
	{?>
		<td align="left">
			<form name="next20" id="next20" action="<?php echo SITE_URL?>/index.php/AllPIREPS/next" method="post">
				<input type="hidden" name="start" value="<?php echo ($index-$index);?>">
				<input type="submit" name="submit" value="Previous <?php echo $count;?>" />
			</form>
		</td>
	<?php
	}
else 
	{
		echo '<td></td>';
	}

if (count($pireps) == $count)
	{ ?>
		<td align="right">
			<form name="next20" id="next20" action="<?php echo SITE_URL?>/index.php/AllPIREPS/next" method="post">
				<input type="hidden" name="start" value="<?php echo $index;?>">
				<input type="submit" name="submit" value="Next <?php echo $count;?>" />
			</form>
		</td>
	<?php
	}
else
	{
		echo '<td></td>'; 
	}?>
</table>
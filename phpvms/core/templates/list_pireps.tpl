<?php
$getairline = $_GET['airline'];
?>
<table align="center" class="balancesheet" width="70%">
<thead>
<tr class="balancesheet_header"><td colspan="6">PIREP List</td></tr>
<tr>
	<th align="center"><font size="3">Flight #</font></th>
	<th align="center"><font size="3">Departure</font></th>
	<th align="center"><font size="3">Arrival</font></th>
	<th align="center"><font size="3">A/C Type</font></th>
	<th align="center"><font size="3">Duration</font></th>
	<th align="center"><font size="3">Status</font></th>
</tr>
<tr>
	<td align="center"><font size="3">-------</font></td>
	<td align="center"><font size="3">-------</font></td>
	<td align="center"><font size="3">-------</font></td>
	<td align="center"><font size="3">-------</font></td>
	<td align="center"><font size="3">-------</font></td>
	<td align="center"><font size="3">-------</font></td>
</tr>
</thead>
<tbody>
<?php
if(!$pireps)
{
?>
<td align="center" colspan="6"><b>You have no flights yet!</b></td>
<?php
}
else
{
	foreach($pireps as $report)
		{
			if(!$pireps)
			{
?>
				<td align="center" colspan="6"><b>You have no flights at this airline!</b></td>
<?php
			}
			elseif($getairline == $report->code)
			{
?>
				<tr>
				<td align="center"><b><a href="<?php echo url('/pireps/view/'.$report->pirepid);?>"><?php echo $report->code . $report->flightnum; ?></a></b></td>
				<td align="center"><b><?php echo $report->depicao; ?></b></td>
				<td align="center"><b><?php echo $report->arricao; ?></b></td>
				<td align="center"><b><?php echo $report->aircraft . " ($report->registration)"; ?></b></td>
				<td align="center"><b><?php echo $report->flighttime; ?></b></td>
				<td align="center">
<?php
		
					if($report->accepted == PIREP_ACCEPTED)
						echo '<div id="success"><b><font color="green">Accepted</font></b></div>';
					elseif($report->accepted == PIREP_REJECTED)
						echo '<div id="error"><b><font color="red">Rejected</font></b></div>';
					elseif($report->accepted == PIREP_PENDING)
						echo '<div id="error"><b><font color="orange">Pending Approval</font></b></div>';
					elseif($report->accepted == PIREP_INPROGRESS)
						echo '<div id="error">Flight in Progress</div>';
		
?>
			
				</td>
				</tr>
<?php
			}
			elseif($getairline == "")
			{
?>
<tr>
				<td align="center"><b><a href="<?php echo url('/pireps/view/'.$report->pirepid);?>"><?php echo $report->code . $report->flightnum; ?></a></b></td>
				<td align="center"><b><?php echo $report->depicao; ?></b></td>
				<td align="center"><b><?php echo $report->arricao; ?></b></td>
				<td align="center"><b><?php echo $report->aircraft . " ($report->registration)"; ?></b></td>
				<td align="center"><b><?php echo $report->flighttime; ?></b></td>
				<td align="center">
<?php
		
					if($report->accepted == PIREP_ACCEPTED)
						echo '<div id="success"><b><font color="green">Accepted</font></b></div>';
					elseif($report->accepted == PIREP_REJECTED)
						echo '<div id="error"><b><font color="red">Rejected</font></b></div>';
					elseif($report->accepted == PIREP_PENDING)
						echo '<div id="error"><b><font color="orange">Pending Approval</font></b></div>';
					elseif($report->accepted == PIREP_INPROGRESS)
						echo '<div id="error">Flight in Progress</div>';
		
?>
			
				</td>
				</tr>
				
				
<?php
			}
		}	
}

?>
<tr>
	<td align="center" colspan="6">
	<a href="<?php echo url('/airline');?>"><input type="button" value="Back to Airline Select"></a>
	</td>
</tr>
</tbody>
</table>


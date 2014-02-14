<?php
$gross = PilotFinance::airlinegrosssum();
$payrate = PilotFinance::airlinepayratesum();
$fuel = PilotFinance::airlinefuelsum();
$revenue = PilotFinance::airlinerevenuesum();
$pfname = Auth::$userinfo->firstname;
$plname = Auth::$userinfo->lastname;
?>
<h3>Financial Report for <?php echo SITE_NAME ;?></h3>
<table align="center" class="balancesheet" width="70%">
	<tr class="balancesheet_header">
		<td colspan="5">Airline Overview</td>
	</tr>
	<tr>
		<td align="left">Total gross income in <?php echo SITE_NAME ;?> is: <strong><?php echo FinanceData::formatMoney($gross) ;?></strong></td>
	</tr>
	<tr>
		<td align="left">Total pilot pay rate is : <strong><?php echo FinanceData::formatMoney($payrate);?> / hr</strong></td>
	</tr>
	<tr>
		<td align="left">Total fuel expenses in <?php echo SITE_NAME ;?> is: <strong><?php echo FinanceData::formatMoney($fuel); ?></strong></td>
	</tr>
	<tr>
		<td align="left">Total flight revenue in <?php echo SITE_NAME ;?> is: <strong><?php echo FinanceData::formatMoney($revenue) ;?></strong></td>
	</tr>
</table>
<br />
<hr>
<br />
<table align="center" class="balancesheet" width="70%">
	<tr class="balancesheet_header">
		<td colspan="5">Pilots List</td>
	</tr>
	<tr>
		<td align="center"><strong>Pilot ID</strong></td>
		<td align="center"><strong>Pilot Name</strong></td>
		<td align="center"><strong>Pilot Pay</strong></td>
		<td align="center"><strong>Revenue</strong></td>
		<td align="center"><strong>Status</strong></td>
	</tr>
<?php
if(!$allpilots)
{
?>
	<tr><td align="center" colspan="4">No Pilots</td></tr>
<?php
}
else
{
	$i = 1;
	foreach($allpilots as $pilot)
	{	
	
?>
	<tr> 
		<td align="center"><a href="<?php echo url('/profile/view/'.$pilot->pilotid);?>"><?php echo $pilot->code.''.$pilot->pilotid ;?></a></td>
		<td align="center"><?php echo $pilot->firstname.' '.$pilot->lastname ;?></td>
		<td align="center"><?php echo FinanceData::FormatMoney($pilot->totalpay) ;?></td>
		<td align="center">
		<?php 
		$pilotid = $pilot->pilotid ;
		$res = PilotFinance::pilotrevenuesum($pilotid);
		echo FinanceData::formatMoney($res);
		?></td>
		<td align="center">
		<?php
			if($res <= "0")
				{
					echo'<font color="red"><strong>Loss!</strong></font>' ;
				}
			else
				{
					echo'<font color="green"><strong>Profit</strong></font>' ;
				}
		
		?>
	</tr>
<?php
	}
}
?>
</table>
<br />
<hr>
<center><a href="<?php echo url('/profile') ;?>"><input type="image" value="Back To Try Out Center - pilot"></a></center>

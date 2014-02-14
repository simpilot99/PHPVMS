<?php
$gross = PilotFinance::grosssum();
$fuel = PilotFinance::fuelsum();
$expense = PilotFinance::expensesum();
$revenue = PilotFinance::revenuesum();
$pfname = Auth::$userinfo->firstname;
$plname = Auth::$userinfo->lastname;
?>
<h3>Financial Report for <?php echo $pfname.' '.$plname ;?></h3>
<table align="center" class="balancesheet" width="70%">
	<tr class="balancesheet_header">
		<td colspan="5">Pilot Finance Overview</td>
	</tr>
	<tr>
	<td>Your earnings in <?php echo SITE_NAME ;?> is : <strong><?php echo FinanceData::FormatMoney(Auth::$userinfo->totalpay) ;?></strong></td>
	</tr>
	<tr>
	<td>Your most recent pilot pay rate is : <strong><?php 
		$pilotid = Auth::$userinfo->pilotid;
		$paid = PIREPData::getLastReports($pilotid, 1);
		echo FinanceData::FormatMoney($paid->pilotpay) ;?> / hr</strong>
	</td>
	</tr>
	<tr>
	<td>Your total gross flight income in <?php echo SITE_NAME ;?> is: <strong><?php echo FinanceData::formatMoney($gross) ;?></strong></td>
	</tr>
	<tr>
	<td>Your total flight fuel expenses in <?php echo SITE_NAME ;?> is: <strong><?php echo FinanceData::formatMoney($fuel) ;?></strong></td>
	</tr>
	<tr>
	<td>Your total in flight expenses in <?php echo SITE_NAME ;?> is: <strong><?php echo FinanceData::formatMoney($expense) ;?></strong></td>
	</tr>
	<tr>
	<td>Your total flight revenue in <?php echo SITE_NAME ;?> is: <strong><?php echo FinanceData::formatMoney($revenue) ;?></strong></td>
	</tr>
</table>
<br />
<hr>
<br />
<?php
$pilotid = Auth::$userinfo->pilotid;
$reps = PIREPData::getLastReports($pilotid, 3);
?>
<table align="center" class="balancesheet" width="70%">
	<tr class="balancesheet_header">
		<td colspan="5">Last 3 Flights</td>
	</tr>
	<tr>
		<td align="center"><strong>Flight #</strong></td>
		<td align="center"><strong>Duration</strong></td>
		<td align="center"><strong>Pilot Pay</strong></td>
		<td align="center"><strong>Revenue</strong></td>
		<td align="center"><strong>Status</strong></td>
	</tr>
	<tr>
		<td align="center"><strong>------</strong></td>
		<td align="center"><strong>------</strong></td>
		<td align="center"><strong>------</strong></td>
		<td align="center"><strong>------</strong></td>
		<td align="center"><strong>------</strong></td>
	</tr>
<?php
if(!$reps)
{
?>
	<tr><td align="center" colspan="5">No Flights</td></tr>
<?php
}
else
{
	$i = 1;
	foreach($reps as $rep)
	{	
	
?>
	<tr> 
		<td align="center"><a href="<?php echo url('/pireps/view/'.$rep->pirepid);?>"><?php echo $rep->code.''.$rep->flightnum ;?></a></td>
		<td align="center"><?php echo $rep->flighttime_stamp ;?></td>
		<td align="center">
		<?php 
		$hours = intval($rep->flighttime);
		$minutes = ($rep->flighttime - $hours) ;
		$pay = $rep->pilotpay ;
		$payhr = ($pay / 60 * $minutes * 100);
		$totpay = ($pay * $hours) + $payhr ;
		echo FinanceData::FormatMoney($totpay) ;?></td>
		<td align="center"><?php echo FinanceData::FormatMoney($rep->revenue) ;?></td>
		<td align="center">
		<?php
			if($rep->revenue <= 0)
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
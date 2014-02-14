<h1>Pilot Centre</h1>

<p><strong>Welcome back <?php echo $userinfo->firstname . ' ' . $userinfo->lastname; ?>!</strong></p>
<h3>My Details</h3>
<div class="box">
<table width="100%" cellpadding="5" style="border-collapse:collapse; margin-top:5px;">
<tr>
<td style="border-bottom:1px solid #eee; border-top:1px solid #eee;"><b>Pilot ID</b></td>
<td style="border-bottom:1px solid #eee; border-top:1px solid #eee;"><?php echo $pilotcode; ?></td>
	
<td style="border-bottom:1px solid #eee; border-top:1px solid #eee;"><b>Your Rank</b></td>
<td style="border-bottom:1px solid #eee; border-top:1px solid #eee"><?php echo $userinfo->rank;?></td>
	
<td style="border-bottom:1px solid #eee; border-top:1px solid #eee;"><b>Latest Flight</b></td>
<td style="border-bottom:1px solid #eee; border-top:1px solid #eee">
			<?php
			if($report)
			{ ?>
			<a href="<?php echo url('pireps/view/'.$report->pirepid); ?>"><?php echo $report->code . $report->flightnum; ?></a>
			<?php
			} else { echo 'No PIREPs filed yet!'; }
			?>
</td>
</tr>
<tr>
<td style="border-bottom:1px solid #eee;"><b>Total Flights</b></td><td style="border-bottom:1px solid #eee;"><?php echo $userinfo->totalflights?></td>
<td style="border-bottom:1px solid #eee;"><b>Total Hours</b></td><td style="border-bottom:1px solid #eee;"><?php echo $userinfo->totalhours; ?></td>
<td style="border-bottom:1px solid #eee;"><b>Total Money</b></td><td style="border-bottom:1px solid #eee;"><?php echo FinanceData::FormatMoney($userinfo->totalpay)?></td>
</tr>
</table>
</div>

<h3>My Profile</h3>
<div class="box">
<table width="100%" cellpadding="5" style="border-collapse:collapse; margin-top:5px;">
<tr>
<td width="20%" align="center"><a href="<?php echo url('/profile/editprofile'); ?>">Edit Profile</a></td>
<td width="20%" align="center"><a href="<?php echo url('/profile/changepassword'); ?>">Change My Password</a></td>
<td width="20%" align="center"><a href="<?php echo url('/profile/badge'); ?>">View My Signature</a></td>
<td width="20%" align="center"><a href="<?php echo url('/profile/stats'); ?>">My Statistics</a></td>
<td width="20%" align="center"><a href="<?php echo url('/downloads'); ?>">View Downloads</a></td>
</tr>
</table>
</div>

<h3>Flight Operations</h3>
<div class="box">
<table width="100%" cellpadding="5" style="border-collapse:collapse; margin-top:5px;">
<tr>
<td align="center"><a href="<?php echo url('/pireps/mine');?>">View my PIREPs</a></td>
<td align="center"><a href="<?php echo url('/pireps/routesmap');?>">View map of my flights</a></td>
<td align="center"><a href="<?php echo url('/pireps/filepirep');?>">File a PIREP</a></td>
<td align="center"><a href="<?php echo url('/schedules/view');?>">View Flight Schedules</a></td>
<td align="center"><a href="<?php echo url('/schedules/bids');?>">My Bids</a></td>
<td align="center"><a href="<?php echo url('/finances');?>">View Finances</a></td>
</tr>
</table>
</div>

<h3>My Awards</h3>
<div class="box">
<?php
			if(!$allawards)
			{
				echo '<p>No awards yet</p>';
			}
			else
			{	
			
				/* To show the image:
				<img src="<?php echo $award->image?>" alt="<?php echo $award->descrip?>" />
				*/
							
			?>
			<ul>
				<?php foreach($allawards as $award){ ?>
				<li><?php echo $award->name ?></li>
				<?php } ?>
				
				
			</ul>	
			<?php
			}
			?>
</div>

<h3>ACARS Configurations</h3>
<div class="box">
<table width="100%">
<tr>
<td align="center"><a href="<?php echo actionurl('/acars/fsacarsconfig');?>">Download FSACARS Config</a></td>
<td align="center"><a href="<?php echo actionurl('/acars/fspaxconfig');?>">Download FSPax Config</a></td>
<td align="center"><a href="<?php echo actionurl('/acars/xacarsconfig');?>">Download XAcars Config</a></td>
<td align="center"><a href="<?php echo actionurl('/fsfk/vaconfig_template');?>">VA-Template.txt</a></td>
</tr>
</table>
</div>
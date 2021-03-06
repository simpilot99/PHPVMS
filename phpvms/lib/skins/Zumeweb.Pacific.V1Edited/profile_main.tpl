<style>
#innerwrapper{
background:none;
border:none;
padding:0px;
}
li{
list-style-type: none;
}
</style>

<h3>My Information</h3>
<div class="box">
<table width="98%" cellspacing="5" border="0" align="center">
<tr>

</tr>
  <tr>
  </tr>
  <tr>
    <td valign="top" width="20%" align="left"><strong>Pilot ID:</strong></td>
    <td valign="top" width="30%" align="left"><?php echo $pilotcode; ?></td>
    <td valign="top" width="20%" align="left"><strong>Location:</strong></td>
    <td valign="top" width="30%" align="left"><?php echo Countries::getCountryName($userinfo->location);?></td>
  </tr>
  <tr>
    <td align="left"><strong>E-Mail:</strong></td>
    <td align="left"><?php echo $userinfo->email; ?></td>
    <td align="left"><strong>Flights:</strong></td>
    <td align="left"><?php echo $userinfo->totalflights; ?></td>
  </tr>
  <tr>
    <td align="left"><strong>Rank:</strong></td>
    <td align="left"><?php echo $userinfo->rank; ?>
	<img src="<?php echo $userinfo->rankimage ?>" /></td>
    <td align="left"><strong>Hours:</strong></td>
    <td align="left"><?php echo $userinfo->totalhours; ?></td>
  </tr>
  <tr>
    <td align="left"><strong>Member Since:</strong></td>
    <td align="left"><?php echo date('jS F Y', strtotime($userinfo->joindate)); ?></td>
    <td align="left"><strong>Last PIREP Time:</strong></td>
    <td align="left"><?php echo $userinfo->lastpirep; ?> (GMT-5)</td>
  </tr>
    </tr>
    <tr>
	<td align="left"><strong>Last PIREP:</strong></td>
    <td align="left"><a 
						href="<?php echo url('pireps/view/'.$report->pirepid); ?>">
						<?php echo $report->code . $report->flightnum; ?></a></td>
    <td align="left"><strong>Current Location:</strong></td>
	<td align="left"><?php echo '<a href=" '.SITE_URL.'/index.php/airports/get_airport?icao='.$report->arricao.'">'.$report->arricao.'</a>';?>
  </tr>
  <tr>
    <td align="left"><strong>Hub:</strong></td>
    <td align="left"><?php echo '<a href=" '.SITE_URL.'/index.php/airports/get_airport?icao='.$userinfo->hub.'">'.$userinfo->hub.'</a>';?>
    <td align="left"><strong>Total Flights:</strong></td>
	<td align="left"><a href="http://hawaiianairwayspireps.comoj.com/phpvms/index.php/pireps/mine"><?php echo $userinfo->totalflights; ?></td></a>
    <tr>
	<td align="left"><strong>Pay Rate:</strong></td>
    <td align="left"><?php echo FinanceData::FormatMoney($userinfo->payrate) ?></td>
    <td align="left"><strong>Total Earnings:</strong></td>
    <td align="left"><?php echo FinanceData::FormatMoney($userinfo->totalpay) ?></td>
  </tr>
</table>

</div>
<div class="row-fluid">
<div class="span4">
<h3>Pilot Center</h3>
<div class="box">


<div class="container" style=" width:auto;">
<ul class="nav nav-list"><style>.nav li{margin-top:5px;}</style>
  
  <li><a href="<?php echo url('pireps/file'); ?>" class="btn"><i class=" icon-pencil"></i>File Flight Report</a></li>
  <li><a href="<?php echo url('schedules'); ?>" class="btn"><i class="icon-search"></i>Search & Book Flights</a></li>
  <li><a href="<?php echo url('schedules/bids'); ?>"class="btn"><i class="icon-th"></i>View Booked Flights</a> </li>
  <li><a href="<?php echo url('profile/stats'); ?>" class="btn"><i class="icon-list-alt"></i>My Statistics</a> </li>
  <li><a href="<?php echo url('profile/editprofile'); ?>" class="btn"><i class="icon-edit"></i>Edit My Profile</a></li>
  <li><a href="<?php echo url('profile/badge'); ?>" class="btn"><i class="icon-certificate"></i>My Signature</a> </li>
</ul>
</div>
</div>
</div>
<div class="span8">
<h3>Awards</h3>
<div class="box">
<table width="98%" align="center"><br>
<tr>
<td colspan="5" class="roster_header" align="left"></td>
  </tr>
  <tr>
    <td align="center" width="90%"><strong><?php
   if(!$allawards)
   {
    echo 'No awards Yet<br /><br />';
   }
   else
   {   
   ?>
              <ul>
                <?php foreach($allawards as $award){ ?>
                <img src="<?php echo $award->image?>" alt="<?php echo $award->descrip?>" title="<?php echo $award->name?>" alt="awards" />
                <?php } ?>
              </ul>
              <?php
   }
   ?></p></td>
  </tr>
 
</tr>
</table>

</div>
<img src="<?php echo SITE_URL; ?>/lib/skins/Zumeweb.Pacific.V1/images/gauges.png" style="margin-left:auto;margin-right:auto;"/>
</div>
</div>
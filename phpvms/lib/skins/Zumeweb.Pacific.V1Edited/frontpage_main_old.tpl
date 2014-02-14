<?php include_once("analyticstracking.php") ?>
<style>
#innerwrapper{
background:none;
border:none;
padding:0px;
}
</style>
<img style="border:1px solid lightgrey;"src="<?php echo SITE_URL;?>/lib/skins/Zumeweb.Pacific.V1Edited/images/default/web_banner.png"/>
<div class="row-fluid">
	<div class="span9">
		<h3>Welcome Aboard</h3>
		<div class="box">
			<p> Welcome to the Hawaiian Airways PHPVMS Flight Logging System. We are pleased to welcome all pilots to our state of the art, professional booking system that will now be used throughout the Hawaiian Airways family. This system is using PHPVMS which was actually designed for Flight Simulator. We found that it also works quite well with YSFlight and so we decided to use it. Please read an important welcome message on how to use the system:&nbsp;<a href="here">http://hawaiianairwayspireps.comoj.com/phpvms/index.php/pages/welcomemessage</a></p> 
		</div>
	</div>
	<div class="span3">
	<h3><strong>Quick</strong>Facts</h3>
		<div class="box">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><b><span class="badge badge-info"><?php echo StatsData::PilotCount(); ?></div></b></td>
    <td>Pilots</td>
  </tr>
  <tr>
    <td><b><span class="badge badge-info"><?php echo StatsData::TotalAircraftInFleet(); ?></div></b></td>
    <td>Aircraft</td>
  </tr>
  <tr>
    <td><b><span class="badge badge-info"><?php echo StatsData::TotalSchedules(); ?></div></b></td>
    <td>Schedules</td>
  </tr>
  <tr>
    <td><b><span class="badge badge-info"><?php echo StatsData::TotalFlights(); ?></div></b></td>
    <td>Completed Flights</td>
  </tr>
  <tr>
    <td><b><span class="badge badge-info"><?php echo StatsData::TotalFlightsToday(); ?></div></b></td>
    <td>Flight(s) Today</td>
  </tr>
  <tr>
  <td><b><span class="badge badge-info"><?php echo StatsData::TotalPaxCarried(); ?></div></b></td>
    <td>Passengers Carried</td>
  </tr>
  <tr>
    <td><b><span class="badge badge-info"><?php echo StatsData::TotalFuelBurned(); ?></div></b></td>
    <td>Fuel Burned</td>
  </tr>
  <tr>
    <td><b><span class="badge badge-info"><?php echo StatsData::TotalHours(); ?></div></b></td>
    <td>Hours Flown</td>
  </tr>
  <tr>
    <td><b><span class="badge badge-info"><?php echo StatsData::TotalMilesFlown(); ?></div></b></td>
    <td>Miles Flown</td>
  </tr>
 
</table>
		</div>
	</div>
</div>

<div class="row-fluid">	
	<div class="span9">
		<h3>Partners</h3>
		<div class="box">
		<center>
<div class="partners" >
	<a href="#" target="_blank">

		<img src="<?php echo SITE_URL; ?>/lib/skins/Zumeweb.Pacific.V1Edited/images/default/partner_logo.png" class="partnerimg">
	</a>
	<a href="#" target="_blank">
		<img src="<?php echo SITE_URL ?>/lib/skins/Zumeweb.Pacific.V1Edited/images/default/partner_logo_2.png" class="partnerimg">
	</a>

	<a href="#" target="_blank">
		<img src="<?php echo SITE_URL; ?>/lib/skins/Zumeweb.Pacific.V1Edited/images/default/partner_logo_3.png" class="partnerimg">
	</a>	
</div>
</center>
		</div>
		
	</div>
	<div class="span3">
		<h3>Newest Pilots and PIREPS</h3>
		<div class="box">
		<?php MainController::Run('Pilots', 'RecentFrontPage', 5); ?>
		<?php MainController::Run('PIREPS', 'RecentFrontPage', 5); ?>
		</div>
	</div>
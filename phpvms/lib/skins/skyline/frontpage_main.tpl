<script src="http://code.jquery.com/jquery-1.9.0.min.js"></script>

<h1>Welcome to Skyline</h1>
<div id="mainbox">

<h3>Welcome to Skyline</h3>
<div class="box">
<b>Skyline</b> is a template for phpVMS Virtual Airline Administration System.<br><br>Learn more about phpVMS at <a href="http://www.phpvms.net">http://www.phpvms.net</a>
<br>
</div>


<h3>About this Skin</h3>
<div class="box">
<p>I have included a number of features in this skin to make it look as modern and simple as possible. Here are just some of what is on offer.</p>
<ul>
<li><h2>User-friendly Design</h2></li>
<p>Skyline was built with the user in mind. Nothing to over-the-top, just clean and simple.</p>
<li><h2>Basic Pilot Centre</h2></li>
<p>Included is a basic revamp of the default Pilot Centre to make things just that little bit nicer...</p>
<li><h2>Drop Down Menus</h2></li>
<p>Included in the skin are drop-down menus which can be easily customised to suit your needs</p>
<li><h2>CSS Error Messages</h2>

<p>These will be displayed by phpVMS for success and error messages. I have also added a warning/alert message which can be used for whatever you like...</p>

<span id="toggle" style="cursor:pointer;"><b>Click here to toggle the error messages</b></span><br><br>
<div id="messages" style="display:none;">
<div class="success">This is an example of an success message</div>
<div class="warning">This is an example of a warning or alert message</div>
<div class="error">This is an example of an error message</div>
</div>
</li>
</ul>

<p>Oh, and its free. Just keep my name in the footer, that way everyone is happy :)</p>
</div>

<script>
$("#toggle").click(function () {
$("#messages").slideToggle("slow");
});
</script>

</div>


<div id="sidebar">

<h3>Recent PIREPs</h3>
<div class="box">
<?php MainController::Run('PIREPS', 'RecentFrontPage', 5); ?>
</div>

<h3>Newest Pilots</h3>
<div class="box">
<?php MainController::Run('Pilots', 'RecentFrontPage', 5); ?>
</div>

<h3>Airline Stats</h3>
<div class="box">
<strong>Total Pilots:</strong><?php echo StatsData::PilotCount(); ?><br>
<strong>Total Flights: </strong><?php echo StatsData::TotalFlights(); ?><br>
<strong>Total Hours Flown: </strong><?php echo StatsData::TotalHours(); ?><br>
<strong>Total Schedules: </strong><?php echo StatsData::totalschedules(); ?><br>
<strong>Flights Today: </strong><?php echo StatsData::totalflightstoday(); ?>
</div>

<h3>Users Online</h3>
<div class="box">
	<b>Pilots online:</b> <?php echo count($usersonline);?><br><br>
	<b>Guests online:</b> <?php echo count($guestsonline);?>
</div>
	
</div>
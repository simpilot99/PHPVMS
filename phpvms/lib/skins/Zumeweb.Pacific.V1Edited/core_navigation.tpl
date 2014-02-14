<script type="text/javascript">
    $(function () {
        $("[rel='tooltip']").tooltip();
    });
</script>
<li data-toggle="tooltip" rel="tooltip" title="Home"><a href="http://hawaiianairwayspireps.comoj.com/phpvms/"> <i class="icon-home icon-white"></i></a></li>
<?php
if(!Auth::LoggedIn())
{
	// Show these if they haven't logged in yet
?>
	<li data-toggle="tooltip" rel="tooltip" title="Login"><a href="<?php echo url('/login'); ?>"><i class="icon-off icon-white"></i></a></li>
	<li data-toggle="tooltip" rel="tooltip" title="Register"><a href="<?php echo url('/registration'); ?>"><i class="icon-pencil icon-white"></i></a></li>
<?php
}
else
{
	// Show these items only if they are logged in
?>
	<li data-toggle="tooltip" rel="tooltip" title="Pilot Center"><a href="<?php echo url('/profile'); ?>"><i class="icon-plane icon-white"></i></a></li>
	
<?php
}
?>

<li data-toggle="tooltip" rel="tooltip" title="Pilots"><a href="<?php echo url('/pilots'); ?>"><i class="icon-user icon-white"></i></a></li>
<li data-toggle="tooltip" rel="tooltip" title="Latest Flights"><a href="<?php echo url('/CurrentFlights') ?>"><i class="icon-map-marker icon-white"></i></a></li>

<?php

if(Auth::LoggedIn())
{
	if(PilotGroups::group_has_perm(Auth::$usergroups, ACCESS_ADMIN))
	{
		echo '<li data-toggle="tooltip" rel="tooltip" title="Admin Area"><a href="'.fileurl('/admin').'"><i class="icon-th-large icon-white"></i></a></li>';
	}
?>


<li data-toggle="tooltip" rel="tooltip" title="Logout"><a href="<?php echo url('/logout'); ?>"><i class="icon-off icon-white"></i></a></li>
<?php
}
?>       
<?php
# Skyline
# Developed by Iain Robb
# February 2013
# Template Skin for phpVMS Virtual Airline Administration http://www.phpvms.net
# This skin is relased under the Attribution-NonCommercial 3.0 Unported license (by-nc)
# View the full license at http://creativecommons.org/licenses/by-nc/3.0/
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" dir="ltr">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=7">
<title><?php echo $page_title; ?></title>

<link rel="stylesheet" media="all" type="text/css" href="<?php echo SITE_URL?>/lib/skins/skyline/styles.css" />

<?php 
# This bit is important!
echo $page_htmlhead; 
?>

</head>
<body>
<?php
# Make sure this remains the first thing after the <body> tag, otherwise all hell will break loose...

echo $page_htmlreq;
?>
<div id="body">
<div id="innerwrapper">
	<div id="topBanner">
	<span style="font-size:72px; margin:10px; position:absolute; color:#ccc; text-shadow:1px 1px 2px #999;">Skyline</span>
		<?php 
		if(Auth::LoggedIn() == false)
		{ ?>
			<div id="login">
			<span style="font-size:16px; font-family:arial; color:#555; margin-right:5px;"><b>Login</b></span>
			<form style="display:inline;" name="loginform" action="<?php echo url('/login'); ?>" method="post">
			<input type="text" name="email" value="email or ID" onClick="this.value=''" />
			<input type="password" name="password" value="password" onClick="this.value=''" />
			</div>
			<input type="hidden" name="remember" value="on" />
			<input type="hidden" name="redir" value="index.php/profile" />
			<input type="hidden" name="action" value="login" />
			<input type="submit" class="login-button" name="submit" value=">>" />
			</form>
		<?php
		}	
		else
		{
		$pilotid = PilotData::GetPilotCode(Auth::$userinfo->code, Auth::$userinfo->pilotid);
		?>
		<div id="loggedin" style="background:url('<?php echo PilotData::getPilotAvatar($pilotcode); ?>') no-repeat;">
		<strong><?php echo Auth::$userinfo->firstname.' '.Auth::$userinfo->lastname;?></strong> (<?php echo $pilotid;?>) | <strong>Total Flights: </strong><?php echo Auth::$userinfo->totalflights;?> | <strong>Total Hours: </strong><?php echo Auth::$userinfo->totalhours;?>
		</div>
		<?php
		}
		?>

	</div>
	
<ul id="nav">
<?php if(Auth::LoggedIn() == true){ ?>
    <li>
        <a href="<?php echo SITE_URL?>/index.php">Home</a>
    </li>

    <li>
        <a href="#">About</a>
        <ul>
            <li><a href="#">About Us</a></li>
            <li><a href="#">Fleet</a></li>
            <li><a href="#">Destinations</a></li>
            <li><a href="#">Route Map</a></li>
            <li><a href="#">Staff Team</a></li>
        </ul>
    </li>
    
    <li>
        <a href="<?php echo SITE_URL?>/index.php/profile">Pilot Centre</a>
    </li>
    <li>
        <a href="<?php echo SITE_URL?>/index.php/pilots">Pilots</a>
        <ul>
            <li><a href="#">Pilot Roster</a></li>
            <li><a href="#">Ranks</a></li>
            <li><a href="#">Events</a></li>
        </ul>
    </li>
    <li>
        <a href="<?php echo SITE_URL?>/index.php/pilots">Forum</a>
    </li>
    <li>
        <a href="<?php echo SITE_URL?>/index.php/logout">Logout</a>
    </li>
    <?php
    }
    else
    {
    ?>
    <li>
        <a href="<?php echo SITE_URL?>/index.php">Home</a>
    </li>

    <li>
        <a href="#">About</a>
        <ul>
            <li><a href="#">About Us</a></li>
            <li><a href="#">Fleet</a></li>
            <li><a href="#">Destinations</a></li>
            <li><a href="#">Route Map</a></li>
            <li><a href="#">Staff Team</a></li>
        </ul>
    </li>

    <li>
        <a href="<?php echo SITE_URL?>/index.php/pilots">Pilots</a>
        <ul>
            <li><a href="#">Pilot Roster</a></li>
            <li><a href="#">Ranks</a></li>
            <li><a href="#">Events</a></li>
        </ul>
    </li>
    <li>
        <a href="<?php echo SITE_URL?>/index.php/registration">Register</a>
    </li>
    <li>
        <a href="<?php echo SITE_URL?>/index.php/pilots">Forum</a>
    </li>
    <?php } ?>
</ul>
	
	<div id="bodytext">
	
	<?php
	 
	echo $page_content;
	
	?>
	
	
	</div>
	</div>
	<div id="footer">
	<span style="float:left; padding-left:5px; padding-top:7px;">
	<a class="facebook" href="#"></a>
	<a class="twitter" href="#"></a>
	<a class="youtube" href="#"></a>
	<?php
	# NOTE: You MUST keep the 'powered by phpVMS' otherwise this will be deemed an invalid license
	# Also please make sure you keep the 'Skin by Iain Robb' (or something to that effect, just include my name)
	?>
	</span>
	<p>Copyright &copy; <?php echo date('Y') ?> - <?php echo SITE_NAME?> | Skin by Iain Robb | Powered by <a href="http://www.phpvms.net" target="_blank">phpVMS</a></p>	
	</div>
</body>
</html>
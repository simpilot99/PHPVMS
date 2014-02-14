<?php
/**
 * 
 * STOP!!!!!!!!
 * 
 * Are you editing the crystal skin directly?
 * DON'T
 * 
 * Copy and rename the crystal folder. Otherwise it'll get 
 * overwritten in an update.
 * 
 * Also, READ THE DOCS
 * 
 *   http://www.phpvms.net/docs/skinning
 * 
 */
?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" dir="ltr">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=7">
<title><?php echo $page_title; ?></title>


<link rel="stylesheet" media="all" type="text/css" href="<?php echo SITE_URL?>/lib/skins/Zumeweb.Pacific.V1/bootstrap/css/bootstrap.css" />
<link rel="stylesheet" media="all" type="text/css" href="<?php echo SITE_URL?>/lib/skins/Zumeweb.Pacific.V1/styles.css" />
<link rel="stylesheet" href="<?php echo SITE_URL?>/lib/skins/Nevia/css/twitter.css">
<?php 
/* This is required, so phpVMS can output the necessary libraries it needs */
echo $page_htmlhead; 
?>

<?php /*Any custom Javascript should be placed below this line, after the above call */ ?>

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-45291405-1', 'comoj.com');
  ga('send', 'pageview');

</script>

<script type="text/javascript" src="http://ysfhq.com/snowstorm-min.js"></script>

</head>
<style>
#one-out {
    position:fixed;
    top:64px;left:15px;
    text-align:center;
    -webkit-transition-duration:0.3s;-moz-transition-duration:0.3s;-o-transition-duration:0.3s;transition-duration:0.3s;
    z-index:99999999;
	
 }
 
#oneout-inner {
    position:fixed;
    width:300px; height:auto;
    top:40px; left:-340px;
    padding:10px;
    background:#FFFFFF; /* change #FFFFFF; to transparent; if you want the background of the slide out tab to be transparent and not white*/
    -webkit-transition-duration:0.3s;-moz-transition-duration:0.3s;-o-transition-duration:0.3s;transition-duration:0.3s;
    text-align:left;
    z-index:99999999;
	background-color:#E47922; }
 
#oneout:hover {
    left:250px;
    z-index:99999999; }
 
#oneout:hover #oneout_inner {
    left:0px;
    z-index:99999999; }
 
.one-title {
    position:absolute;
    left:-11px; top:3px;
    font-family:arial; font-size:16px;    
    -webkit-transform:rotate(-90deg); -moz-transform:rotate(-90deg); -ms-transform:rotate(-90deg); -o-transform:rotate(-90deg); transform:rotate(-90deg);
    z-index:99999999; }
	
.over-lay{
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 10;
  background-color: rgba(0,0,0,0.5); /*dim the background*/
}

#content-back
	{
background-color:#E47922;
	}
</style>
<body>


<div id="content-back">
<div id="one-out"><div class="over-lay"></div><span class="one-title">
<font color="Purple">
Pilots Corner</font>
 
 
</span><div id="oneout-inner">

<center>
<font color= #ffffff>
<?php
                /*
                Quick example of how to see if they're logged in or not
                Only show this login form if they're logged in */
                if(Auth::LoggedIn() == false)
                { ?>
                        <form name="loginform" action="<?php echo url('/login'); ?>" method="post">
                         Sign-in with your pilot id or email, or <a href="<?php echo url('/registration'); ?>">register</a><br />
                        <input type="text" name="email" value="Email Address" onClick="this.value=''" />
                        <input type="password" name="password" value="Password" />
                        <input type="hidden" name="remember" value="on" />
                        <input type="hidden" name="redir" value="index.php/profile" />
                        <input type="hidden" name="action" value="login" />
</br>
                        <input type="submit" name="submit" value="Log In" />
                        </form>
                        <?php
                }      
                /* End the Auth::LoggedIn() if */
                else /* else - they're logged in, so show some info about the pilot, and a few links */
                {
               
                /*      Auth::$userinfo has the information about the user currently logged in
                        We will use this next line - this gets their full pilot id, formatted properly */
                $pilotid = PilotData::GetPilotCode(Auth::$userinfo->code, Auth::$userinfo->pilotid);
                ?>
               
                <img align="left" height="50px" width="50px" style="margin-right: 10px;"
                        src="c://users/chase/desktop/hvalogo2.png" />
 
                <strong>Pilot ID: </strong> <?php echo $pilotid ; ?>
                <strong>Rank: </strong><?php echo Auth::$userinfo->rank;?><br />
                <strong>Total Flights: </strong><?php echo Auth::$userinfo->totalflights?>, <strong>Total Hours: </strong><?php echo Auth::$userinfo->totalhours;?>
                <br />
                <a href="<?php echo url(''); ?>">Home</a> |  
                <a href="<?php echo url('/profile/');?>">View Pilot Center</a> |
                <a href="<?php echo url('/logout');?>">Logout</a>
                <?php
                } /* End the else */
                ?>
                </font>
 
 
<br></center></div></div></div>



<?php
			
			Template::Show('login_panel.tpl');
			?>
			

<div id="body">
<div style="margin-top:45px;">
		
	<div class="topNav">
		<ul >
			<?php
			/*	You can modify this template into a table or something, by default
				it's list elements inside of a UL. Here's a link with some info:
				
				http://articles.sitepoint.com/article/css-anthology-tips-tricks-4/2
			 */
			Template::Show('core_navigation.tpl');
			?>
		<center>
		</ul>
	</div>
</div>
<div class="box" style="margin-top:15px;height:25px;">
<?php
if(!Auth::LoggedIn())
{
?></center>
<i>You are not logged in, <a href="<?php echo url('login'); ?>">Click here</a> to log in</i>
<?php
}else{
?>
<i STYLE="float:left;">Welcome back, <a href="<?php echo url('profile'); ?>" ><?php echo Auth::$userinfo->firstname . " " . Auth::$userinfo->lastname ;?></a>! Today seems like a good day to fly.</i>
<a href="<?php echo url('logout'); ?>" class="btn btn-mini btn-danger" style="float:right;margin-left:3px;">Logout</a>
<a href="<?php echo url('profile'); ?>" class="btn btn-mini" style="float:right;">My profile</a>
<?php } ?>
</div>
<div id="innerwrapper">
	
	
	
	<?php
	/*	This will insert all of the "meat" of the page in there - the template
		which is generated, depending on which page you're on. To change these
		templates, check out the docs on the site. They're under the /core/templates
		folder, and to change them, copy them into the folder of your skin (the
		folder this file is in right now.
	 */
	 
	echo $page_content;
	
	?>
	
	<?php
$cws = new CodonWebService();


$usersonline = StatsData::UsersOnline();
$guestsonline = StatsData::GuestsOnline();

?>
	<footer>
	<div class="box" style="text-align:center; margin-top:5px;margin-bottom:5px; height:135px;"><p>
    You are accessing this site from IP address <?php echo $_SERVER["REMOTE_ADDR"]; ?>. <a href="http://www.hawaiianairwaysva.com" target="_blank"> Hawaiian Airways Virtual Airline</a>. <a href="http://www.phpvms.net" target="_blank"> CMS by phpVMS</a>. Website designed by <a href="http://zumeweb.com"> Zumeweb</a> and edited by Theo Bearman.
	<br>
	There is </strong><?php echo count(StatsData::UsersOnline()); ?> User(s) Online: |<?php
$shown = array();
foreach($usersonline as $pilot)
{
if(in_array($pilot->pilotid, $shown))
continue;
else
$shown[] = $pilot->pilotid;
echo "<a href=\"http://hawaiianairwayspireps.comoj.com/phpvms/index.php/profile/view/". $pilot->pilotid ."\"> {$pilot->firstname} {$pilot->lastname}</a> | ";
}
?> and <?php echo count(StatsData::GuestsOnline()); ?> Guest(s) Online.
	<br>
	All information on this site is for fight simulation purposes only. This site is for flight logging for pilots of <a href="http://www.hawaiianairwaysva.com" target="_blank"> Hawaiian Airways Virtual Airline</a> only.
	<center><a href="https://twitter.com/HAVA_YSFlight" target="_blank">
 <img src="https://dev.twitter.com/sites/default/files/images_documentation/bird_blue_32.png" /></a>
 &nbsp
 &nbsp
 &nbsp
  <a href="http://www.hawaiianairwaysva.com/" target="_blank">
 <img src="http://hawaiianairwayspireps.comoj.com/phpvms/photos/hava32.png" /></a>
 &nbsp
 &nbsp
 &nbsp
  <a href="https://www.facebook.com/HawaiianAirways" target="_blank">
 <img src="http://hawaiianairwayspireps.comoj.com/phpvms/photos/facebook32.png" /></a>
 </center>
<br>
Copyright &copy; 2014 <a href="http://www.hawaiianairwaysva.com" target="_blank"> Hawaiian Airways Virtual Airline</a>. All Rights Reserved.
 </p>
	</div>	
</div>
</body>
</footer>
</html>

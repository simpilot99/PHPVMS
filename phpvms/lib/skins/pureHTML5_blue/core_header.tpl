<img class="picture" src="http://www.placehold.it/630x260" alt="Header Picture" />
<section class="login">
	<?php if(Auth::LoggedIn()) { ?>
	<h1><?php echo Auth::$userinfo->firstname.'<br />'.Auth::$userinfo->lastname;?></h1>
		<strong>Rank: </strong><?php echo Auth::$userinfo->rank;?><br />
		<strong>Total Flights: </strong><?php echo Auth::$userinfo->totalflights?><br />
		<strong>Total Hours: </strong><?php echo Auth::$userinfo->totalhours;?><br />
		<br />
		<a href="<?php echo url('/pireps/new');?>">File a New PIREP</a><br />
		<a href="<?php echo url('/schedules/bids');?>">View My Bids</a><br />
		<a href="<?php echo url('/profile/');?>">Pilot Center</a><br />
	<?php } else { ?>
	<h1>Login</h1>
	<form name="loginform" id="login" action="<?php echo url('/login'); ?>" method="post">
		<label for="email">Pilot ID:</label>
		<input type="text" name="email" value="ICA" />
		<label for="password">Password:</label>
		<input type="password" name="password" />
		<input type="hidden" name="action" value="login" />
		<input type="submit" name="submit" value="LOGIN" />
	</form>
	<a href="<?php echo url('login/forgotpassword'); ?>">Forgot Password</a>
	<?php } ?>
</section>
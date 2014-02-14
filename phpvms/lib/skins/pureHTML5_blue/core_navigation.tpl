<ul>
	<li class="level-1"><a href="<?php echo url(''); ?>">Home</a></li>
	<li class="level-1">
		<a href="#">About Us +</a>
		<ul>
			<li class="level-2"><a href="#">Corporate</a></li>
			<li class="level-2"><a href="#">Fleet</a></li>
			<li class="level-2"><a href="#">Staff</a></li>
		</ul>
	</li>
	<li class="level-1"><a href="<?php echo url('registration'); ?>">Careers</a></li>
	<li class="level-1">
		<a href="#">Pilots +</a>
		<ul>
			<li class="level-2"><a href="<?php echo url('pilots'); ?>">Roster</a></li>
			<?php if(Auth::LoggedIn()) { ?>
			<li class="level-2"><a href="<?php echo url('profile'); ?>">Pilot Center</a></li>
			<li class="level-2"><a href="<?php echo url('schedules'); ?>">Schedules</a></li>
			<?php } else { ?>
			<li class="level-2"><a href="<?php echo url('login'); ?>">Login</a></li>
			<li class="level-2"><a href="#">Requirments</a></li>
			<?php } ?>
		</ul>
	</li>
	<li class="level-1"><a href="<?php echo url('contact'); ?>">Contact Us</a></li>
	<?php if(Auth::LoggedIn()) { ?>
	<li class="level-1"><a href="<?php echo url('logout'); ?>">Logout</a></li>
	<?php } ?>
</ul>
<div class="container">
<h3>Login</h3>
<form name="loginform" action="<?php echo url('/login');?>" method="post">
<?php echo "<?xml version='1.0'?>"; ?>
<?php
if(isset($message))
	echo '<p class="error">'.$message.'</p>';
?>
<dl>
	<dt>E-mail Address:</dt>
	<dd><input type="text" name="email" value="" />
	
	<dt>Password:</dt>
	<dd><input type="password" name="password" value="" />
	   
	<dt></dt>
	<dd>Remember Me? <input type="checkbox" name="remember" /></dd>

	<dt></dt>
	<dd><input type="hidden" name="redir" value="index.php/profile" />
		<input type="hidden" name="action" value="login" />
		<input type="submit" name="submit" class="btn" style="width:300px;"value="Log In" />   <a href="<?php echo url('Login/forgotpassword'); ?>">I forgot my password</a>

	
		
	
</dl>
</form>
</div>
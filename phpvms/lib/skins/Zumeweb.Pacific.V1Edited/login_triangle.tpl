<style>

</style>
<script type="text/javascript">
	jQuery(document).ready(
		function(){
			var h = ( jQuery(window).width() - 200 )/ 3;
			jQuery('.triangle').click(
				function(){
					jQuery(this).animate({ 'right':h+'px'}, 1200,
						function(){
								jQuery('#hidden').animate({ 'top':h+'px'}, 150, 
									function(){
										jQuery('#hidden').animate({'display':'block','width':'310px'}, 1000, 
											function(){jQuery('.close').css('display', 'block');
										});
									});
						} // call back end
					); // aniamte
			}); // click	
			
			jQuery('.close').click(
				function(){
					jQuery('#hidden').animate(
						{
						 'display':'block',
						 'height':'0px'
					}, 1000, function(){ jQuery('.triangle').animate({ 'top':0}, 1200);jQuery('#hidden').animate({ 'top':0}, 1200);	} );
					
			});	
	});
</script>

<div class="triangle-wrapper">
        
        <div class="triangle">
            <div id="triangle_text">
            	<img onselectstart="return false;" onload="myFunction()"  ondragstart="return false;" src="http://vdalairlines.com/new/lib/skins/VDAL/images/logo.png" width=160 />
            </div>
         </div>
         
         <div id="hidden" class="hidden">
            <div class="close">&#10006;</div>
            <div class="slide-content">
              <!-- edit content from here -->
                <?php 
		/* 
		Quick example of how to see if they're logged in or not
		Only show this login form if they're logged in */
		if(Auth::LoggedIn() == false)
		{ ?>
			<form name="loginform" action="<?php echo url('/login'); ?>" method="post">
			<br />
			<input class="input-block-level"  type="text" name="email" placeholder="Username" onClick="this.value=''" />
			<input class="input-block-level" type="password" name="password" placeholder="Password" />
			<input type="hidden" name="remember" value="on" />
			<input type="hidden" name="redir" value="index.php/profile" />
			<input type="hidden" name="action" value="login" />
			<input class="btn btn-block" type="submit" name="submit"  value="Log In" />
			</form>
			<?php
		}	
		/* End the Auth::LoggedIn() if */
		else /* else - they're logged in, so show some info about the pilot, and a few links */
		{
		
		/*	Auth::$userinfo has the information about the user currently logged in
			We will use this next line - this gets their full pilot id, formatted properly */
		$pilotid = PilotData::GetPilotCode(Auth::$userinfo->code, Auth::$userinfo->pilotid);
		?>
		
		<img align="left" height="50px" width="50px" style="margin-right: 10px;"
			src="<?php echo PilotData::getPilotAvatar($pilotid);?>" />

		<strong>Pilot ID: </strong> <?php echo $pilotid ; ?>
		<strong>Rank: </strong><?php echo Auth::$userinfo->rank;?><br />
		<strong>Total Flights: </strong><?php echo Auth::$userinfo->totalflights?><br />
		<strong style="margin-left:60px;">Total Hours: </strong><?php echo Auth::$userinfo->totalhours;?>
		<a class="btn btn-block btn-small" style="margin-top:2px;" href="#">Dispatch Office</a>
		<a class="btn btn-block btn-small" style="margin-top:2px;" href="#">Community Forum</a>
		<a class="btn btn-block btn-small" style="margin-top:2px;" href="#myReports" role="button" data-toggle="modal" >File a Pilot Report</a>
		<a class="btn btn-block btn-small" style="margin-top:2px;" href="#myDownloads" role="button" data-toggle="modal" >View Downloads</a>
		<a class="btn btn-block btn-small" style="margin-top:2px;" href="#myBadge" role="button" data-toggle="modal" >View Pilot Badge</a>
		<a class="btn btn-block btn-small" style="margin-top:2px;" href="#">Screenshot Center</a>
		<a class="btn btn-block btn-small" style="margin-top:2px;" href="#">Virtual Delta ACARS 2.0</a>
		<?php
		} /* End the else */
		?>
		<center><img onselectstart="return false;" ondragstart="return false;" style="margin-bottom:50px;"src="http://i.imm.io/Xd8b.png" /></center>
		</div>
	</div>
             <!-- stop editing right here :D -->
			</div>	
         </div>
     
      </div>
    <!----------------------------------------------->
      
  </div>


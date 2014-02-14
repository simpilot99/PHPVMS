<div class="container">
<?php
$badge_url =  fileurl(SIGNATURE_PATH.'/'.PilotData::GetPilotCode(Auth::$userinfo->code, Auth::$userinfo->pilotid).'.png');
$pilotcode = PilotData::GetPilotCode(Auth::$userinfo->code, Auth::$userinfo->pilotid);
?>
<h3>Pilot Badge</h3>
<p align="center">
	<img src="<?php echo $badge_url ?>" />
</p>
<p>
	<strong>Direct Link:</strong>
	<input onclick="this.select()" type="text" value="<?php echo $badge_url ?>" style="width: 100%" />
	<hr />
	<strong>Image Link:</strong>
	<input onclick="this.select()" type="text" value='<img src="<?php echo $badge_url ?>" />' style="width: 100%" />
	<strong>BBCode:</strong>
	<input onclick="this.select()" type="text" value='[img]<?php echo $badge_url ?>[/img]' style="width: 100%" />
</p>
</div>
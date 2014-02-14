<?php
if(!$lastbids)
{
echo 'No planned future flights';
return;
}
?>
<?php

foreach($lastbids as $lastbid)
{
?>
<?php
$params = $lastbid->pilotid;

$pilot = PilotData::GetPilotData($params);
$pname = $pilot->firstname;
$psurname = $pilot->lastname;
$psid = $pilot->id;
?>
<b> <a href="<?php echo SITE_URL?>/index.php/schedules/details/<?php echo $lastbid->code . $lastbid->flightnum; ?>"><?php echo $lastbid->code . $lastbid->flightnum; ?></a></b> -<b> <a href="<?php echo SITE_URL?>/index.php/profile/view/<?php echo $psid; ?>"><?php echo $pname; ?> <?php echo $psurname; ?></b> </a>
<div class="small"><i><small><?php echo $lastbid->depicao; ?> to <?php echo $lastbid->arricao; ?></small></i></div>

<?php
}
?>

<?php

foreach($pilots as $pilot)
{
?><a href="<?php echo url('/profile/view/'.$pilot->pilotid);?>"><?php echo PilotData::GetPilotCode($pilot->code, $pilot->pilotid). ' ' .$pilot->firstname . ' ' . $pilot->lastname?></a><br />
<?php
}
?>
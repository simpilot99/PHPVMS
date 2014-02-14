<table style="width:100%;">
<?php
foreach($pilots as $pilot){ ?>
<tr>
<td>
<a href="<?php echo url('/profile/view/'.$pilot->pilotid);?>">
<?php echo PilotData::GetPilotCode($pilot->code, $pilot->pilotid). ' ' .$pilot->firstname . ' ' . $pilot->lastname?>
</a>
</td>
<td><?php echo date("d/m/Y", strtotime($pilot->joindate));?></td>
</tr>
<?php
}
?>
</table>
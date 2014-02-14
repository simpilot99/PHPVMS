	<p><a href="<?php echo SITE_URL?>/index.php/booking">Search for Flights</a>&nbsp;&nbsp;&nbsp;&nbsp;<b><a href="<?php echo SITE_URL?>/index.php/booking/results">Search Results</a></b></p>
 <table width="100%" border="0">
  <tr>
    <td><strong>OPTIONS</strong></td>
		<td><strong>DEPART</strong></td>
    <td><strong>ARRIVE</strong></td>
    <td><strong>FLIGHT</strong></td>
    <td><strong>AIRCRAFT</strong></td>
    <td><strong>DURATION</strong></td>
    <td><strong>PRICE</strong></td>
  </tr>
<?php
if (!$allresults)
    { ?> 
		<tr><td>No Routes Found!</td></tr>
		<?php }
		else
    { ?>
		<?php foreach($allresults as $result) { ?>

	<tr>
  <td><b><a id="<?php echo $result->id; ?>" class="addbid" href="<?php echo SITE_URL?>/action.php/Schedules/addbid/">Add to Bid</a></b></td>
    <td><p><strong><?php echo $result->deptime; ?></strong><br />
      <?php echo $result->depname; ?>
    </p></td>
    <td><p><strong><?php echo $result->arrtime; ?></strong><br />
      <?php echo $result->arrname; ?></p></td>
    <td><strong><?php echo $result->code.''.$result->flightnum?></strong></td>
    <td><strong><?php echo $result->aircraft; ?></strong></td>
    <td><strong><?php echo $result->flighttime; ?></strong></td>
    <td><strong>$<?php echo $result->price; ?></strong></td>
  </tr>
  <?php } ?>
  <?php } ?>
</table>              



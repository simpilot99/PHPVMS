<!-- This addon was created by Stuart Boardman, with the help of Jeffrey Kobus, Adamm, Mark1Million & David Clark-->
<!-- Licensed under Creative Commons Attribution Non-commercial Share Alike, more info here: 
http://creativecommons.org/licenses/by-nc-sa/3.0/-->
<table width="100%">
	<tr>
	<td colspan="4"></td>
	</tr>
    <tr>
        <td>ICAO:</td>
        <td><?php echo $name->icao; ?></td>
        <td>Country:</td>
        <td><?php echo $name->country; ?></td>
    </tr>
    <tr>
        <td>Latitude:</td>
        <td><?php echo $name->lat; ?></td>
         <td>Longitude:</td>
        <td><?php echo $name->lng; ?></td>
    </tr>
    <tr>
    <td colspan="4"></td>
    </tr>
    <tr>
        <td>Total Arrivals:</td>
    	<td><?php echo AirportData::getarrflights($name->icao); ?></td>

    	<td>Total Departures:</td>
    	<td><?php echo AirportData::getdeptflights($name->icao); ?></td>
    </tr>
    <?php $icao = $name->icao;
	$params = array(
           'depicao'   => $icao,
           'accepted'  => '1'
          );
	$pireps = PIREPData::findPIREPS($params, 1);
	$deppirep = $pireps[0];
	$params = array(
           'arricao'   => $icao,
           'accepted'  => '1'
          );
	$pireps = PIREPData::findPIREPS($params, 1);
	$arrpirep = $pireps[0];
	?>
<?php $initialdep = substr($deppirep->firstname,0,1); ?>
<?php $initialarr = substr($arrpirep->firstname,0,1); ?>
	<tr>
		<td>Latest Arrival:</td>
		<td><a href="<?php echo SITE_URL?>/index.php/pireps/viewreport/<?php echo $arrpirep->pirepid;?>"><?php echo $arrpirep->code.$arrpirep->flightnum.' ('.$arrpirep->arricao.'-'.$arrpirep->arricao.')</a> '.$arrpirep->firstname.' '.$arrpirep->lastname?></td>
		<td>Latest Departure:</td>
		<td><a href="<?php echo SITE_URL?>/index.php/pireps/viewreport/<?php echo $deppirep->pirepid;?>"><?php echo $deppirep->code.$deppirep->flightnum.' ('.$deppirep->depicao.'-'.$deppirep->arricao.')</a> '.$deppirep->firstname.' '.$deppirep->lastname?></td>
	</tr>
    <tr>
        <td class="apthead" colspan="4"></td>
    </tr>
    <tr>
    	<td colspan="4"><a target="_blank" href="<?php echo $name->chartlink;?>"></a></td>
    </tr>
</table>
<script type="text/javascript" src="<?php echo fileurl('/lib/js/acarsmap.js');?>"></script>
<br />
<h3><?php echo $name->name;?></h3>
<script type="text/javascript">

      function initialize() {
        var mapDiv = document.getElementById('map-canvas');
        var map = new google.maps.Map(mapDiv, {
          center: new google.maps.LatLng(<?php echo $name->lat; ?> , <?php echo $name->lng; ?> ),
          zoom: 14,
          mapTypeId: google.maps.MapTypeId.SATELLITE
        });
      }
      

      google.maps.event.addDomListener(window, 'load', initialize);
    </script>
    <div id="map-canvas" style="width: 100%; height: 500px"></div>
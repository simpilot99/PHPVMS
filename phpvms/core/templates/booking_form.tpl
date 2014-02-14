<h1>Book a Flight</h1>
<form name="booking_search" id="booking_search" action="<?php echo SITE_URL?>/index.php/booking/search" method="post">
<br>
<table>
<thead>
<th><p><b>Departing From: </b></p></th><th><p><b>Arriving At:</b></p></th>
<thead>
<tbody>
<td>
<select id="depicao" name="depicao">
<option value="">--ORIGIN</option>
<?php
if(!$depairports) $depairports = array();
foreach($depairports as $airport)
{
echo '<option value="'.$airport->icao.'">'.$airport->icao
.' ('.$airport->name.')</option>';
}
?>
</select>
</td>
<td>
		<select id="arricao" name="arricao">
			<option value="">--DESTINATION</option>
		<?php
		if(!$depairports) $depairports = array();
			foreach($depairports as $airport)
			{
				echo '<option value="'.$airport->icao.'">'.$airport->icao
						.' ('.$airport->name.')</option>';
			}
		?>
			
		</select>
		</td>
		</thead>
		</table>
		<hr>
		<table border="1">
		<thead>
		<th><b>Adults (13+)</b></th><th><b>Children (2-12)</b></th>
		</thead>
		<tbody>
		<td>
		<center>
		<select id="adults" name="adults">
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
		<option value="6">6</option>
		<option value="7">7</option>
		<option value="8">8</option>
		</select>
		</center>
		</td>
		<td>
		<center>
		<select name="children" id="children">
    <option value="0">0</option>
		<option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
    <option value="6">6</option>
    <option value="7">7</option>
    <option value="8">8</option>
    </select>
    </center>
    </td>
    </tbody>
    </table>
		<hr>
		<!-- 
		<table>
		<thead>
		<th><p><b>Departure Date:</b></p></th><th><p><b>Arrival Date(Only If Return Flight):</b></p></th>
		</thead>
		<tbody>
		<td> -->
		<!-- removed for phpVMSBooking version 1.1 Update 
		<select id="depmonth" name="depmonth">
		<option value="feb10">Febuary 2010</option>
		<option value="mar10">March 2010</option>
		</select>
		<select id="depday" name="depday">
	<option value="01">01</option>
	<option value="02">02</option>
	<option value="03">03</option>
	<option value="04">04</option>
	<option value="05">05</option>
	<option value="06">06</option>
	<option value="07">07</option>
	<option value="08">08</option>
	<option value="09">09</option>
	<option value="10">10</option>
	<option value="11">11</option>
	<option value="12">12</option>
	<option value="13">13</option>
	<option value="14">14</option>
	<option value="15">15</option>
	<option value="16">16</option>
	<option value="17">17</option>
	<option value="18">18</option>
	<option value="19">19</option>
	<option value="20">20</option>
	<option value="21">21</option>
	<option value="22">22</option>
	<option value="23">23</option>
	<option value="24">24</option>
	<option value="25">25</option>
	<option value="26">26</option>
	<option value="27">27</option>
	<option value="28">28</option>
	<option value="29">29</option>
	<option value="30">30</option>
	<option value="31">31</option>
	  </select>
	  		</td>
				<td>
		<select id="arrmonth" name="arrmonth">
		<option value="dec09">December 2009</option>
		<option value="jan10">January 2010</option>
		<option value="feb10">Febuary 2010</option>
		<option value="mar10">March 2010</option>
		</select>
		<select id="arrday" name="arrday">
	<option value="01">01</option>
	<option value="02">02</option>
	<option value="03">03</option>
	<option value="04">04</option>
	<option value="05">05</option>
	<option value="06">06</option>
	<option value="07">07</option>
	<option value="08">08</option>
	<option value="09">09</option>
	<option value="10">10</option>
	<option value="11">11</option>
	<option value="12">12</option>
	<option value="13">13</option>
	<option value="14">14</option>
	<option value="15">15</option>
	<option value="16">16</option>
	<option value="17">17</option>
	<option value="18">18</option>
	<option value="19">19</option>
	<option value="20">20</option>
	<option value="21">21</option>
	<option value="22">22</option>
	<option value="23">23</option>
	<option value="24">24</option>
	<option value="25">25</option>
	<option value="26">26</option>
	<option value="27">27</option>
	<option value="28">28</option>
	<option value="29">29</option>
	<option value="30">30</option>
	<option value="31">31</option>
	  </select>
	  -->
	  </td>
		</tbody>
		</table>
		<input type="submit" name="submit" value="GO!">
		
		</form>

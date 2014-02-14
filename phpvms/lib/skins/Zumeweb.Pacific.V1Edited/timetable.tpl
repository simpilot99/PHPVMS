<h3>Hawaiian Airways Virtual Airline Timetable</h3>
<?php
	function openParent()
	{
		echo '<table width="100% border="1" rules="none"><tr>';
	}
	
	function closeParent()
	{
		echo '</tr></table>';
	}
	
	function openChild()
	{
		echo '<td><table width="310" border="1" rules="none">';
		echo '<tr bgcolor=#7B0D0D align="center"><td><font color=#FFFFFF>Departure</td><td><font color=#FFFFFF>Flight</td><td><font color=#FFFFFF>Destination</td><td><font color=#FFFFFF>Dep Time</td><td><font color=#FFFFFF>Arr Time</td></tr>';
	}
	
	function closeChild()
	{
		echo '</table></td>';
	}
	
	
	$query='SELECT * FROM '.TABLE_PREFIX.'schedules ORDER BY depicao,arricao,deptime';
	$list=DB::get_results($query);
	$curricao="";
	$grayrow=False;
	$currtable=1;
	$currrow=1;
	openParent();
	openChild();
	foreach($list as $route)
	{
		$grayrow=!$grayrow;
		
		if ($route->depicao!=$curricao || $currrow==1)
		{
			$curricao=$route->depicao;
			$grayrow=True;
			echo '<tr bgcolor=#C7DCF2 align="center"><td><strong>'.$curricao.'</strong></td><td>'.$route->flightnum.'</td><td>'.$route->arricao.'</td><td>'.$route->deptime;
		}
		else
		{
			if ($grayrow)
			{
				echo '<tr bgcolor=#E1E1E1 align="center"><td>';
			}
			else
			{
				echo '<tr align="center"><td>';
			}
			echo '&nbsp;</td><td>'.$route->flightnum.'</td><td>'.$route->arricao.'</td><td>'.$route->deptime;
		}
		echo '</td><td>'.$route->arrtime.'</td></tr>';
		$currrow++;
		if ($currrow>20)
		{
			$currrow=1;
			$currtable++;
			if ($currtable<4) //start new child only
			{
				closeChild();
				openChild();
			}
			else             //start new parent and child
			{
				closeChild();
				closeParent();
				echo '<br><br>';
				openParent();
				openChild();
				$currtable=1;
			}
		}
	}
	closeChild();
	closeParent();
	?>
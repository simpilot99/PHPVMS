<?php
        $flights = PIREPData::getRecentReportsByCount(10);                                                                      
        $string = "";
        foreach($flights as $flight)
        {       
                $string = $string.$flight->depicao.'+-+'.$flight->arricao.',+';
        }                                                                       
?>

<center><img src="http://www.gcmap.com/map?P=<?php echo $string ?>&MS=bm&MP=RECT&MR=350x350&PM=pemr:star10:white%2b%22%25I%22:white&PC=orange" width="970" height="320" /><br /></center>

<?php
$count = 10;
$pireps = PIREPData::getRecentReportsByCount($count);
?>

<table width="100%" border="0" bordercolor="#FFFFFF">
   <thead>
         <tr align="center" valign="middle" bgcolor="#7D95AF">
           <th>Flight #</th>
           <th>Departure</th>
           <th>Arrival</th>
           <th>Duration</th>
           <th>Pilot</th>
           <th>Aircraft</th>
         </tr>
        </thead>
        <tbody>
        
 <?php

if(count($pireps) > 0)
{
  foreach ($pireps as $pirep)
  {
        $pilotinfo = PilotData::getPilotData($pirep->pilotid);
        $pilotid = PilotData::getPilotCode($pilotinfo->code, $pilotinfo->pilotid); 

        echo "<tr>";
        echo "<td align=center> $pirepid $pirep->code $pirep->flightnum </td>";
        echo "<td align=center> $pirep->depname ($pirep->depicao) </td>";
        echo "<td align=center> $pirep->arrname ($pirep->arricao) </td>";
        echo "<td align=center> $pirep->flighttime </td>";
        echo "<td align=center> $pilotinfo->firstname $pilotinfo->lastname </td>";
        echo "<td align=center> $pirep->aircraft </td>";
        echo "</tr>";
  }
}
else
{
        echo "<tr><td>There are no recent flights!</td></tr>";
}
?>
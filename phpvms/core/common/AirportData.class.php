<?php
class AirportData extends CodonData {
    function getdeptflights($icao)  {
        $sql = 'SELECT pirepid FROM '.TABLE_PREFIX.'pireps
                                WHERE depicao="'.$icao.'"';
        $result = DB::get_results($sql);        
        return count($result);
    }
        function getarrflights($icao)  {
        $sql = 'SELECT pirepid FROM '.TABLE_PREFIX.'pireps
                                WHERE arricao="'.$icao.'"';
        $result = DB::get_results($sql);        
        return count($result);
    }
 }
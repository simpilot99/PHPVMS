<?php
class PilotFinance extends CodonData
{
	public function fuelsum()
	{
		$pilotid = Auth::$userinfo->pilotid;
		$qry =" SELECT SUM(fuelprice) as total FROM phpvms_pireps WHERE pilotid = '$pilotid'";
		$row = DB::get_row($qry);		
		return $row->total;
	}
	
	public function airlinefuelsum()
	{
		$qry =" SELECT SUM(fuelprice) AS total FROM phpvms_pireps";
		$row = DB::get_row($qry);		
		return $row->total;
	}
	
	public function airlinepayratesum()
	{
		$qry =" SELECT SUM(pilotpay) AS total FROM phpvms_pireps";
		$row = DB::get_row($qry);		
		return $row->total;
	}
	
	public function expensesum()
	{
		$pilotid = Auth::$userinfo->pilotid;
		$qry =" SELECT SUM(expenses) as total FROM phpvms_pireps WHERE pilotid = '$pilotid'";
		$row = DB::get_row($qry);		
		return $row->total;
	}

	public function airlineexpensesum()
	{
		$qry =" SELECT SUM(expenses) AS total FROM phpvms_pireps";
		$row = DB::get_row($qry);		
		return $row->total;
	}
	
	public function grosssum()
	{
		$pilotid = Auth::$userinfo->pilotid;
		$qry =" SELECT SUM(gross) as total FROM phpvms_pireps WHERE pilotid = '$pilotid'";
		$row = DB::get_row($qry);		
		return $row->total;
	}
	
	public function airlinegrosssum()
	{
		$qry =" SELECT SUM(gross) AS total FROM phpvms_pireps";
		$row = DB::get_row($qry);		
		return $row->total;
	}
	
	public function revenuesum()
	{
		$pilotid = Auth::$userinfo->pilotid;
		$qry =" SELECT SUM(revenue) as total FROM phpvms_pireps WHERE pilotid = '$pilotid'";
		$row = DB::get_row($qry);		
		return $row->total;
	}
	
	public function pilotrevenuesum($pilotid)
	{
		
		$qry = " SELECT SUM(revenue) AS total FROM phpvms_pireps WHERE pilotid='$pilotid'";
		$row = DB::get_row($qry);		
		return $row->total;
	}
	
	public function airlinerevenuesum()
	{
		$qry =" SELECT SUM(revenue) AS total FROM phpvms_pireps";
		$row = DB::get_row($qry);		
		return $row->total;
	}
	
	public function airlineflighttimesum()
	{
		$qry =" SELECT SUM(flighttime) AS total FROM phpvms_pireps";
		$row = DB::get_row($qry);		
		return $row->total;
	}
	
	public static function getReports($pilotid)
	{
		$sql = "SELECT * FROM phpvms_pireps	WHERE pilotid = '$pilotid'";
		$row = DB::get_row($sql);
		return $row;		
	}
	
}
?>


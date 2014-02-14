<?php
class Airline extends CodonModule
{
	public $title = 'PIREP List';
	
	public function index() 
	{
        $this->set('airlines', OperationsData::getAllAirlines());
		$this->set('userinfo', PilotData::getAllPilots());
		$this->set('$pireps', PIREPData::GetAllReportsForPilot(Auth::$userinfo->pilotid));
        $this->show('/pireplist/airline_select.tpl');
	}
	
	public function result() 
	{
		$this->set('userinfo', Auth::$userinfo);
		$this->set('pireps', PIREPData::GetAllReportsForPilot(Auth::$userinfo->pilotid));
		$this->set('airlines', OperationsData::getAllAirlines());
		$this->show('/pireplist/list_pireps.tpl');
	}
}
?>
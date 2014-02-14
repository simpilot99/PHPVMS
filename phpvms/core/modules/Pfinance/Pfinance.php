<?php
class Pfinance extends CodonModule    
{
		
	public $title = 'Financial Report';	
		
	public function index() 
    {
		
		$this->show('/pfinance/pilot_finance.tpl');
 	}
	
	public function pilots()
	{
		$this->set('allpilots', PilotData::findPilots(array()));
		$this->show('/pfinance/pilots_finance.tpl');
	}
}
?>
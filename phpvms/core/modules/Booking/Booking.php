<?php
/*
* Coding by Mitchell W
* vhmrw.site90.com
*/
class Booking extends CodonModule

{

		public function index()
		{
		$depapts = OperationsData::GetAllAirports();
		
		Template::Set('depairports', $depapts);
		Template::Show('booking_form.tpl');
		
		}
		public function search()
		{
		
			$params = array(
      's.depicao' => $this->post->depicao,
      's.arricao' => $this->post->arricao,
      's.enabled' => 1,
      );
 
		$schedules = SchedulesData::findSchedules($params);
		
		
		Template::Set('allresults', $schedules);
		Template::Show('booking_results.tpl');
		
		} 
 		public function results()
		{
		                       
		Template::Set('allresults', $schedules);
		Template::Show('booking_results.tpl');
		
		}
		public function confirm()
		{                                                           
		
		Template::Set('allresults', $schedules);
		Template::Show('booking_confirm.tpl');
		
		} 

}

?>

<?php

/*
* Coded by:
* Jeffrey Kobus
* www.fs-products.net
*/


class AllPIREPS extends CodonModule
{
	public $count = 20;

	public function index()
	{			
		$start = 0;
		$pireps = self::getPagination($this->count, $start);
		
		Template::Set('pireps', $pireps);
		Template::Set('index', $this->count);
		Template::Set('count', $this->count);		
		Template::Show('AllPIREPS.tpl');
	}
	
	public function next()
	{		
		$start = $this->post->start;
		
		$pireps = self::getPagination($this->count, $start);		
		$index = $this->count + $start;
		
		Template::Set('pireps', $pireps);
		Template::Set('index', $index);
		Template::Set('count', $this->count);
		Template::Show('AllPIREPS.tpl');
	}
	
	public function getPagination($count, $start)
	{
	
		$params = array();
		
		$pireps = PIREPData::findPIREPS($params, $count, $start);
		
		return $pireps;
	}
	
}
?>
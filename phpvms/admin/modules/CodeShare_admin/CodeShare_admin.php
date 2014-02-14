<?php


class CodeShare_admin extends CodonModule
{
    public function HTMLHead()
    {
        $this->set('sidebar', 'codeshare/sidebar_codeshare.tpl');
    }

    public function NavBar()
    {
        echo '<li><a href="'.SITE_URL.'/admin/index.php/codeshare_admin">Codeshares</a></li>';
    }

    public function index()
    {
        if($this->post->action == 'save_new_codeshare')
        {
            $this->save_new_codeshare();
        }
        elseif($this->post->action == 'save_edit_codeshare')
        {
            $this->save_edit_codeshare();
        }
        else
        {
            $this->set('codeshare', CodeShareData::get_upcoming_codeshares());
			$this->set('history', CodeShareData::get_past_codeshare());
            $this->show('codeshare/codeshare_index.tpl');
        }
    }
    public function get_codeshares()
    {
        $id = $_GET[id];
        $this->set('codeshare', CodeShareData::get_codeshares($id));
        
        $this->show('codeshare/codeshares_codeshare.tpl');
    }
    public function new_codeshare()
    {
        $this->show('codeshare/codeshare_new_form.tpl');
    }
    protected function save_new_codeshare()
    {
        $codeshare = array();

        $codeshare['schedid'] = DB::escape($this->post->schedid);
        $codeshare['airline'] = DB::escape($this->post->airline);
		$codeshare['image'] = DB::escape($this->post->image);

  

        foreach($codeshare as $test)
        {
            if(empty($test))
            {
                $this->set('codeshare', $codeshare);
                $this->show('codeshare/codeshare_new_form.tpl');
                return;
            }
        }

 

        CodeShareData::save_new_codeshare($codeshare['schedid'], $codeshare['airline'], $codeshare['image']);
                                   

       

        $this->set('codeshare', CodeShareData::get_upcoming_codeshares());
       
        $this->show('codeshare/codeshare_index.tpl');
    }
    public function edit_codeshare() {
            $id = $_GET[id];
            $codeshare = array();
            $codeshare = CodeShareData::get_codeshares($id);
            $this->set('codeshare', $codeshare);
            $this->show('codeshare/codeshare_edit_form.tpl');
    }
    protected function save_edit_codeshare()
    {
        $codeshare = array();

        $codeshare['schedid'] = DB::escape($this->post->schedid);
        $codeshare['airline'] = DB::escape($this->post->airline);
		$codeshare['image'] = DB::escape($this->post->image);
		$codeshare['id'] = DB::escape($this->post->id);
     

        CodeShareData::save_edit_codeshare($codeshare['schedid'], 
										   $codeshare['airline'],
										   $codeshare['image'],
										   $codeshare['id']);

        $id = $codeshare['id'];
        $this->set('codeshare', CodeShareData::get_codeshares($id));
        
        $this->show('codeshare/codeshares_codeshare.tpl');
    }
 
    public function delete_codeshare()
    {
        $id = $_GET[id];
        CodeShareData::delete_codeshare($id);

        $this->set('codeshare', CodeShareData::get_upcoming_codeshares());
        $this->show('codeshare/codeshare_index.tpl');
    }
}
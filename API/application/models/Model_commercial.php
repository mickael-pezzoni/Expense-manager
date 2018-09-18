<?php
/**
 * Created by PhpStorm.
 * User: micka
 * Date: 17/09/18
 * Time: 13:40
 */

class Model_commercial extends CI_Model{

    public function __construct(){
        parent::__construct();
        $this->table = 'Commercial';
    }

    public function getAll(){
        return $this->db->get($this->table);
    }

    public function getById($id){
        $this->db->select("*")
            ->from($this->table)
            ->where("idCommercial",$id)
            ->limit(1);
        return $this->db->get();
    }

    public function postCommercial(CommercialEntity $commercial){
        $data = array(
          "co_nom"=>$commercial->getNom(),
          "co_prenom"=>$commercial->getPrenom(),
            "email"=>$commercial->getEmail()
        );
        $this->db->insert($this->table,$data);
    }

    public function delete($id){
        $this->db->where("idComemrcial",$id);
    }
}
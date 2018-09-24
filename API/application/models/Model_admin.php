<?php
/**
 * Created by PhpStorm.
 * User: micka
 * Date: 21/09/18
 * Time: 10:46
 */

class Model_admin extends  CI_Model{

    public function __construct(){
        parent::__construct();
        $this->table = 'Admin';
    }

    public function getAll(){
        return $this->db->get($this->table);
    }

    public function getById($id){
        $this->db->select("*")
            ->from($this->table)
            ->where("idAdmin",$id);

        return $this->db->get();
    }

    public function postAdmin(AdminEntity $admin){
        $data = array(
            'ad_Nom' => $admin->getAdNom(),
            'ad_prenom' => $admin->getAdPrenom(),
            "idLogin" => $admin->getIdLogin()
        );

        $this->db->insert($this->table,$data);
    }

    public function delete($id){
        $this->db->where("idAdmin",$id)->delete($this->table);
    }
}
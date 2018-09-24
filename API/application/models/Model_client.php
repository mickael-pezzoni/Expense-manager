<?php
/**
 * Created by PhpStorm.
 * User: micka
 * Date: 22/09/18
 * Time: 18:35
 */

class Model_client extends CI_Model{

    public function __construct(){
        parent::__construct();
        $this->table = "Client";
    }

    public function getAll(){
        $this->db->select("*")
            ->from($this->table);
        return $this->db->get();
    }

    public function getById($id){
        $this->db->select("*")
            ->from($this->table)
            ->where("idClient",$id);
        return $this->db->get();
    }

    public function postClient(ClientEntity $client){
        $data = array(
            "cl_Nom" => $client->getNom(),
            "cl_Prenom" => $client->getPrenom(),
            "cl_tel" => $client->getTel(),
            "cl_email" => $client->getEmail(),
            "idEntreprise" => $client->getIdEntreprise()
        );
        $this->db->insert($this->table,$data);
    }

    public function delete($id){
        $this->db->where("idClient",$id)->delete($this->table);
    }
}
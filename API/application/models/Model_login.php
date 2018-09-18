<?php
/**
 * Created by PhpStorm.
 * User: micka
 * Date: 17/09/18
 * Time: 22:16
 */

class Model_login extends CI_Model{

    public  function __construct(){
        parent::__construct();
        $this->table = "Login";
    }

    public function getAll(){
        return $this->db->get($this->table);
    }

    public function getById($id){
        $this->db->select("*")
            ->from($this->table)
            ->where("idLogin",$id);

        return $this->db->get();
    }

    public function postLogin(LoginEntity $login){
        $data = array(
            'user'=>$login->getUser(),
            'password'=>$login->getPassword(),
            'mail'=>$login->getmail(),
            'idType'=>$login->getIdType()
        );
        $this->db->insert($this->table,$data);

    }

}
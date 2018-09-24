<?php
/**
 * Created by PhpStorm.
 * User: micka
 * Date: 21/09/18
 * Time: 10:55
 */

defined('BASEPATH') OR exit('No direct script access allowed');
require_once (CLASS_DIR.'AdminEntity.php');

class Admin extends  CI_Controller {

    private $admin = null;

    public function __construct(){
        parent::__construct();
        $this->load->database();
        header("Access-Control-Allow-Origin: *");
        $this->load->model("Model_admin");
    }

    public function index(){
        $admins = $this->Model_admin->getAll();
        if($admins->num_rows()>0){
            echo json_encode($admins->result());
        }
        else{
            header('HTTP/1.0 404 Not Found');
            echo json_encode("404 : Admins introuvable");
        }
    }

    public function getBydId($id){
        $admin = $this->Model_admin->getById($id);
        if($admin->num_rows()>0){
            echo json_encode($admin->result()[0]);
        }
        else{
            header("HTTP/1.0 404 Not Found");
            echo json_encode("404 : login $id not found");
        }
    }

    public function postAdmin(){
        $tabPost = array(
          'idLogin' => $this->input->post('idLogin',True),
          'nom' => $this->input->post("nom",True),
          "prenom" => $this->input->post("prenom",True)
        );

        $this->admin = new AdminEntity($tabPost['nom'],$tabPost['prenom'],$tabPost['idLogin']);
        if($this->admin->checkValue()){
            $this->Model_login->postAdmin($this->admin);
            echo json_encode("Admin created");
        }
        else{
            header("HTTP/1.0 400 Bad Request");
            echo json_encode("400: Empty value");
        }
    }
}
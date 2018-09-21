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
        $data = $this->Model_admin->getAll();
        if($data->num_rows()>0){
            echo json_encode($data->result());
        }
        else{
            header('HTTP/1.0 404 Not Found');
            echo json_encode("404 : Admins introuvable");
        }
    }

    public function getBydId($id){
        $data = $this->Model_admin->getById($id);
        if($data->num_rows()>0){
            echo json_encode($data->result());
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
        }
        else{
            header("HTTP/1.0 400 Bad Request");
            echo json_encode("400: Empty value");
        }
    }
}
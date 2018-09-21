<?php
/**
 * Created by PhpStorm.
 * User: micka
 * Date: 17/09/18
 * Time: 22:15
 */

defined('BASEPATH') OR exit('No direct script access allowed');

require_once (CLASS_DIR.'LoginEntity.php');

class Login extends CI_Controller{

    private $login = null;
    public function __construct(){
        parent::__construct();
        header("Access-Control-Allow-Origin: *");
        $this->load->database();
        $this->load->model("Model_login");
    }

    public function index(){
        $data = $this->Model_login->getAll();
        if($data->num_rows()>0){
            echo json_encode($data->result());
        }
        else{
            header("HTTP/1.0 404 Not Found");
            echo json_encode("404 : Commercial non trouvé");
        }
    }

    public function getById($id){
        $data = $this->Model_login->getById($id);
        if($data->num_rows()>0){
            echo json_encode($data->result());
        }
        else{
            header("HTTP/1.0 404 Not Found");
            echo json_encode("404 : commercial $id not found");
        }
    }

    public function checkLogin(){
        $data = array(
            'user'=>$this->input->post('login',True),
            'password'=>$this->input->post('pass',True)
        );

        $data = $this->Model_login->getByUserAndPassword($data['user'],$data['password']);
        if($data->num_rows() > 0){
            /*
            foreach ($data->result() as $row){
                $result [] = $row->user;
            }*/
            echo json_encode($data->result()[0]);
        }
        else{
            echo json_encode(["err"=>"Bad login"]);
        }
    }

    public function postLogin(){
        $tabPost = array(
            'user'=>$this->input->post('user',True),
            'password'=>$this->input->post('password',True),
            'mail'=>$this->input->post('mail',True),
            'idType'=>$this->input->post('idType',True)
        );
        $this->login = new LoginEntity($tabPost['user'],$tabPost['password'],$tabPost['mail'],$tabPost['idType']);
        if($this->login->checkValue()){
            $this->Model_login->postLogin($this->login);
            echo json_encode("Login created");
        }
        else{
            header("HTTP/1.0 400 Bad Request");
            echo json_encode("400: Empty value");
        }
    }

    public function deleteById($id){
        if($this->Model_login->getById($id)->num_rows()>0){
            $this->Model_login->deleteById($id);
            echo json_encode("user".$id.' deleted');
        }
        else{
            header("HTTP/1.0 404 Not Found");
            echo json_encode("404: user $id not found");
        }
    }

}
<?php
/**
 * Created by PhpStorm.
 * User: micka
 * Date: 22/09/18
 * Time: 18:43
 */

defined('BASEPATH') OR exit('No direct script access allowed');
require_once (CLASS_DIR.'ClientEntity.php');

class Client extends  CI_Controller{

    private $client;

    public function __construct(){
        parent::__construct();
        $this->load->database();
        header("Access-Control-Allow-Origin: *");
        $this->load->model("Model_client");
    }

    public function index(){
        $clients = $this->Model_client->getAll();

        if($clients->num_rows()>0){
            echo json_encode($clients->result());
        }
        else{
            header("HTTP/1.0 404 Not Found");
            echo json_encode("404 : client non trouvé");
        }
    }

    public function getById($id){
        $client = $this->Model_client->getById($id);

        if($client->num_rows()>0){
            echo json_encode($client->result()[0]);
        }

        else{
            header("HTTP/1.0 404 Not Found");
            echo json_encode("404 : client $id not found");
        }
    }

    public function postClient(){
        $tabPost = array(
            "nom" => $this->input->post('nom',True),
            "prenom" => $this->input->post("prenom",true),
            "email" => $this->input->post("email",True),
            "tel" => $this->input->post("tel",True),
            "idEntreprise" => $this->input->post("idEntreprise",True)

        );
        $this->client = new ClientEntity($tabPost['nom'],$tabPost['prenom'],$tabPost['tel'],$tabPost['email'],$tabPost['idEntreprise']);
        if($this->client->checkValue()){
            $this->Model_client->postClient($this->client);
            echo json_encode("Client created");
        }
        else{
            header("HTTP/1.0 400 Bad Request");
            echo json_encode("400: Empty value");
        }
    }

}
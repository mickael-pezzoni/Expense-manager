<?php
/**
 * Created by PhpStorm.
 * User: micka
 * Date: 17/09/18
 * Time: 11:04
 */

defined('BASEPATH') OR exit('No direct script access allowed');
require_once (CLASS_DIR.'CommercialEntity.php');

class Commercial extends CI_Controller{

    private $commercial = null;

    public function __construct(){
        parent::__construct();
        $this->load->database();
        $this->load->model("Model_commercial");
    }

    public function index(){
        $data = $this->Model_commercial->getAll();
        if($data->num_rows()>0){
            echo json_encode($data->result());
        }
        else{
            header("HTTP/1.0 404 Not Found");
            echo json_encode("404 : Commercial non trouvé");
        };
    }

    public function getById($id){
        $data = $this->Model_commercial->getById($id);
        if($data->num_rows()>0){
            foreach ($data->result() as $row){
                $result[] = array("idComptable"=>intval($row->idCommercial),"nom"=>$row->co_Nom);
            }
            echo json_encode($data->result());
        }
        else{
            header("HTTP/1.0 404 Not Found");
            echo json_encode("404 : commercial #$id not found");
        }
    }

    public function postCommercial(){

        $tabPost = array(
            'nom'=>$this->input->post('nom',True),
            'prenom'=>$this->input->post('prenom',True),
            'email'=>$this->input->post('email',True)
        );
        $this->commercial = new CommercialEntity($tabPost['nom'],$tabPost['prenom'],$tabPost['email']);
        if($this->commercial->checkValues()){
            $this->Model_commercial->postCommercial($this->commercial);
            echo json_encode('Commercial created');
        }
        else{
            header("HTTP/1.0 400 Bad Request");
            echo json_encode("400: Empty value");
        }


    }
}
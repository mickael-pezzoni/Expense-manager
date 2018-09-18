<?php
/**
 * Created by PhpStorm.
 * User: micka
 * Date: 17/09/18
 * Time: 14:38
 */


class CommercialEntity{


    private $nom = null;
    private $prenom = null;
    private $email = null;
    private $id = null;
    private $idLogin = null;


    public function __construct($nom,$prenom,$email,$idLogin, $id=null){
        $this->nom = $nom;
        $this->prenom = $prenom;
        $this->email = $email;
        $this->id = $id;
    }

    public function getNom(){
        return $this->nom;
    }

    public function getPrenom(){
        return $this->prenom;
    }

    public function getId(){
        return $this->id;
    }

    public function getEmail(){
        return $this->email;
    }

    /**
     * @param mixed $nom
     */
    public function setNom($nom)
    {
        $this->nom = $nom;
    }

    /**
     * @param mixed $prenom
     */
    public function setPrenom($prenom)
    {
        $this->prenom = $prenom;
    }

    /**
     * @param mixed $id
     */
    public function setId($id)
    {
        $this->id = $id;
    }

    public function setEmail($mail){
        $this->email = $mail;
    }

    public function checkValues(){
        if($this->nom!=null && $this->prenom!=null && $this->email != null){
            return true;
        }
        else{
            return false;
        }
    }

}
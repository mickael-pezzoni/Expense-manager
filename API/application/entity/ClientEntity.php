<?php
/**
 * Created by PhpStorm.
 * User: micka
 * Date: 22/09/18
 * Time: 18:31
 */

class ClientEntity{

    private $idClient = null;
    private $nom = null;
    private $prenom = null;
    private $tel = null;
    private $email= null;
    private $idEntreprise = null;


    public function __construct($nom, $prenom, $tel, $email, $idEntreprise, $idClient = null){
        $this->idClient = $idClient;
        $this->nom = $nom;
        $this->prenom = $prenom;
        $this->tel = $tel;
        $this->email = $email;
        $this->idEntreprise =  $idEntreprise;
    }

    /**
     * @return null
     */
    public function getIdClient()
    {
        return $this->idClient;
    }

    /**
     * @param null $idClient
     */
    public function setIdClient($idClient): void
    {
        $this->idClient = $idClient;
    }

    /**
     * @return null
     */
    public function getNom()
    {
        return $this->nom;
    }

    /**
     * @param null $nom<IfModule mod_rewrite.c>
     */
    public function setNom($nom): void
    {
        $this->nom = $nom;
    }

    /**
     * @return null
     */
    public function getPrenom()
    {
        return $this->prenom;
    }

    /**
     * @param null $prenom
     */
    public function setPrenom($prenom): void
    {
        $this->prenom = $prenom;
    }

    /**
     * @return null
     */
    public function getTel()
    {
        return $this->tel;
    }

    /**
     * @param null $tel
     */
    public function setTel($tel): void
    {
        $this->tel = $tel;
    }

    /**
     * @return null
     */
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * @param null $email
     */
    public function setEmail($email): void
    {
        $this->email = $email;
    }

    /**
     * @return null
     */
    public function getIdEntreprise()
    {
        return $this->idEntreprise;
    }

    /**
     * @param null $idEntreprise
     */
    public function setIdEntreprise($idEntreprise): void
    {
        $this->idEntreprise = $idEntreprise;
    }

    public function checkValue(){
        if($this->nom != null && $this->prenom != null
        && $this->tel != null && $this->email != null && $this->idEntreprise != null){
            return true;
        }
        else{
            return false;
        }
    }

}
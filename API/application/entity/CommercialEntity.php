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
<<<<<<< HEAD


    public function __construct($nom,$prenom,$email, $id=null){
=======
    private $rib = null;
    private $idLogin = null;


    public function __construct($nom,$prenom,$email,$rib, $idLogin, $id=null){
>>>>>>> c08069167e0067f0082f2989865cc659b764bf32
        $this->nom = $nom;
        $this->prenom = $prenom;
        $this->email = $email;
        $this->id = $id;
        $this->rib = $rib;
        $this->idLogin = $idLogin;
    }

    /**
     * @param null $idLogin
     */
    public function setIdLogin($idLogin)
    {
        $this->idLogin = $idLogin;
    }

    /**
     * @return null
     */
    public function getRib()
    {
        return $this->rib;
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
     * @return null
     */
    public function getIdLogin()
    {
        return $this->idLogin;
    }

    /**
     * @param null $rib
     */
    public function setRib($rib)
    {
        $this->rib = $rib;
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
        if($this->nom!=null && $this->prenom!=null && $this->email != null && $this->idLogin!=null && $this->rib!=null){
            return true;
        }
        else{
            return false;
        }
    }

}
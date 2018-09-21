<?php
/**
 * Created by PhpStorm.
 * User: micka
 * Date: 21/09/18
 * Time: 10:11
 */

class AdminEntity{

    private $idAdmin = null;
    private $ad_Nom = null;
    private $ad_Prenom = null;
    private $idLogin = null;

    public function __construct($ad_Nom, $ad_Prenom, $idLogin,$idAdmin = null){
        $this->idLogin = $idLogin;
        $this->ad_Nom = $ad_Nom;
        $this->ad_Prenom = $ad_Prenom;
        $this->idLogin = $idLogin;
    }

    /**
     * @return null
     */
    public function getIdAdmin()
    {
        return $this->idAdmin;
    }

    /**
     * @param null $idAdmin
     */
    public function setIdAdmin($idAdmin): void
    {
        $this->idAdmin = $idAdmin;
    }

    /**
     * @return null
     */
    public function getAdNom()
    {
        return $this->ad_Nom;
    }

    /**
     * @param null $ad_Nom
     */
    public function setAdNom($ad_Nom): void
    {
        $this->ad_Nom = $ad_Nom;
    }

    /**
     * @return null
     */
    public function getAdPrenom()
    {
        return $this->ad_Prenom;
    }

    /**
     * @param null $ad_Prenom
     */
    public function setAdPrenom($ad_Prenom): void
    {
        $this->ad_Prenom = $ad_Prenom;
    }

    /**
     * @return null
     */
    public function getIdLogin()
    {
        return $this->idLogin;
    }

    /**
     * @param null $idLogin
     */
    public function setIdLogin($idLogin): void
    {
        $this->idLogin = $idLogin;
    }

    public function checkValue(){
        if($this->idLogin != null && $this->ad_Prenom != null && $this->ad_Nom != null){
            return true;
        }
        else{
            return false;
        }
    }
}
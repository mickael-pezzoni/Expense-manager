<?php
/**
 * Created by PhpStorm.
 * User: micka
 * Date: 22/09/18
 * Time: 18:54
 */

class EntrepriseEntity{

    private $idEntreprise = null;
    private $nom = null;
    private $noSiret = null;
    private $nbSalaries = null;
    private $adresse = null;
    private $codePostal = null;

    public function __construct($nom, $noSiret, $nbSalaries, $adresse, $codePostal, $idEntreprise=null){
        $this->idEntreprise = $idEntreprise;
        $this->nom = $nom;
        $this->noSiret = $noSiret;
        $this->nbSalaries = $nbSalaries;
        $this->adresse = $adresse;
        $this->codePostal = $codePostal;
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

    /**
     * @return null
     */
    public function getNom()
    {
        return $this->nom;
    }

    /**
     * @param null $nom
     */
    public function setNom($nom): void
    {
        $this->nom = $nom;
    }

    /**
     * @return null
     */
    public function getNoSiret()
    {
        return $this->noSiret;
    }

    /**
     * @param null $noSiret
     */
    public function setNoSiret($noSiret): void
    {
        $this->noSiret = $noSiret;
    }

    /**
     * @return null
     */
    public function getNbSalaries()
    {
        return $this->nbSalaries;
    }

    /**
     * @param null $nbSalaries
     */
    public function setNbSalaries($nbSalaries): void
    {
        $this->nbSalaries = $nbSalaries;
    }

    /**
     * @return null
     */
    public function getAdresse()
    {
        return $this->adresse;
    }

    /**
     * @param null $adresse
     */
    public function setAdresse($adresse): void
    {
        $this->adresse = $adresse;
    }

    /**
     * @return null
     */
    public function getCodePostal()
    {
        return $this->codePostal;
    }

    /**
     * @param null $codePostal
     */
    public function setCodePostal($codePostal): void
    {
        $this->codePostal = $codePostal;
    }

}
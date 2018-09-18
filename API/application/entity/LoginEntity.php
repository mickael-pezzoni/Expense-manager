<?php
/**
 * Created by PhpStorm.
 * User: micka
 * Date: 18/09/18
 * Time: 13:37
 */

class LoginEntity{

    private $idLogin = null;
    private $user = null;
    private $password = null;
    private $mail = null;
    private $idType = null;

    /**
     * @return null
     */

    public function __construct($user,$password,$mail,$idType,$idLogin=null){
        $this->user = $user;
        $this->password = $password;
        $this->idType = $idType;
        $this->mail = $mail;
        $this->idLogin = $idLogin;
    }

    public function getIdLogin()
    {
        return $this->idLogin;
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
    public function getUser()
    {
        return $this->user;
    }

    /**
     * @param null $user
     */
    public function setUser($user)
    {
        $this->user = $user;
    }

    /**
     * @return null
     */
    public function getPassword()
    {
        return $this->password;
    }

    /**
     * @param null $password
     */
    public function setPassword($password)
    {
        $this->password = $password;
    }

    /**
     * @return null
     */
    public function getMail()
    {
        return $this->mail;
    }

    /**
     * @param null $mail
     */
    public function setMail($mail)
    {
        $this->mail = $mail;
    }

    /**
     * @return null
     */
    public function getIdType()
    {
        return $this->idType;
    }

    /**
     * @param null $idType
     */
    public function setIdType($idType)
    {
        $this->idType = $idType;
    }

    public function checkValue(){
        if($this->mail!=null && $this->idType!=null && $this->user!=null && $this->password!=null){
            return true;
        }
        else{
            return false;
        }
    }


}
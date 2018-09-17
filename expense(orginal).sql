#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Entreprise
#------------------------------------------------------------

CREATE TABLE Entreprise(
        idEntreprise Int  Auto_increment  NOT NULL ,
        en_Nom       Varchar (50) NOT NULL ,
        en_noSiret   Int NOT NULL ,
        en_ville     Varchar (100) NOT NULL ,
        nbSalaries   Int NOT NULL ,
        en_adresse   Varchar (100) NOT NULL ,
        codePostal   Int NOT NULL
	,CONSTRAINT Entreprise_PK PRIMARY KEY (idEntreprise)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: typeUtilisateur
#------------------------------------------------------------

CREATE TABLE typeUtilisateur(
        idType Int  Auto_increment  NOT NULL ,
        type   Varchar (50) NOT NULL
	,CONSTRAINT typeUtilisateur_PK PRIMARY KEY (idType)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Login
#------------------------------------------------------------

CREATE TABLE Login(
        idLogin  Int  Auto_increment  NOT NULL ,
        user     Varchar (50) NOT NULL ,
        password Varchar (50) NOT NULL ,
        mail     Varchar (100) NOT NULL ,
        idType   Int NOT NULL
	,CONSTRAINT Login_PK PRIMARY KEY (idLogin)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Commercial
#------------------------------------------------------------

CREATE TABLE Commercial(
        idCommercial Int  Auto_increment  NOT NULL ,
        co_Nom       Varchar (50) NOT NULL ,
        co_Prenom    Varchar (50) NOT NULL ,
        rib          Varchar (30) NOT NULL ,
        idLogin      Int NOT NULL
	,CONSTRAINT Commercial_PK PRIMARY KEY (idCommercial)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Client
#------------------------------------------------------------

CREATE TABLE Client(
        idClient     Int  Auto_increment  NOT NULL ,
        cl_Nom       Varchar (50) NOT NULL ,
        cl_Prenom    Varchar (50) NOT NULL ,
        cl_tel       Numeric NOT NULL ,
        cl_email     Varchar (50) NOT NULL ,
        idEntreprise Int NOT NULL
	,CONSTRAINT Client_PK PRIMARY KEY (idClient)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Comptable
#------------------------------------------------------------

CREATE TABLE Comptable(
        idComptable Int  Auto_increment  NOT NULL ,
        cp_Nom      Varchar (50) NOT NULL ,
        cp_Prenom   Varchar (50) NOT NULL ,
        tel         Numeric NOT NULL ,
        idLogin     Int NOT NULL
	,CONSTRAINT Comptable_PK PRIMARY KEY (idComptable)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: typeFrais
#------------------------------------------------------------

CREATE TABLE typeFrais(
        idTypeFrais Int  Auto_increment  NOT NULL ,
        typeFrais   Varchar (50) NOT NULL ,
        budget      Float NOT NULL
	,CONSTRAINT typeFrais_PK PRIMARY KEY (idTypeFrais)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Admin
#------------------------------------------------------------

CREATE TABLE Admin(
        idAdmin   Int  Auto_increment  NOT NULL ,
        ad_Nom    Varchar (50) NOT NULL ,
        ad_Prenom Varchar (50) NOT NULL ,
        idLogin   Int NOT NULL
	,CONSTRAINT Admin_PK PRIMARY KEY (idAdmin)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: client-commercial
#------------------------------------------------------------

CREATE TABLE client_commercial(
        idCommercial Int NOT NULL ,
        idClient     Int NOT NULL
	,CONSTRAINT client_commercial_PK PRIMARY KEY (idCommercial,idClient)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Remboursement
#------------------------------------------------------------

CREATE TABLE Remboursement(
        idRemboursement Int  Auto_increment  NOT NULL ,
        r_date          Date NOT NULL ,
        r_periode       Int NOT NULL ,
        r_montant       DECIMAL (15,3)  NOT NULL ,
        idFrais         Int NOT NULL ,
        idCommercial    Int NOT NULL
	,CONSTRAINT Remboursement_PK PRIMARY KEY (idRemboursement)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Frais
#------------------------------------------------------------

CREATE TABLE Frais(
        idFrais         Int  Auto_increment  NOT NULL ,
        date            Datetime NOT NULL ,
        r_etat          Int NOT NULL ,
        montant         DECIMAL (15,3)  NOT NULL ,
        idTypeFrais     Int NOT NULL ,
        idRemboursement Int NOT NULL ,
        idJustificatif  Int NOT NULL
	,CONSTRAINT Frais_PK PRIMARY KEY (idFrais)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: justificatifs
#------------------------------------------------------------

CREATE TABLE justificatifs(
        idJustificatif Int  Auto_increment  NOT NULL ,
        j_commentaire  Varchar (100) NOT NULL ,
        fichier        Varchar (100) NOT NULL ,
        idFrais        Int NOT NULL
	,CONSTRAINT justificatifs_PK PRIMARY KEY (idJustificatif)
)ENGINE=InnoDB;




ALTER TABLE Login
	ADD CONSTRAINT Login_typeUtilisateur0_FK
	FOREIGN KEY (idType)
	REFERENCES typeUtilisateur(idType);

ALTER TABLE Commercial
	ADD CONSTRAINT Commercial_Login0_FK
	FOREIGN KEY (idLogin)
	REFERENCES Login(idLogin);

ALTER TABLE Client
	ADD CONSTRAINT Client_Entreprise0_FK
	FOREIGN KEY (idEntreprise)
	REFERENCES Entreprise(idEntreprise);

ALTER TABLE Comptable
	ADD CONSTRAINT Comptable_Login0_FK
	FOREIGN KEY (idLogin)
	REFERENCES Login(idLogin);

ALTER TABLE Admin
	ADD CONSTRAINT Admin_Login0_FK
	FOREIGN KEY (idLogin)
	REFERENCES Login(idLogin);

ALTER TABLE client_commercial
	ADD CONSTRAINT client_commercial_Commercial0_FK
	FOREIGN KEY (idCommercial)
	REFERENCES Commercial(idCommercial);

ALTER TABLE client_commercial
	ADD CONSTRAINT client_commercial_Client1_FK
	FOREIGN KEY (idClient)
	REFERENCES Client(idClient);

ALTER TABLE Remboursement
	ADD CONSTRAINT Remboursement_Frais0_FK
	FOREIGN KEY (idFrais)
	REFERENCES Frais(idFrais);

ALTER TABLE Remboursement
	ADD CONSTRAINT Remboursement_Commercial1_FK
	FOREIGN KEY (idCommercial)
	REFERENCES Commercial(idCommercial);

ALTER TABLE Remboursement 
	ADD CONSTRAINT Remboursement_Frais0_AK 
	UNIQUE (idFrais);

ALTER TABLE Frais
	ADD CONSTRAINT Frais_typeFrais0_FK
	FOREIGN KEY (idTypeFrais)
	REFERENCES typeFrais(idTypeFrais);

ALTER TABLE Frais
	ADD CONSTRAINT Frais_Remboursement1_FK
	FOREIGN KEY (idRemboursement)
	REFERENCES Remboursement(idRemboursement);

ALTER TABLE Frais
	ADD CONSTRAINT Frais_justificatifs2_FK
	FOREIGN KEY (idJustificatif)
	REFERENCES justificatifs(idJustificatif);

ALTER TABLE Frais 
	ADD CONSTRAINT Frais_Remboursement0_AK 
	UNIQUE (idRemboursement);

ALTER TABLE Frais 
	ADD CONSTRAINT Frais_justificatifs1_AK 
	UNIQUE (idJustificatif);

ALTER TABLE justificatifs
	ADD CONSTRAINT justificatifs_Frais0_FK
	FOREIGN KEY (idFrais)
	REFERENCES Frais(idFrais);

ALTER TABLE justificatifs 
	ADD CONSTRAINT justificatifs_Frais0_AK 
	UNIQUE (idFrais);

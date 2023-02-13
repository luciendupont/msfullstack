DROP DATABASE IF EXISTS AFPA;
CREATE DATABASE AFPA;
USE AFPA;

CREATE TABLE CLIENT(
        cli_num      INT NOT NULL AUTO_INCREMENT PRIMARY KEY 
        cli_nom     varchar(50)
        cli_adresse varchar(50)
        cli_tel varchar(50)
);
CREATE table commande (
            com_num     INT NOT NULL AUTO_INCREMENT PRIMARY KEY
            cli_num  varchar(50)
            com_date DATETIME NOT NULL
            com_obs varchar(50)
);
CREATE TABLE  detail (
    com_num  INT NOT NULL AUTO_INCREMENT PRIMARY KEY
    pro_num  FOREIGN KEY (pro_num) references client(produit)
    det_que varchar(50)
);
CREATE TABLE PRODUITV (
    pro_num INT NOT NULL AUTO_INCREMENT PRIMARY KEY 
    pro_libelle varchar(50)
    pro_description varchar(50)
);
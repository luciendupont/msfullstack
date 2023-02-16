DROP DATABASE IF EXISTS Jarditou;

CREATE DATABASE Jarditou;

USE Jarditou;

CREATE TABLE client(
cli_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
cli_type BIT(1),
cli_nom VARCHAR(50),
cli_prenom VARCHAR(50),
cli_adresse VARCHAR(100),
cli_cp CHAR(5),
cli_ville VARCHAR(50),
cli_tel VARCHAR(10),
cli_mail VARCHAR(50)
);

CREATE TABLE commande(
cmd_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
cmd_date_commande DATE,
cmd_date_livraison DATE,
cmd_etat VARCHAR(25),
cmd_edition_facture BIT(1),
cmd_client_id INT,
CONSTRAINT FK_commande_client FOREIGN KEY (cmd_client_id) REFERENCES client(cli_id)
);

CREATE TABLE fournisseur(
frs_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
frs_nom VARCHAR(50),
frs_adresse VARCHAR(100),
frs_cp CHAR(5),
frs_ville VARCHAR(50),
frs_tel VARCHAR(10),
frs_mail VARCHAR(50),
frs_type BIT(1)
);

CREATE TABLE rubrique(
rub_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
rub_libelle VARCHAR(50)
);

CREATE TABLE produit(
pro_code INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
pro_libelle VARCHAR(100),
pro_description VARCHAR(250),
pro_photo VARCHAR(250),
pro_affichage BIT(1),
pro_prix_achat INT,
pro_stock_phys INT,
pro_stock_alerte INT,
pro_frs_id INT,
pro_rub_id INT,
CONSTRAINT fk_produit_frs FOREIGN KEY (pro_frs_id) REFERENCES fournisseur(frs_id),
CONSTRAINT fk_produit_rub FOREIGN KEY (pro_rub_id) REFERENCES rubrique(rub_id)
);

CREATE TABLE panier(
pnr_quantite INT,
pnr_prix_vente_par FLOAT,
pnr_prix_vente_pro FLOAT,
pnr_produit_code INT,
pnr_cmd_id INT,
CONSTRAINT pk_panier PRIMARY KEY (pnr_produit_code, pnr_cmd_id),
CONSTRAINT fk_panier_produit FOREIGN KEY (pnr_produit_code) REFERENCES produit(pro_code),
CONSTRAINT fk_panier_cmd FOREIGN KEY (pnr_cmd_id) REFERENCES commande(cmd_id)
);

CREATE INDEX idx_cmd_client ON commande(cmd_client_id);
CREATE INDEX idx_cmd_date ON commande(cmd_date_commande);

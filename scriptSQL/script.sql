-- Création de la table: visiteurs
CREATE TABLE IF NOT EXISTS visiteurs (
    idVis INT AUTO_INCREMENT PRIMARY KEY,
    NomVis VARCHAR(50),
    PrenomVis VARCHAR(50),
    DateNaissVis DATE,
    CpVis VARCHAR(5),
    VilleVis VARCHAR(50),
    DateArv VARCHAR(10),
    EmailVis VARCHAR(100),
    TelVis VARCHAR(10),
    NbEnfants INT,
    NbAdultes INT,
    adresse VARCHAR(100)
);

/*TRIGGERS - Limiteur Nb adultes à 10 */

DELIMITER //

-- Supprimez l'ancien trigger s'il existe
DROP TRIGGER IF EXISTS limitationNbEnfantAdultes//

-- Créez le nouveau trigger
CREATE TRIGGER limitationNbEnfantAdultes
BEFORE INSERT ON visiteurs
FOR EACH ROW
BEGIN
    IF NEW.NbEnfants > 10 OR NEW.NbAdultes > 5 THEN
        SIGNAL SQLSTATE '45002'
        SET MESSAGE_TEXT = 'ERREUR! Le nombre d''adultes ou d''enfants ne doit pas dépasser 10!';
    END IF;
END;
//

DELIMITER ;

-- creation des identifiants
CREATE USER 'evarli_fa_create'@'%' IDENTIFIED BY 'b7x9SRf775AtBy';
GRANT INSERT on `projetsitefa`.`visiteurs` to 'evarli_fa_create'@'%';

CREATE USER 'evarli_fa_read'@'%' IDENTIFIED BY '92wXuPvD72b8qM';
GRANT SELECT on `projetsitefa`.`visiteurs` to 'evarli_fa_read'@'%';

CREATE USER 'evarli_fa_update'@'%' IDENTIFIED BY 'ydD6Z3zTYp597h';
GRANT UPDATE on `projetsitefa`.`visiteurs` to 'evarli_fa_update'@'%';

CREATE USER 'evarli_fa_delete'@'%' IDENTIFIED BY 'yz36Yp9hT7Dd5Z';
GRANT DELETE on `projetsitefa`.`visiteurs` to 'evarli_fa_delete'@'%';
-- Suppression de la contrainte de clé étrangère pour la table operations_journal_annonce
ALTER TABLE operations_journal_annonce DROP CONSTRAINT fk_operation_annonce;

-- Suppression des contraintes de clé étrangère pour la table Utilisateurs_Annonces
ALTER TABLE Utilisateurs_Annonces DROP CONSTRAINT fk_utilisateur_annonce_annonce;
ALTER TABLE Utilisateurs_Annonces DROP CONSTRAINT fk_utilisateur_anonce_utilisateur;

-- Suppression des contraintes de clé étrangère pour la table Messages
ALTER TABLE Messages DROP CONSTRAINT fk_destinataire;
ALTER TABLE Messages DROP CONSTRAINT fk_expediteur;

-- Suppression des contraintes de clé étrangère pour la table Photos
ALTER TABLE Photos DROP CONSTRAINT fk_annonce_photo;

-- Suppression des contraintes de clé étrangère pour la table Commentaires
ALTER TABLE Commentaires DROP CONSTRAINT fk_annonce_commentaire;
ALTER TABLE Commentaires DROP CONSTRAINT fk_utilisateur_commentaire;

-- Suppression des contraintes de clé étrangère pour la table Reservations
ALTER TABLE Reservations DROP CONSTRAINT fk_annonce_reservation;
ALTER TABLE Reservations DROP CONSTRAINT fk_utilisateur_reservation;

-- Suppression des contraintes de clé étrangère pour la table Annonces
ALTER TABLE Annonces DROP CONSTRAINT fk_utilisateur_annonce;

-- Suppression des tables restantes
DROP TABLE operations_journal_annonce;
DROP TABLE Utilisateurs_Annonces;
DROP TABLE Messages;
DROP TABLE Photos;
DROP TABLE Commentaires;
DROP TABLE Reservations;
DROP TABLE Annonces;
DROP TABLE Utilisateurs;

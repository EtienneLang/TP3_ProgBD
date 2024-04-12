-- Insertion des donn�es dans la table Utilisateurs
INSERT INTO Utilisateurs (UtilisateurID, Nom, Prenom, Email, MotDePasse) VALUES 
(1, 'Tremblay', 'Jean', 'jean@example.com', 'motdepasse1');

INSERT INTO Utilisateurs (UtilisateurID, Nom, Prenom, Email, MotDePasse) VALUES 
(2, 'Gagnon', 'Marie', 'marie@example.com', 'motdepasse2');

INSERT INTO Utilisateurs (UtilisateurID, Nom, Prenom, Email, MotDePasse) VALUES 
(3, 'Roy', 'Pierre', 'pierre@example.com', 'motdepasse3');

INSERT INTO Utilisateurs (UtilisateurID, Nom, Prenom, Email, MotDePasse) VALUES 
(4, 'Fortin', 'Sylvie', 'sylvie@example.com', 'motdepasse4');

INSERT INTO Utilisateurs (UtilisateurID, Nom, Prenom, Email, MotDePasse) VALUES 
(5, 'Lavoie', 'Robert', 'robert@example.com', 'motdepasse5');

INSERT INTO Utilisateurs (UtilisateurID, Nom, Prenom, Email, MotDePasse) VALUES 
(6, 'Pelletier', 'Isabelle', 'isabelle@example.com', 'motdepasse6');

INSERT INTO Utilisateurs (UtilisateurID, Nom, Prenom, Email, MotDePasse) VALUES 
(7, 'Bergeron', 'Michel', 'michel@example.com', 'motdepasse7');

INSERT INTO Utilisateurs (UtilisateurID, Nom, Prenom, Email, MotDePasse) VALUES 
(8, 'Gauthier', 'Sophie', 'sophie@example.com', 'motdepasse8');

INSERT INTO Utilisateurs (UtilisateurID, Nom, Prenom, Email, MotDePasse) VALUES 
(9, 'Lefebvre', 'Jacques', 'jacques@example.com', 'motdepasse9');

-- Insertion des donn�es dans la table Annonces
INSERT INTO Annonces (AnnonceID, UtilisateurID, Titre, Description, PrixParNuit, Localisation, DateCreation) VALUES 
(1, 1, 'Charmant appartement pr�s du Vieux-Qu�bec', 'Appartement lumineux avec vue sur la ville, � quelques pas des principales attractions touristiques.', 100, 'Vieux-Qu�bec, Qu�bec', TO_DATE('2024-03-17', 'YYYY-MM-DD'));

INSERT INTO Annonces (AnnonceID, UtilisateurID, Titre, Description, PrixParNuit, Localisation, DateCreation) VALUES 
(2, 2, 'Maison de caract�re avec jardin en plein c�ur de la ville', 'Maison spacieuse et confortable id�ale pour les familles, � proximit� des parcs et des commerces.', 150, 'Saint-Roch, Qu�bec', TO_DATE('2024-03-17', 'YYYY-MM-DD'));

INSERT INTO Annonces (AnnonceID, UtilisateurID, Titre, Description, PrixParNuit, Localisation, DateCreation) VALUES 
(3, 3, 'Studio moderne avec terrasse priv�e', 'Studio enti�rement �quip� dans un quartier calme mais proche de toutes les commodit�s.', 80, 'Limoilou, Qu�bec', TO_DATE('2024-03-17', 'YYYY-MM-DD'));

INSERT INTO Annonces (AnnonceID, UtilisateurID, Titre, Description, PrixParNuit, Localisation, DateCreation) VALUES 
(4, 4, 'Condo de luxe avec vue imprenable sur le fleuve', 'Condo haut de gamme avec toutes les commodit�s modernes et une vue panoramique sur le fleuve Saint-Laurent.', 200, 'Levis, Qu�bec', TO_DATE('2024-03-18', 'YYYY-MM-DD'));

INSERT INTO Annonces (AnnonceID, UtilisateurID, Titre, Description, PrixParNuit, Localisation, DateCreation) VALUES 
(5, 5, 'Appartement cosy au c�ur du centre-ville', 'Appartement r�nov� avec go�t, � proximit� des restaurants et des boutiques du centre-ville.', 120, 'Sainte-Foy, Qu�bec', TO_DATE('2024-03-18', 'YYYY-MM-DD'));

INSERT INTO Annonces (AnnonceID, UtilisateurID, Titre, Description, PrixParNuit, Localisation, DateCreation) VALUES 
(6, 6, 'Maison chaleureuse avec jardin et piscine', 'Maison id�ale pour les vacances en famille, avec un grand jardin et une piscine priv�e.', 180, 'Beauport, Qu�bec', TO_DATE('2024-03-18', 'YYYY-MM-DD'));

INSERT INTO Annonces (AnnonceID, UtilisateurID, Titre, Description, PrixParNuit, Localisation, DateCreation) VALUES 
(7, 7, 'Studio en plein c�ur du quartier historique', 'Studio confortable � proximit� des sites historiques et des restaurants.', 90, 'Vieux-Port, Qu�bec', TO_DATE('2024-03-19', 'YYYY-MM-DD'));

INSERT INTO Annonces (AnnonceID, UtilisateurID, Titre, Description, PrixParNuit, Localisation, DateCreation) VALUES 
(8, 8, 'Appartement moderne avec vue sur la rivi�re', 'Appartement �l�gant avec balcon offrant une vue panoramique sur la rivi�re Saint-Charles.', 130, 'Saint-Roch, Qu�bec', TO_DATE('2024-03-19', 'YYYY-MM-DD'));

INSERT INTO Annonces (AnnonceID, UtilisateurID, Titre, Description, PrixParNuit, Localisation, DateCreation) VALUES 
(9, 9, 'Chalet rustique au bord du lac', 'Chalet pittoresque nich� au bord d''un lac tranquille, id�al pour une escapade relaxante en nature.', 160, 'Lac-Beauport, Qu�bec', TO_DATE('2024-03-20', 'YYYY-MM-DD'));

-- Insertion des donn�es dans la table Reservations
INSERT INTO Reservations (ReservationID, UtilisateurID, AnnonceID, DateDebut, DateFin, Statut, MontantTotal) VALUES 
(1, 2, 1, TO_DATE('2024-04-01', 'YYYY-MM-DD'), TO_DATE('2024-04-05', 'YYYY-MM-DD'), 'confirm�e', 400);

INSERT INTO Reservations (ReservationID, UtilisateurID, AnnonceID, DateDebut, DateFin, Statut, MontantTotal) VALUES 
(2, 3, 2, TO_DATE('2024-04-10', 'YYYY-MM-DD'), TO_DATE('2024-04-15', 'YYYY-MM-DD'), 'confirm�e', 750);

INSERT INTO Reservations (ReservationID, UtilisateurID, AnnonceID, DateDebut, DateFin, Statut, MontantTotal) VALUES 
(3, 1, 3, TO_DATE('2024-05-01', 'YYYY-MM-DD'), TO_DATE('2024-05-05', 'YYYY-MM-DD'), 'en attente', 320);

INSERT INTO Reservations (ReservationID, UtilisateurID, AnnonceID, DateDebut, DateFin, Statut, MontantTotal) VALUES 
(4, 4, 4, TO_DATE('2024-05-15', 'YYYY-MM-DD'), TO_DATE('2024-05-20', 'YYYY-MM-DD'), 'confirm�e', 1000);

INSERT INTO Reservations (ReservationID, UtilisateurID, AnnonceID, DateDebut, DateFin, Statut, MontantTotal) VALUES 
(5, 5, 5, TO_DATE('2024-06-01', 'YYYY-MM-DD'), TO_DATE('2024-06-05', 'YYYY-MM-DD'), 'confirm�e', 600);

INSERT INTO Reservations (ReservationID, UtilisateurID, AnnonceID, DateDebut, DateFin, Statut, MontantTotal) VALUES 
(6, 6, 6, TO_DATE('2024-06-10', 'YYYY-MM-DD'), TO_DATE('2024-06-15', 'YYYY-MM-DD'), 'confirm�e', 900);

INSERT INTO Reservations (ReservationID, UtilisateurID, AnnonceID, DateDebut, DateFin, Statut, MontantTotal) VALUES 
(7, 7, 7, TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_DATE('2024-07-05', 'YYYY-MM-DD'), 'en attente', 450);

INSERT INTO Reservations (ReservationID, UtilisateurID, AnnonceID, DateDebut, DateFin, Statut, MontantTotal) VALUES 
(8, 8, 8, TO_DATE('2024-07-10', 'YYYY-MM-DD'), TO_DATE('2024-07-15', 'YYYY-MM-DD'), 'confirm�e', 650);

INSERT INTO Reservations (ReservationID, UtilisateurID, AnnonceID, DateDebut, DateFin, Statut, MontantTotal) VALUES 
(9, 9, 9, TO_DATE('2024-08-01', 'YYYY-MM-DD'), TO_DATE('2024-08-05', 'YYYY-MM-DD'), 'en attente', 800);

-- Insertion des donn�es dans la table Commentaires
INSERT INTO Commentaires (CommentaireID, UtilisateurID, AnnonceID, Note, Commentaire, DateCommentaire) VALUES 
(1, 2, 1, 5, 'Super s�jour, l''appartement est parfaitement situ� et tr�s confortable.', TO_DATE('2024-04-06', 'YYYY-MM-DD'));

INSERT INTO Commentaires (CommentaireID, UtilisateurID, AnnonceID, Note, Commentaire, DateCommentaire) VALUES 
(2, 3, 2, 4, 'Belle maison avec un jardin agr�able, proche de tout.', TO_DATE('2024-04-07', 'YYYY-MM-DD'));

INSERT INTO Commentaires (CommentaireID, UtilisateurID, AnnonceID, Note, Commentaire, DateCommentaire) VALUES 
(3, 4, 3, 4, 'Studio moderne et bien �quip�, propri�taire accueillant.', TO_DATE('2024-04-08', 'YYYY-MM-DD'));

INSERT INTO Commentaires (CommentaireID, UtilisateurID, AnnonceID, Note, Commentaire, DateCommentaire) VALUES 
(4, 5, 4, 5, 'Condo luxueux avec une vue � couper le souffle.', TO_DATE('2024-05-21', 'YYYY-MM-DD'));

INSERT INTO Commentaires (CommentaireID, UtilisateurID, AnnonceID, Note, Commentaire, DateCommentaire) VALUES 
(5, 6, 5, 4, 'Appartement confortable et bien situ�, propri�taire r�actif.', TO_DATE('2024-06-06', 'YYYY-MM-DD'));

INSERT INTO Commentaires (CommentaireID, UtilisateurID, AnnonceID, Note, Commentaire, DateCommentaire) VALUES 
(6, 7, 6, 5, 'Maison parfaite pour des vacances en famille, jardin tr�s agr�able.', TO_DATE('2024-06-16', 'YYYY-MM-DD'));

INSERT INTO Commentaires (CommentaireID, UtilisateurID, AnnonceID, Note, Commentaire, DateCommentaire) VALUES 
(7, 8, 7, 3, 'Studio correct mais bruyant, emplacement pratique.', TO_DATE('2024-07-06', 'YYYY-MM-DD'));

INSERT INTO Commentaires (CommentaireID, UtilisateurID, AnnonceID, Note, Commentaire, DateCommentaire) VALUES 
(8, 9, 8, 4, 'Appartement moderne avec une belle vue, s�jour agr�able.', TO_DATE('2024-07-16', 'YYYY-MM-DD'));

INSERT INTO Commentaires (CommentaireID, UtilisateurID, AnnonceID, Note, Commentaire, DateCommentaire) VALUES 
(9, 1, 9, 5, 'Chalet charmant au bord du lac, endroit paisible et relaxant.', TO_DATE('2024-08-06', 'YYYY-MM-DD'));

-- Insertion des donn�es dans la table Photos
INSERT INTO Photos (PhotoID, AnnonceID, URLPhoto, Description) VALUES 
(1, 1, 'photo1.jpg', 'Vue depuis la fen�tre du salon');

INSERT INTO Photos (PhotoID, AnnonceID, URLPhoto, Description) VALUES 
(2, 1, 'photo2.jpg', 'Chambre principale');

INSERT INTO Photos (PhotoID, AnnonceID, URLPhoto, Description) VALUES 
(3, 2, 'photo3.jpg', 'Jardin de la maison');

INSERT INTO Photos (PhotoID, AnnonceID, URLPhoto, Description) VALUES 
(4, 2, 'photo4.jpg', 'Vue depuis la terrasse');

INSERT INTO Photos (PhotoID, AnnonceID, URLPhoto, Description) VALUES 
(5, 3, 'photo5.jpg', 'Coin cuisine du studio');

INSERT INTO Photos (PhotoID, AnnonceID, URLPhoto, Description) VALUES 
(6, 3, 'photo6.jpg', 'Salle de bain');

INSERT INTO Photos (PhotoID, AnnonceID, URLPhoto, Description) VALUES 
(7, 4, 'photo7.jpg', 'Salon du condo');

INSERT INTO Photos (PhotoID, AnnonceID, URLPhoto, Description) VALUES 
(8, 4, 'photo8.jpg', 'Chambre � coucher');

INSERT INTO Photos (PhotoID, AnnonceID, URLPhoto, Description) VALUES 
(9, 5, 'photo9.jpg', 'Vue depuis le balcon');

-- Insertion des donn�es dans la table Messages
INSERT INTO Messages (MessageID, ExpediteurUtilisateurID, DestinataireUtilisateurID, Contenu, DateEnvoi) VALUES 
(1, 2, 1, 'Bonjour Jean, int�ress� par votre appartement. Modalit�s de location � discuter ?', TIMESTAMP '2024-04-15 08:30:00');

INSERT INTO Messages (MessageID, ExpediteurUtilisateurID, DestinataireUtilisateurID, Contenu, DateEnvoi) VALUES 
(2, 1, 2, 'Bonjour Marie, ravi que l''appartement vous int�resse. Nous pouvons discuter des d�tails d�s maintenant.', TIMESTAMP '2024-04-15 10:45:00');

INSERT INTO Messages (MessageID, ExpediteurUtilisateurID, DestinataireUtilisateurID, Contenu, DateEnvoi) VALUES 
(3, 3, 1, 'Bonjour Jean, j''ai vu votre annonce pour le studio. Est-il disponible la semaine prochaine ?', TIMESTAMP '2024-04-16 14:20:00');

INSERT INTO Messages (MessageID, ExpediteurUtilisateurID, DestinataireUtilisateurID, Contenu, DateEnvoi) VALUES 
(4, 1, 3, 'Bonjour Pierre, oui le studio est disponible. Vous pouvez r�server d�s maintenant.', TIMESTAMP '2024-04-16 16:10:00');

INSERT INTO Messages (MessageID, ExpediteurUtilisateurID, DestinataireUtilisateurID, Contenu, DateEnvoi) VALUES 
(5, 4, 2, 'Bonjour Marie, votre maison semble parfaite pour nos prochaines vacances en famille.', TIMESTAMP '2024-04-17 11:00:00');

INSERT INTO Messages (MessageID, ExpediteurUtilisateurID, DestinataireUtilisateurID, Contenu, DateEnvoi) VALUES 
(6, 2, 4, 'Bonjour Sylvie, merci pour l''int�r�t. Nous serions heureux de vous accueillir.', TIMESTAMP '2024-04-17 13:45:00');

INSERT INTO Messages (MessageID, ExpediteurUtilisateurID, DestinataireUtilisateurID, Contenu, DateEnvoi) VALUES 
(7, 5, 3, 'Bonjour Pierre, votre studio semble bien �quip�. Nous souhaiterions le louer pour une semaine.', TIMESTAMP '2024-04-18 09:30:00');

INSERT INTO Messages (MessageID, ExpediteurUtilisateurID, DestinataireUtilisateurID, Contenu, DateEnvoi) VALUES 
(8, 3, 5, 'Bonjour Robert, je suis content que �a vous plaise. Vous pouvez r�server d�s maintenant.', TIMESTAMP '2024-04-18 14:00:00');

INSERT INTO Messages (MessageID, ExpediteurUtilisateurID, DestinataireUtilisateurID, Contenu, DateEnvoi) VALUES 
(9, 6, 4, 'Bonjour Sylvie, nous avons �t� s�duits par votre condo. Nous aimerions le r�server pour nos prochaines vacances.', TIMESTAMP '2024-04-19 10:20:00');


-- Insertion des donn�es dans la table Utilisateurs_Annonces
INSERT INTO Utilisateurs_Annonces (UtilisateurID, AnnonceID) VALUES (1, 1);
INSERT INTO Utilisateurs_Annonces (UtilisateurID, AnnonceID) VALUES (2, 1);
INSERT INTO Utilisateurs_Annonces (UtilisateurID, AnnonceID) VALUES (2, 2);
INSERT INTO Utilisateurs_Annonces (UtilisateurID, AnnonceID) VALUES (3, 2);
INSERT INTO Utilisateurs_Annonces (UtilisateurID, AnnonceID) VALUES (4, 3);
INSERT INTO Utilisateurs_Annonces (UtilisateurID, AnnonceID) VALUES (5, 3);
INSERT INTO Utilisateurs_Annonces (UtilisateurID, AnnonceID) VALUES (3, 1);
INSERT INTO Utilisateurs_Annonces (UtilisateurID, AnnonceID) VALUES (4, 1);
INSERT INTO Utilisateurs_Annonces (UtilisateurID, AnnonceID) VALUES (5, 2);
INSERT INTO Utilisateurs_Annonces (UtilisateurID, AnnonceID) VALUES (6, 2);
INSERT INTO Utilisateurs_Annonces (UtilisateurID, AnnonceID) VALUES (4, 2);
INSERT INTO Utilisateurs_Annonces (UtilisateurID, AnnonceID) VALUES (5, 1);

COMMIT;
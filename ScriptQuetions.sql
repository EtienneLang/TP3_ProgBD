SET SERVEROUTPUT ON;
/
----------------
-- Question 1 -- 
----------------
-- MANQUE ROLLBACK
CREATE OR REPLACE PROCEDURE max8_photos_PRC
IS
    CURSOR cur_photos IS
       -- SELECT annonceid, COUNT(*) as nb_photos FROM photos GROUP BY annonceid;
       SELECT annonceid, photoid FROM photos;
    rec_photos cur_photos%ROWTYPE;
    v_nombre_ligne NUMBER;
    v_photo_compteur NUMBER;
    v_id_annonce_precedent NUMBER;
    
BEGIN
    OPEN cur_photos;
    v_photo_compteur := 0;
    LOOP
        FETCH cur_photos INTO rec_photos;
        EXIT WHEN cur_photos%notfound;
        -- On regarde si c'est la m�me annonce que celle qu'on viens de boucler
        IF rec_photos.annonceid = v_id_annonce_precedent THEN
            v_photo_compteur := v_photo_compteur + 1;
        ELSE
            v_photo_compteur := 0;
        END IF;
        IF v_photo_compteur > 8 THEN
            -- Ici on pourrais utiliser le %ROWNUMBER pour aller supprimer directement a la ligne, 
            -- je ne sais pas ou on pourrais l'utiliser ailleur.
            DELETE FROM photos
            WHERE photoid = rec_photos.photoid;
        END IF;
        v_id_annonce_precedent := rec_photos.annonceid;
    END LOOP;
END;
/


----------------
-- Question 2 -- 
----------------
CREATE OR REPLACE FUNCTION obtenir_annonces_reservations_FCT(i_utilisateur_id NUMBER)
RETURN SYS_REFCURSOR
IS 
    cur_annonces SYS_REFCURSOR;
BEGIN
    OPEN cur_annonces FOR
        SELECT annonces.utilisateurid, COUNT(reservations.reservationid) AS NumberOfReservations
        FROM annonces 
        JOIN reservations ON reservations.utilisateurid = annonces.utilisateurid
        WHERE annonces.utilisateurid = i_utilisateur_id AND reservations.statut = 'confirm�e'
        GROUP BY annonces.utilisateurid;
    RETURN cur_annonces;
END;
/


----------------
-- Question 3 -- 
----------------
-- MANQUE ROLLBACK
CREATE OR REPLACE PROCEDURE SUPPRIMER_COMMENTAIRES_OBSOLETES_PRC(i_date_limite DATE)
IS
CURSOR cur_commentaires (
    date_limite DATE
)
    IS
        SELECT * FROM commentaires WHERE datecommentaire > i_date_limite;
    rec_commentaires cur_commentaires%ROWTYPE;
BEGIN
    OPEN cur_commentaires(i_date_limite);
    LOOP
        FETCH cur_commentaires INTO rec_commentaires;
        EXIT WHEN cur_commentaires%notfound;
        
        DELETE FROM commentaires
        WHERE commentaireid = rec_commentaires.commentaireid; 
    END LOOP;
END;
/


----------------
-- Question 4 -- 
----------------

CREATE OR REPLACE PROCEDURE Q4_TRAITER_RESERVATION(i_user_id IN NUMBER) 
IS
    CURSOR cur_reservations(user_id NUMBER) IS
        SELECT * FROM reservations WHERE utilisateurid = user_id AND statut != 'trait�e' FOR UPDATE OF statut;
    rec_reservation reservations%ROWTYPE;
BEGIN
    OPEN cur_reservations(i_user_id);
    LOOP
        FETCH cur_reservations INTO rec_reservation;
        EXIT WHEN cur_reservations%NOTFOUND;
        UPDATE reservations SET statut = 'Trait�e' WHERE CURRENT OF cur_reservations;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(cur_reservations%ROWCOUNT || ' r�servation(s) trait�e(s)');
    CLOSE cur_reservations;
END;
/
----------------
-- Question 5 -- 
----------------
CREATE SEQUENCE no_img_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999
    NOCYCLE
    CACHE 5;
/

CREATE OR REPLACE TRIGGER Q5_URL_PHOTO_AI_TRG BEFORE INSERT ON photos
FOR EACH ROW
DECLARE
    v_base_url VARCHAR2(100) := 'CNCIMG';
BEGIN
    :NEW.urlphoto := v_base_url || LPAD(no_img_seq.NEXTVAL, 5, '0');
END;
/

INSERT INTO Photos (PhotoID, AnnonceID, URLPhoto, Description) VALUES 
(10, 1, 'photo1.jpg', 'Vue depuis la fen�tre du salon');
/
----------------
-- Question 6 -- 
----------------


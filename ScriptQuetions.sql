SET SERVEROUTPUT ON;

----------------
-- Question 1 -- 
----------------
-- MANQUE ROLLBACK
CREATE OR REPLACE PROCEDURE Q1_MAX8_PHOTOS_PRC
IS
    CURSOR cur_annonces IS 
        SELECT * FROM annonces;
    rec_annonce annonces%ROWTYPE;    
    CURSOR cur_photos(annonce_id NUMBER) IS
       SELECT * FROM photos WHERE annonceid = annonce_id;
    rec_photo photos%ROWTYPE;
    c_max_photos NUMBER := 8;
BEGIN
    OPEN cur_annonces;
    LOOP
        BEGIN
            DBMS_OUTPUT.PUT_LINE('looped on one annonce');
            FETCH cur_annonces INTO rec_annonce;
            EXIT WHEN cur_annonces%NOTFOUND;
            OPEN cur_photos(rec_annonce.annonceid);
            LOOP
                    FETCH cur_photos INTO rec_photo;
                    EXIT WHEN cur_photos%NOTFOUND;
                    IF cur_photos%ROWCOUNT > c_max_photos THEN
                        DBMS_OUTPUT.PUT_LINE('Photo supprimé');
                        DELETE FROM photos WHERE photoid = rec_photo.photoid;
                    END IF;
               
            END LOOP;    
            CLOSE cur_photos;
            COMMIT;
         EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
        END;
    END LOOP;
    CLOSE cur_annonces;
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
        WHERE annonces.utilisateurid = i_utilisateur_id AND reservations.statut = 'confirmï¿½e'
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
        BEGIN
            FETCH cur_commentaires INTO rec_commentaires;
            EXIT WHEN cur_commentaires%notfound;
        
            DELETE FROM commentaires
            WHERE commentaireid = rec_commentaires.commentaireid;
            
            COMMIT;
        EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
        END;
    END LOOP;
    CLOSE cur_commentaires;
END;
/


----------------
-- Question 4 -- 
----------------
CREATE OR REPLACE PROCEDURE Q4_TRAITER_RESERVATION_PRC(i_user_id IN NUMBER) 
IS
    CURSOR cur_reservations(user_id NUMBER) IS
        SELECT * FROM reservations WHERE utilisateurid = user_id AND statut != 'traitï¿½e' FOR UPDATE OF statut;
    rec_reservation reservations%ROWTYPE;
BEGIN
    OPEN cur_reservations(i_user_id);
    LOOP
        FETCH cur_reservations INTO rec_reservation;
        EXIT WHEN cur_reservations%NOTFOUND;
        UPDATE reservations SET statut = 'Traitï¿½e' WHERE CURRENT OF cur_reservations;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(cur_reservations%ROWCOUNT || ' rï¿½servation(s) traitï¿½e(s)');
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

CREATE OR REPLACE TRIGGER Q5_URL_PHOTO_BI_TRG BEFORE INSERT ON photos
FOR EACH ROW
DECLARE
    v_base_url VARCHAR2(100) := 'CNCIMG';
BEGIN
    :NEW.urlphoto := v_base_url || LPAD(no_img_seq.NEXTVAL, 5, '0');
END;
/
----------------
-- Question 6 -- 
----------------

-- ON VA DEVOIR TROUVER UN MOYEN D'AFFICHER L'ID D'UNE ANNONCE MEME QUAND ON LA SUPPRIME,
-- POUR L'INSTANT C'EST IMPOSSIBLE CAR FOREINGKEY

CREATE OR REPLACE TRIGGER Q6_JOURNALISATION_ANNONCE_AU_TRG
AFTER INSERT OR UPDATE OR DELETE ON annonces
FOR EACH ROW
DECLARE
    v_type VARCHAR2(20);
    v_ancienne_valeur VARCHAR2(4000 BYTE);
    v_nouvelle_valeur VARCHAR2(4000 BYTE);
BEGIN
    v_type := CASE
        WHEN UPDATING THEN 'Updated' 
        WHEN INSERTING THEN 'Inserted'
        WHEN DELETING THEN 'Deleted'
    END;
    
    IF UPDATING THEN
        v_ancienne_valeur := :OLD.titre || ', ' || :OLD.description || ', ' || :OLD.prixparnuit;
        v_nouvelle_valeur := :NEW.titre || ', ' || :NEW.description || ', ' || :NEW.prixparnuit;
    ELSIF INSERTING THEN
        v_ancienne_valeur := null;
        v_nouvelle_valeur := :NEW.titre || ', ' || :NEW.description || ', ' || :NEW.prixparnuit;
    ELSIF DELETING THEN
        v_ancienne_valeur := :OLD.titre || ', ' || :OLD.description || ', ' || :OLD.prixparnuit;
        v_nouvelle_valeur := null;
    END IF;
    
    INSERT INTO operations_journal_annonce (
        TYPE_OPERATION,
        UTILISATEURORACLE,
        DATEOPERATION,
        ANCIENNE_VALEUR,
        NOUVELLE_VALEUR
    ) VALUES (
        v_type,
        USER,
        SYSDATE,
        v_ancienne_valeur,
        v_nouvelle_valeur
    );
END;


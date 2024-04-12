SET SERVEROUTPUT ON;
----------------
-- Question 1 -- 
----------------
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
        -- On regarde si c'est la même annonce que celle qu'on viens de boucler
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

EXEC max8_photos_prc;
----------------
-- Question 2 -- 
----------------

----------------
-- Question 3 -- 
----------------

----------------
-- Question 4 -- 
----------------

----------------
-- Question 5 -- 
----------------

----------------
-- Question 6 -- 
----------------


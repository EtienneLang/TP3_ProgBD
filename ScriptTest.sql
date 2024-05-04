SET SERVEROUTPUT ON;
--------------------------
-- Test pour Question 1 -- 
--------------------------
EXEC max8_photos_prc;

--------------------------
-- Test pour Question 2 -- 
--------------------------
DECLARE
    my_cursor SYS_REFCURSOR;
    v_utilisateurid annonces.utilisateurid%TYPE;
    v_RESERVATION annonces.utilisateurid%TYPE;
BEGIN
    my_cursor := obtenir_annonces_reservations(3);

    LOOP
        FETCH my_cursor INTO v_utilisateurid,v_RESERVATION;
        EXIT WHEN my_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_utilisateurid|| ', ' || v_RESERVATION);
    END LOOP;
    CLOSE my_cursor;
END;



--------------------------
-- Test pour Question 3 -- 
--------------------------
EXEC supprimer_commentaires_obsoletes_prc('24-04-06');

----------------
-- Question 4 -- 
----------------

----------------
-- Question 5 -- 
----------------

----------------
-- Question 6 -- 
----------------
BEGIN
    UPDATE annonces
    SET titre = 'bonjour'
    WHERE annonceid = 1;
END;

INSERT INTO annonces (annonceid, utilisateurid, titre, description, prixparnuit, localisation)
VALUES (123, 1, 'zaza', 'zouzou', 12, 'Quebec');


DELETE FROM annonces
WHERE annonceid = 123;



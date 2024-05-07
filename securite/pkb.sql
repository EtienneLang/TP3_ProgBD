create or replace package body securite.chiffrement_pkg as
    function crypter_fct (i_valeur in varchar2)
    return varchar2
    is
        cle              raw(20);
        type_chiffrement pls_integer := sys.dbms_crypto.DES_CBC_PKCS5;
        valeur_encodee   raw (1000);
    begin
        --Va chercher la cl� de cryptage du sch�ma Securite (non accessible en connexion si pas DBA)
        select valeur
        into cle
        from securite.param_chiffrement
        where code = 'cle';

        --Fonction de cryptage avec conversion de VARCHAR2 en RAW encod� en AL32UTF8
        valeur_encodee :=
            sys.dbms_crypto.encrypt (
                src => utl_i18n.string_to_raw (i_valeur, 'AL32UTF8'),
                typ => type_chiffrement,
                key => cle);
            
        --Retour de la valeur crypt�e
        return utl_raw.cast_to_varchar2 (utl_encode.base64_encode (valeur_encodee));
    end crypter_fct;

    function decrypter_fct (i_valeur in varchar2)
    return varchar2
    is
        cle              raw (20);
        type_chiffrement pls_integer := sys.dbms_crypto.DES_CBC_PKCS5;
        valeur_decodee   raw (1000);
    begin
        --Va chercher la cl� de cryptage du sch�ma Securite (non accessible en connexion si pas DBA)
        select valeur
        into cle
        from securite.param_chiffrement
        where code = 'cle';
        
        --Fonction de d�cryptage
        valeur_decodee :=
            sys.dbms_crypto.decrypt (
                src   => utl_encode.base64_decode (utl_raw.cast_to_raw (i_valeur)),
                typ   => type_chiffrement,
                key   => cle);
        
        --Retour de la valeur d�crypt�e avec conversion de RAW en VARCHAR2 encod� en AL32UTF8
        return utl_i18n.raw_to_char (valeur_decodee, 'AL32UTF8');
    end decrypter_fct;
    
end chiffrement_pkg;
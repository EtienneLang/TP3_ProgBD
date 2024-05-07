--Se connecter avec le schéma CNC, par exemple.
--Impossible de consulter, c'est normal, car pas de droits de SELECT
select *
from securite.param_chiffrement;

-- Exécuter ce script complet
--Prompt pour encrypter ce qu'on tape
accept valeur_a_crypter char prompt 'Valeur à crypter:';

--Démonstration d'encryption/dcryption
--Attention, ici on passe comme 3e colonne la décryption de l'encryption de la valeur saisie dans le PROMPT
select
    '&valeur_a_crypter' as valeur_a_crypter,
    securite.chiffrement_pkg.crypter_fct('&valeur_a_crypter') as valeur_cryptee,
    securite.chiffrement_pkg.decrypter_fct(securite.chiffrement_pkg.crypter_fct('&valeur_a_crypter')) as valeur_decryptee
from dual;




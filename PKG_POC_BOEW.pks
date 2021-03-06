CREATE OR REPLACE PACKAGE PKG_POC_BOEW
IS

/**
 * Menu - enregistrement
 */			
TYPE MENU_REC				IS RECORD
(
	NOM_LIEN_FRA			POC_BOEW_MENU.NOM_LIEN_FRA%TYPE,
	NOM_LIEN_ENG			POC_BOEW_MENU.NOM_LIEN_ENG%TYPE,
	NOM_MENU_FRA			POC_BOEW_MENU.NOM_MENU_FRA%TYPE,
	NOM_MENU_ENG			POC_BOEW_MENU.NOM_MENU_ENG%TYPE,
	NOM_CATGR			POC_BOEW_MENU.NOM_CATGR%TYPE,
	IDE_BOEW_MENU			POC_BOEW_MENU.IDE_BOEW_MENU%TYPE,	
	IDE_BOEW_MENU_PARNT		POC_BOEW_MENU.IDE_BOEW_MENU_PARNT%TYPE,
	NOM_ID				POC_BOEW_MENU.NOM_ID%TYPE,
	NUM_SEQNC			POC_BOEW_MENU.NUM_SEQNC%TYPE
) ;

/**
 * Menu - liste
 */
TYPE MENU_TAB				IS TABLE OF MENU_REC ;


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- 01 -- Spécification des objets pour l'ensemble de l'application
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

/**
 * Cette function permet de retourner la table menu dans un Pipeline.
 *
 * @return La table en pipeline
 */

FUNCTION F_TABLE_MENU 
RETURN MENU_TAB PIPELINED ;

/**
 * Cette function permet de retourner le code SQL pour générer le menu.
 *
 * @param  P_NOM_CATGR			Nom de la catégorie
 *
 * @return Le montant du dernier contrat publié
 */
FUNCTION F_OBTNR_SQL_MENU
(
        P_NOM_CATGR 			IN POC_BOEW_MENU.NOM_CATGR%TYPE
)
RETURN VARCHAR2 ;

/**
 * Cette fonction permet de décider lequel des deux libellé afficher selon 
 * la langue du contexte.
 *
 * @param  P_FRANC			Libelé francais
 * @param  P_ANGLS			Libellé anglais
 *
 * @return Le libellé pour la langue demandé
 */
 
FUNCTION F_TRADC
(
	P_FRANC				IN  VARCHAR2,
	P_ANGLS				IN  VARCHAR2
)
RETURN VARCHAR2 ;
 
/**
 * Cette procédure permet d'initier la langue.
 */
PROCEDURE P_INIT_LANG ;

/**
 * Cette procédure permet de gérer le changement de langue.
 */
PROCEDURE P_CHANG_LANG ;

END PKG_POC_BOEW ;
/
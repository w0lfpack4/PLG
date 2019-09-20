﻿--------------------------------------------------------------------
-- PLG French Localization [this file must be converted to UTF-8]
--------------------------------------------------------------------

PLG["frFR"] = {
	["errors"] = {
		["ERR_DATA"]       = "Donnée introuvable. PLG se ferme.",
		["ERR_LEARN"]      = "Allez voir votre maître pour apprendre la recette suivante:",
		["ERR_LEARNVEND"]  = "Allez voir le vendeur énuméré ci-dessous pour obtenir la recette suivante:",
		["ERR_LOW_LEVEL"]  = "Vous devez atteindre le niveau %s pour utiliser la recette suivante:",
		["ERR_NOT_FOUND"]  = "La recette est introuvable sur le serveur. Veuillez utiliser une autre recette à niveau.",
		["ERR_MAX_LEVEL"]  = "Niveau maximum, pas d'autres recettes. PLG se ferme.",
		["ERR_MAX_SKILL"]  = "Vous avez atteint la compétence maximale pour ce niveau. Allez voir votre maître.",
	},
	["app"] = {
		["APP_NAME"]       = "PLG",
		["APP_TITLE"]      = "Guide d'évolution des métiers",
		["BTN_RESET_NAME"] = "Réinitialiser les données Guide",
		["BTN_RESET_TIP"]  = "Cette opération va effacer tout sauvegardé et recharger vos données guide de l'interface utilisateur.",
		["MSG_TRAINER"]    = "Allez voir votre maître.",
		["MSG_DRAENOR"]    = "Obtenir ", 
		["MSG_WAITING"]    = "Attente du serveur...",
		["DBG_NAME"]       = "Cliquez pour déboguer la progression des métiers.",
		["DBG_DESC"]       = "PLG Débogage",	
	},	
	["tab1"] = {
		["TAB_TITLE"]      = "Guide",
		["TAB_TOOLTIP"]    = "Cliquez pour afficher le guide.",
		["PAG_TITLE"]      = "Instructions",
		["TXT_CREATE"]     = "Créez %s exemplaire(s) de la recette suivante jusqu'au niveau %s.",
		["TXT_KEEP"]       = "Vous devriez garder ces recettes pour plus tard.",
		["LBL_RECIPE"]     = "Recettes",
		["LBL_ALTERNATE"]  = "Alternatif",
		["LBL_REAGENTS"]   = "Composants",
		["TIP_SELECT"]     = "(Cliquez pour sélectionner)",
		["TIP_Q1_TITLE"]   = "Quête de recette",
		["TIP_Q1_DESC"]    = "Cette recette doit être obtenue à travers la chaîne de quête ci-dessus.  Le donneur de quête et son emplacement sont énumérés ci-dessous.",
		["TIP_Q_LEVEL"]    = "Niveau requis",
		["TIP_Q2_TITLE"]   = "Quête prérequise",
		["TIP_Q2_DESC"]    = "Cette chaîne de quête doit être complétée en premier.  Le donneur de quête et son emplacement sont énumérés ci-dessous.",
		["TIP_V_TITLE"]    = "Vendeur de recette",
		["TIP_V_DESC"]     = "Cette recette doit être obtenue auprès d'un vendeur.  Le vendeur et son emplacement sont énumérés ci-dessous.",
		["TIP_NPC"]        = "PNJ",
		["TIP_LOCATION"]   = "Emplacement",
		["TIP_WAYPOINT"]   = "Cliquez pour définir un point de route.",
	},
	["tab2"] = {
		["TAB_TITLE"]      = "Suppléants",
		["TAB_TOOLTIP"]    = "Cliquez sur pour afficher une liste des autres recettes.",
		["PAG_TITLE"]      = "Alternatif Recettes",
		["PAG_DESC"]       = "\n\nLa liste suivante de recettes peuvent être utilisés comme substituts pour le guide des suggestions et vont changer comme vous. Cliquer pour remplacer la principale recette, cliquez avec le bouton droit pour remplacer l'autre recette.",
		["MSG_REPLACE_PRIMARY"]   = "Remplacer recette principale avec %s?",
		["MSG_REPLACE_ALTERNATE"] = "Remplacer recette alternatif avec %s?",
		["MSG_RELOAD"]            = "Voulez-vous continuer?",
	},
	["tab3"] = {
		["TAB_TITLE"]      = "Composants",
		["TAB_TOOLTIP"]    = "Cliquez sur pour afficher une liste de tous les réactifs nécessaires.",
		["PAG_TITLE"]      = "Liste de magasinage de réactif",
		["PAG_DESC"]       = "\n\nLa liste suivante contient le nombre de réactifs nécessaires à niveau cette profession et vont changer comme vous. Ce n'est qu'une approximation fondée sur les données. Par exemple : si vous n'obtenez aucune compétence-ups tout en créant une recette vert ou jaune, il y aura un besoin d'acheter, de la ferme ou d'artisanat jusqu'à ce que vous fassiez réactifs plus obtenir une compétence.",
	},
	["tab4"] = {
		["TAB_TITLE"]      = "Aide",
		["TAB_TOOLTIP"]    = "Cliquez sur pour afficher l'écran d'aide.",
		["PAG_TITLE"]      = "PLG Aide",
		["PAG_DESC"]       = "\n\n|cff000000INSTRUCTIONS:|r\nLe texte des instructions fournira des informations importantes telles que le nombre de schéma ou de recette à créer, ou quand et ou apprendre une nouvelle recette.  \n\n|cff000000RECETTES:|r\nPLG passera à une nouvelle recette déterminée par votre niveau de compétence actuel. Parfois, une autre recette sera affichée.  Cliquez dessus pour afficher les réactifs de l'autre recette. Les recettes qui ne sont pas sélectionnées apparaîtront ombragées. Au-dessus de chaque recette, il y a une barre de couleur pour indiquer le niveau de difficulté de la recette .  \n\n|cff000000COMPOSANTS:|r\nLe guide affiche le nombre total de composants nécessaires pour terminer un niveau. Par exemple, pour faire un élixir vous avez besoin d'un flacon.  Pour passer au niveau suivant, vous avez besoin de 5 élixirs. Le guide vous dira d'obtenir 5 flacons.   \n\n|cff000000VENDEURS:|r\nParfois, une recette doit être obtenu ailleurs que par votre maître.  Une icône s'affiche à côté de la recette principale d'un vendeur |T"..PLG.textures.VENDORRECIPE..":16|t ou la chaîne de quête |T"..PLG.textures.QUESTRECIPE..":16|t.  L'infobulle de l'icône affiche le nom de la quête (si nécessaire), le vendeur, et son emplacement.  Cliquer sur l'icône fixera un parcours dans TomTom ou Carbonite pour vous diriger vers le vendeur ou le donneur de quête. \n\n|cff000000AUTRES NOTES:|r\n* Pour tout élément qui peut être cliqué, le curseur se colorie en bleu. \n\n* Chaque recette, si elle est connue, sera automatiquement sélectionnée dans la fenêtre de compétences d'échange.\n\n* Une fois que vous atteignez le niveau de compétence maximum pour une profession, ce guide ne sera plus afficher pour cette profession.\n\n* 25 points avant d'atteindre les points de compétences maximum de votre niveau, un texte orange en haut de la fenêtre vous avertira que vous devez visiter votre maître.\n\n|cff000000BONNE CHANCE!",
		["DRAENOR_TITLE"]    = "\n\n|cff000000DRAENOR PROFESSIONS:|r\n",
		["TXT_PRE_DRAENOR"]  = "Avant que vous puissiez niveau cette profession de plus, vous devez obtenir la recette énumérés ci-dessus. Profession principale recettes peuvent être achetés à des fournisseurs dans votre profession de garnison de Ashran building, ou obtenus en récompense de quête drop. Profession secondaire recettes sont généralement obtenues par la pêche, la cueillette, la cuisson, ou même par l'ingestion d'aliments.";
		["TXT_POST_DRAENOR"] = "Construire votre profession de garnison de bâtiments et de commencer à créer des ordres de travail dès que vous pouvez. Les bons de travail doivent prendre les matières premières et revenir à vous la construisant primaire et secondaire réactifs pour votre profession toutes les 4 heures. En plus de donner des recettes dans ce guide, il y a deux recettes pour chaque profession principale qui peut être fabriqué une fois par jour. Assurez-vous que vous formulez-les pour connaître les matériaux et les compétences-ups fourni.";
	},
	["help"] = {
		["Alchemy"]        = "\n\n|cff000000ALCHIMIE:|r\nCette profession est idéale combiné avec herboristerie, vous pouvez économiser beaucoup d'or si vous montez ces deux professions ensemble car vous pouvez récolter toutes les herbes nécessaires.",
		["Blacksmithing"]  = "\n\n|cff000000FORGERON:|r\nCette profession est mieux combinée avec Mineur, vous pouvez économiser beaucoup d'or si vous montez ces deux professions ensemble parce que vous pouvez ramasser tous les métaux nécessaires.",
		["Cooking"]        = "\n\n|cff000000CUISINE:|r\nLa façon la plus simple pour monter la cuisine si vous êtes en dessous du niveau 85 est de participer à l'événement mondial Pilgrim's Bounty.  Dans ce seul événement, vous pouvez monter la cuisine de 1 à environ 350 et devenir un Grand Maître.  Au niveau 85 vous pouvez aller au Halfhill Market en Pandarie et parler à Sungshin Patte de fer. Vous pouvez monter le niveau de cuisson de 1 à 600.",
		["Enchanting"]     = "\n\n|cff000000ENCHANTEMENT:|r\nCette profession est idéale combinée avec couture, car vous pouvez désenchanter la plupart des vêtements que vous créez.",
		["Engineering"]    = "\n\n|cff000000INGENIEUR:|r\nCette profession est mieux combinée avec Mineur, vous pouvez économiser beaucoup d'or si vous montez ces deux professions ensemble parce que vous pouvez ramasser tous les métaux nécessaires.",
		["Inscription"]    = "\n\n|cff000000CALLIGRAPHE:|r\nCette profession est mieux combinée avec Herboriste, vous pouvez économiser beaucoup d'or si vous montez ces deux professions ensemble parce que vous pouvez ramasser toutes les plantes nécessaires.",
		["Jewelcrafting"]  = "\n\n|cff000000BIJOUTIER:|r\nCette profession est mieux combinée avec Mineur ou Enchanteur, vous pouvez économiser beaucoup d'or si vous montez ces deux professions ensemble parce que vous pouvez soit ramasser tous les matériaux nécessaires, soit désenchanter ce que vous fabriquez.",
		["Leatherworking"] = "\n\n|cff000000TRAVAIL DU CUIR:|r\nCette profession est mieux combinée avec Dépeceur, vous pouvez économiser beaucoup d'or si vous montez ces deux professions ensemble parce que vous pouvez ramasser tous les cuirs nécessaires.",
		["Tailoring"]      = "\n\n|cff000000COUTURE:|r\nVous aurez besoin de milliers de tissus si vous montez Couture.Il vous en coûtera des milliers d'or pour acheter des tissus, ou si vous les ramassez, il faudra beaucoup de temps pour tout ramasser. Couture est bien combinée avec Enchantement parce que vous serez en mesure de désenchanter la plupart des éléments que vous créez.",
	},
}
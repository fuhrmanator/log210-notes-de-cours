# Modèle du domaine (MDD, modèle conceptuel)

Les MDD sont expliqués en détail dans le chapitre 9&nbsp;\faBook&nbsp;du livre du cours, mais voici des points importants pour LOG210:

- Les classes conceptuelles ne sont pas des classes logicielles. Ainsi, selon la méthodologie de Larman, *elles n'ont pas de méthodes*.
- Les classes ont des noms commençant avec une lettre majuscule, par exemple `Joueur` et elles ne sont jamais au pluriel, par exemple ~~`Joueurs`~~.

## Classes conceptuelles

Il y a trois stratégies pour identifier les classes conceptuelles:

1. Réutiliser ou modifier des modèles existants.
2. Utiliser une liste de catégories.
3. Identifier des groupes nominaux.

### Catégories pour identifier des classes conceptuelles

:Extrait du tableau 9.1&nbsp;\faBook&nbsp;du livre du cours.

Catégorie | Exemples
:----------|:----------
**Transactions métier**\newline \newline Elles sont essentielles, commencez l'analyse par les transactions. \newline | *Vente*, *Attaque*, *Réservation*, *Inscription*, *EmpruntVélo*
**Lignes d'une transaction**\newline \newline Éléments compris dans une transaction. \newline  |  *LigneArticles*, *ExemplaireLivre*, *GroupeCours*
**Produit ou service lié à une transaction ou une ligne de transaction**\newline \newline Pour quel concept sont faites des transactions? \newline |*Article*, *Vélo*, *Vol*, *Livre*, *Cours*
**Où la transaction est-elle enregistré?**\newline | *Caisse*, *GrandLivre*, *ManifesteDeVol*
**Rôle des personnes liées à la transaction**\newline \newline Qui sont les parties impliquées dans une transaction? \newline | *Caissier*, *Client*, *JoueurDeMonopoly*, *Passager*
**Organisations liées à la transaction**\newline \newline Quelles sont les organisations impliquées dans une transaction?\newline | *Magasin*, *CompagnieAérienne*, *Bibliothèque*, *Université*
**Lieu de la transaction; lieu du service**\newline \newline | *Magasin*, *Aéroport*, *Avion*, *Siège*, *LocalCours*
**Événements notables, à mémoriser**\newline \newline | *Vente*, *Paiement*, *JeuDeMonopoly*, *Vol*
**Objets physiques**\newline \newline Important surtout lorsqu'il s'agit d'un logiciel de contrôle d'équipements ou de simulation. \newline | *Article*, *Caisse*, *Plateau*, *Pion*, *Dé*, *Vélo*
**Description d'entités**\newline \newline Voir section 9.13 pour plus d'informations.\newline | *DescriptionProduit*, *DescriptionVol*, *Livre* (en opposition avec *Exemplaire*), *Cours* (en opposition avec *CoursGroupe*)
**Catalogues**\newline \newline Les descriptions se trouvent souvent dans des catalogues \newline | *CatalogueProduits*, *CatalogueVols*, *CatalogueLivres*, *CatalogueCours*
**Conteneurs**\newline \newline Un conteneur peut contenir des objets physiques ou des informations. \newline | *Magasin*, *Rayonnage*, *Plateau*, *Avion*, *Bibliothèque*
**Contenu d'un conteneur**\newline \newline | *Article*, *Case (sur un Plateau de jeu)*, *Passager*, *Exemplaire*
**Autres systèmes externes**\newline \newline | *SystèmeAutorisationPaiementsACrédit*, *SystèmeGestionBorderaux*
**Documents financiers, contrats, documents légaux**\newline \newline | *Reçus*, *GrandLivre*, *JournalDeMaintenance*
**Instruments financiers**\newline \newline | *Espèces*, *Chèque*, *LigneDeCrédit*
**Plannings, manuels, documents régulièrement consultés pour effectuer un travail**\newline \newline | *MiseAJourTarifs*, *PlanningRéparations*

## Attributs

Les attributs sont le sujet de la section 9.16&nbsp;\faBook&nbsp;du livre. 
Comme c'est le cas pour les classes et les associations, on fait figurer les attributs *quand les cas d'utilisation suggèrent la nécessité de mémoriser des informations*.

Pour l'UML, la syntaxe complète d'un attribut est&nbsp;:

**visibilité nom : type multiplicité = défaut {propriété}
**

Voici des points importants:

- *Le type d'un attribut est important et il faut les spécifier dans un MDD*, même si dans le livre du cours il y a plusieurs exemples sans type.
- On ne se soucie pas de la visibilité des attributs dans un MDD.
- Faites attention à l'attribut qui devrait être une classe. Si on ne pense pas un attribut *X* en termes alphanumériques dans le monde réel, alors il s'agit probablement d'une classe conceptuelle. Voir la section 9.12&nbsp;\faBook&nbsp;du livre.
- De la même manière, faites attention aux informations qui sont mieux modélisées par des associations, par exemple dans la figure&nbsp;\ref{MDD-jeu-de-risk} la classe `Pays` n'a pas un *attribut* `joueur:Joueur` (qui contrôle le Pays), mais elle a plutôt une *association* avec la classe `Joueur` et un verbe `contrôle`. 

> \faWarning &nbsp;Il est vrai que dans un langage de programmation, les associations doivent être les attributs dans les classes. Cependant, dans un modèle du domaine on cherche à éviter des attributs si une association peut mieux décrire la relation. La relation relie visuellement les deux classes et elle est décrite avec un verbe.

## Associations

Les associations dans le MDD sont le sujet de la section 9.14&nbsp;\faBook&nbsp;du livre du cours.
Il faut se référer au contenu du livre pour les détails.
Une association est une relation entre des classes (ou des instances de classes).
Elle indique une connexion significative ou intéressante.
Voici des points importants:

- Il est facile de trouver beaucoup d'associations, mais il faut se limiter à celles qui doivent être conservées un certain temps.
Pensez à la **mémorabilité** d'une association dans le contexte du logiciel à développer. Par exemple, considérez les associations de la figure&nbsp;\ref{MDD-jeu-de-risk}:
  - Il existe une association entre `Joueur` et `Pays`, car il est important de savoir quel joueur contrôle quel pays dans le jeu de Risk.
  - Il n'y a pas d'association entre `JeuRisk` et `Attaque`, même si les attaques font partie du jeu. Il n'est pas essentiel de mémoriser l'historique de toutes les attaques réalisées dans le jeu.
- Il y a des associations dérivées de la liste des associations courantes. Voir le tableau&nbsp;\ref{Tableau_associations_courantes}.
- En UML les associations sont représentées par des lignes entre classes.
  - Elles sont nommées (avec un verbe commençant par une lettre majuscule).
  - Des noms simples comme "A", "Utilise", "Possède", "Contient", etc. sont généralement des choix médiocres, car ils n'aident pas notre compréhension du domaine. Essayez de trouver des noms plus riches, si possible.
  - Une flèche (triangle) de "sens de lecture" optionnelle indique la direction dans laquelle lire l'association. Si la flèche est absente, on lit l'association de gauche à droite ou de haut en bas.
  - Les extrémités des associations ont une expression de la multiplicité indiquant une relation numérique entre les instances des classes.
  Vous pouvez en trouver plusieurs exemples dans la figure&nbsp;\ref{MDD-jeu-de-risk}.

:Extrait du tableau 9.2&nbsp;\faBook&nbsp;du livre du cours.\label{Tableau_associations_courantes}

**Catégorie** | **Exemple**
:----------|:----------
**A est une transaction liée à une transaction B**| *PaiementEnEspèces&nbsp;--&nbsp;Vente* \
*Réservation&nbsp;--&nbsp;Annulation*\newline
**A est un élément d'une transaction B**| *LigneArticles&nbsp;--&nbsp;Vente*\newline
**A est un produit pour une transaction (ou un élément de transaction) B**| *Article&nbsp;--&nbsp;LigneArticles&nbsp;(ou&nbsp;Vente)* \
*Vol&nbsp;--&nbsp;Réservation*\newline
**A est un rôle lié à une transaction B**| *Client&nbsp;--&nbsp;Paiement* \
*Passager&nbsp;--&nbsp;Billet*\newline
**A est une partie logique ou physique de B**| *Tiroir&nbsp;--&nbsp;Registre* \
*Case&nbsp;--&nbsp;Plateau* \
*Siège&nbsp;--&nbsp;Avion*\newline
**A est physiquement ou logiquement contenu dans B**| *Registre&nbsp;--&nbsp;Magasin* \
*Joueur&nbsp;--&nbsp;Monopoly* \
*Passager&nbsp;--&nbsp;Avion*\newline
**A est une description de B**| *DescriptionProduit&nbsp;--&nbsp;Article* \
*DescriptionVol&nbsp;--&nbsp;Vol*\newline
**A est connu/consigné/enregistré/saisi dans B**| *Vente&nbsp;--&nbsp;Registre* \
*Pion&nbsp;--&nbsp;Case* \
*Réservation&nbsp;--&nbsp;ManifesteDeVol*\newline
**A est un membre de B**| *Caissier&nbsp;--&nbsp;Magasin* \
*Joueur&nbsp;--&nbsp;Monopoly* \
*Pilote&nbsp;--&nbsp;CompagnieAérienne*\newline
**A est une sous-unité organisationnelle de B**| *Rayon&nbsp;--&nbsp;Magasin* \
*Maintenance&nbsp;--&nbsp;CompagnieAérienne*\newline
**A utilise, gère ou possède B**| *Caissier&nbsp;--&nbsp;Registre* \
*Joueur&nbsp;--&nbsp;Pion* *Pilote&nbsp;--&nbsp;Avion*\newline
**A est voisin de B**| *Article&nbsp;--&nbsp;Article* \
*Case&nbsp;--&nbsp;Case* \
*Ville&nbsp;--&nbsp;Ville*

## Exemple de MDD pour le jeu de Risk

```{.plantuml hide-image=true plantuml-filename=build/images/diag_MDD.pdf}
@startuml
!include ../forme.pumlinclude
scale 1
hide empty members
class Joueur {
  nom : String
}
class Dé {
  valeur : int
}

class JeuRisk

class "PlateauRisk" as PR

class Pays {
  nom : String
}

class Attaque {
  nbAttaquant : int
  nbDéfenseur : int
}

class Occupation {
  nbRégiments : int
}

PR "1" *-- "42" Pays : Contient >
PR "1" *-- "6" Continent : Est-\ndivisé-\nen >
Continent "1" *-- "4,6,\n7,9,\n12" Pays : Groupe >
Pays "1" -- "1..*" Pays : Est-voisin-de >
JeuRisk "1" -l- "1" PR : Est-joué-sur >
JeuRisk "1" -d- "5" Dé : Inclut >
' ligne suivante contient un espace large ( )
Joueur "2:6" -l- "1" JeuRisk : Joue >
Joueur "1" -- "1..*" Pays : Contrôle >
(Joueur, Pays) .. Occupation
'Joueur "1" -- "*" Régiment : Contrôle >
'Pays "1" -l- "*" Régiment : < Protège-\nou-\nattaque
Pays "1" -l- "1..*" Attaque : Lance >
Pays "1" -- "1..*\n" Attaque : Défend-contre >
Joueur "1" -- "1,2,3" Dé : Jette >

@enduml
```

![Modèle du domaine du jeu de Risk. [(PlantUML)](http://www.plantuml.com/plantuml/uml/VPJDRjD04CVlbleE8r_ILab42XHXeQfLgQf29QAamAMNhJrr5gzdmtwaH0W9teRUUOEy2K_2h1tNReWgHUlOyvllltridJ3EbogoXQIvCA84wvOA-JGo3PQTZkb6f4LkjASirKeRS4QGPHEIsubwu6RI0ly4p0HbTqOwXmItcXn8Wi-ICdrd6Mm3PdWhl7818L4Yl3VI1f-BgrFchcPe4RIReR6Wj2uWDoYgODDFvx1RYe8BzGOvCovxV9N43Ic56MSrS79v2H-dPvDf9psCdkrrMzgim8ey7FHqdHTKm3lj3Gdr9FUjI3EOfaREtPFS67bKndOBwuxG6O-HJGNlPHJDP8Q0vTmjeSJoXjsYL0bhGq7e3NoF04YNaC2KTqXvz6DjVxkwhumBZiDSmbDnR6oyqK-aBPhRUAo4Gr4zYq5O64yQqrWixROiQ_E9S-AhnvgugUy4Iw3E5vvn8RT8TaiH7zBKpuMJcjRkazLzBalMbstHyGJYKGpxWm74BmxYkfu4JdcOaaauUaGSnhM5iAhXpBh1DMLo8Utgdl_nT8-Y5cW3zm_xr_Ig_vhFKPladDK_nv0Yt0SwmAFXSFy12HaMMbf9WooGwy7Mi1fKLowm1hzepsMmXZV1ZC6NSRMpXEMMAXyQwu6IEGNHomNF525jclO4oAzYYg24OGdl_ltvQozQIo8-I0xRv4sUf59CIBocjdKJHcDMVrJWTckmNzdsO3Zix2lgRKJX40_BsuZJQuUd_YVVmDXej_gT8wz7Upv4hQZeiLjTPgEs12u5fLitSqrTh1PVDWYJCzkwxn_qdpU3VnVUIsQYOtRXZ-4_)](build/images/diag_MDD.pdf){#MDD-jeu-de-risk}

## Attributs dérivés

Les attributs dérivés sont expliqués en détail dans la section 9.16&nbsp;\faBook&nbsp;du livre du cours. 
Il s'agit des attributs qui sont calculés à partir d'autres informations reliées à la classe.
Ils sont indiqués par le symbole `/` devant leur nom.
L'exemple à la figure&nbsp;\ref{MDD-attribut-derive} s'applique à la règle du jeu de Risk spécifiant qu'un joueur reçoit un certain nombre de renforts selon le nombre de pays occupés. La classe Joueur pourrait avoir un attribut dérivé `/nbPaysOccupés` qui est calculé selon le nombre de Pays contrôlés par le joueur.

```{.plantuml hide-image=true plantuml-filename=build/images/attributs_derives_MDD.pdf}
@startuml
!include ../forme.pumlinclude
scale 1
hide empty members
class Joueur {
  nom : String
  <color:blue>/nbPaysOccupés : int</color>
}
class Pays {
  nom : String
}
class Occupation {
  nbRégiments : int
}
Joueur "1" -- "1..*" Pays : Contrôle >
(Joueur, Pays) .. Occupation
@enduml
```

![Classe d'association dans le MDD Jeu de Risk. [(PlantUML)](http://www.plantuml.com/plantuml/uml/VPBFQXmn3CRlXho3s4kIqcowroKiAQ6Kf866JFwSDHvbnemjBx9DkfG-KEvzWtsnQcQtP6XXmTWO_VJfa-NBb55o2Twatl4Q1GEalF6akpWxH8uceHfjtqeitDZeeq0MvAGXudnaZY5tBe4kX0wvUHMNCp6yHCxW69uTD_4rAVWksD0B5fy7X34GV1ENXfphXolb7ZfA135t90byZ3sqGZYALKzVuIHWhqQBa5QcpR6UZhKXxwdHgWAVRs_XiVfoNqtAm-BJwRIbVnqaR8UD3_kyvXvkOX56Vv3xqTi6AYjkdGzoTwHF9MbgRFg4MGgPP57diZ2TQmWehFC60eLQquprcD9WY8h0JmF0CS0IAfqXjtgz6CUrh7sXrJdNTxX9twqjw-rRKinnlZWVYPNvjTSQaF-L_aR7PCmkyewfxxTlhGlw3VPwIkxTp1OpE3lJOpx_CDl9Bk5A-vRjRsrdPKvsuCSnTWhp-KJTN18t-WV_0000)](build/images/attributs_derives_MDD.pdf){#MDD-attribut-derive}

## Classes d'association

Les classes d'association dans le MDD sont le sujet de la section A32.10/F26.10&nbsp;\faBook&nbsp;du livre du cours.

> Une classe d'association permet de traiter une association comme une classe, et de la modéliser avec des attributs...

Il pourrait être utile d'avoir une classe d'association dans un MDD si:

- un attribut est lié à une association;
- la durée de vie des instances de la classe d'association dépend de l'association;
- il y a une association $N$-$N$ entre deux concepts et des informations liées a l'association elle-même.

Dans l'exemple à la figure&nbsp;\ref{MDD-classe-association}, voici pourquoi il y a une classe d'association Occupation. 
Lorsqu'un Joueur contrôle un Pays, il doit y avoir des armées dans ce dernier. 
Le MDD pourrait avoir un attribut `nbRégiments` dans la classe Pays. 
Cependant, l'attribut `nbRégiments` est lié à l'association entre le Joueur et le Pays qu'il contrôle, alors on décide d'utiliser une classe d'association. 

Si un Joueur envahit un Pays, la nouvelle instance de la classe d'association Occupation sera créée (avec la nouvelle association). 
Pourtant, cette instance d'Occupation sera détruite si un autre Joueur arrive à prendre le contrôle du Pays. 
Alors, la durée de vie de cette instance dépend de l'association. 

Voir le livre obligatoire pour plus d'exemples.

```{.plantuml hide-image=true plantuml-filename=build/images/classe_association_MDD.pdf}
@startuml
!include ../forme.pumlinclude
scale 1
hide empty members
class Joueur {
  nom : String
}
class Pays {
  nom : String
}
class Occupation {
  nbRégiments : int
}
Joueur "1" -- "1..*" Pays : Contrôle >
(Joueur, Pays) .. Occupation
@enduml
```

![Classe d'association dans le MDD Jeu de Risk. [(PlantUML)](http://www.plantuml.com/plantuml/uml/VPBFIWD13CRl0xv3wALLRB5N3r8f8bL1wVhddCwckyFEP4fc5YtY0tdt3NmnirPm4ImCayFtI_9bChEKKN8Rl4cDumqA1aXvwqblSRPJ3dhI2crJIMovjD57WIp8IINYV626a6kNG0z2ZLm-YykP6DQHCpY69yTbV4uA_XOiQOsjpnt260YknQKkPt4_L-w-faGGSqsImCVOG2M4tyMAnqiO1MpKQ2kadMaxrEXO1_AUIkqgS7vp0m_5nRBejOVfoM5_fByE4bRTnVjzBhY1gzWAez_BlJIsXCAAs-Izt1tfKqdg6-i_OPQMJBAeUvcQsfK453Pv2u72IjECzPXIPuXQWLS3m370AHIwGwxCsuz-XzlqltfhRRl1x2BlcDNoyxroGLUR57QSbVpfC9WEO3pMC9aS3NPbJs6kiyZdXreyCwCTUFoj7S9aqgjkPiIb_gil)](build/images/classe_association_MDD.pdf){#MDD-classe-association}


## Affinement du MDD

Lorsqu'on modélise un domaine, il est normal de commencer avec un modèle simple (à partir d'un ou deux cas d'utilisation) et ensuite on l'affine dans les itérations suivantes, où on y intègre d'autres éléments plus subtils ou complexes du problème qu'on étudie. Les détails de cette approche sont présentés dans le chapitre F26/A32&nbsp;\faBook&nbsp;du livre du cours. Bien que la matière soit présentée plus tard dans le livre, ce sont des choses à savoir pour la modélisation d'un domaine, même dans une première itération. 

Voici un résumé des points importants traités dans ce chapitre, dont quelques uns ont déjà été présentés plus haut:

- Composition/Agrégation
- Généralisation/spécialisation
- Attribut dérivé
- Hiérarchies dans un MDD et héritage dans l’implémentation
- Noms de rôles
- Organisation des classes conceptuelles en Packages

## FAQ MDD

**Question:** Est-ce qu'il y a un MDD pour chaque cas d'utilisation?

**Réponse:** Selon la méthodologie du livre du cours, il n'y a qu'un seul MDD pour un domaine d'application. Une application peut avoir beaucoup de fonctionnalités (cas d'utilisation), mais il y a un seul MDD.

Cela dit, la notion d'une *version* de MDD existe (par exemple, une version pour chaque itération). Le MDD évoluera normalement après chaque nouvelle analyse. Le MDD au début d'un projet est plus simple, puisqu'il porte sur seulement les cas d'utilisation ciblés à la première itération. Le MDD devient plus riche au fur et à mesure qu'on avance dans les itérations, parce qu'il a de plus en plus de fonctionnalités réalisées.

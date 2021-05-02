# Modèle du domaine (MDD, modèle conceptuel)

Les MDD sont expliqués en détail dans le chapitre 9\ \faBook\ du livre du cours, mais voici des points importants pour LOG210:

- Les classes conceptuelles ne sont pas des classes logicielles. Ainsi, selon la méthodologie de Larman, *elles n'ont pas de méthodes*.
- Les classes ont des noms commençant avec une lettre majuscule, par exemple `Joueur` et elles ne sont jamais au pluriel, par exemple ~~`Joueurs`~~.

## Classes conceptuelles

Il y a trois stratégies pour identifier les classes conceptuelles:

1. Réutiliser ou modifier des modèles existants.
2. Utiliser une liste de catégories.
3. Identifier des groupes nominaux.

### Catégories pour identifier des classes conceptuelles

:Extrait du tableau 9.1\ \faBook\ du livre du cours.

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

Les attributs sont le sujet de la section 9.16\ \faBook\ du livre. 
Comme c'est le cas pour les classes et les associations, on fait figurer les attributs *quand les cas d'utilisation suggèrent la nécessité de mémoriser des informations*.

Pour l'UML, la syntaxe complète d'un attribut est\ :

**visibilité nom : type multiplicité = défaut {propriété}
**

Voici des points importants:

- *Le type d'un attribut est important et il faut les spécifier dans un MDD*, même si dans le livre du cours il y a plusieurs exemples sans type.
- On ne se soucie pas de la visibilité des attributs dans un MDD.
- Faites attention à l'attribut qui devrait être une classe. Si on ne pense pas un attribut *X* en termes alphanumériques dans le monde réel, alors il s'agit probablement d'une classe conceptuelle. Voir la section 9.12\ \faBook\ du livre.
- De la même manière, faites attention aux informations qui sont mieux modélisées par des associations, par exemple dans la figure\ \ref{MDD-jeu-de-risk} la classe `Pays` n'a pas un *attribut* `joueur:Joueur` (qui contrôle le Pays), mais elle a plutôt une *association* avec la classe `Joueur` et un verbe `contrôle`. 

> \faWarning \ Il est vrai que dans un langage de programmation, les associations doivent être les attributs dans les classes. Cependant, dans un modèle du domaine on cherche à éviter des attributs si une association peut mieux décrire la relation. La relation relie visuellement les deux classes et elle est décrite avec un verbe.

## Associations

Les associations dans le MDD sont le sujet de la section 9.14\ \faBook\ du livre du cours.
Il faut se référer au contenu du livre pour les détails.
Une association est une relation entre des classes (ou des instances de classes).
Elle indique une connexion significative ou intéressante.
Voici des points importants:

- Il est facile de trouver beaucoup d'associations, mais il faut se limiter à celles qui doivent être conservées un certain temps.
Pensez à la **mémorabilité** d'une association dans le contexte du logiciel à développer. Par exemple, considérez les associations de la figure\ \ref{MDD-jeu-de-risk}:
  - Il existe une association entre `Joueur` et `Pays`, car il est important de savoir quel joueur contrôle quel pays dans le jeu de Risk.
  - Il n'y a pas d'association entre `JeuRisk` et `Attaque`, même si les attaques font partie du jeu. Il n'est pas essentiel de mémoriser l'historique de toutes les attaques réalisées dans le jeu.
- Il y a des associations dérivées de la liste des associations courantes. Voir le tableau\ \ref{Tableau_associations_courantes}.
- En UML les associations sont représentées par des lignes entre classes.
  - Elles sont nommées (avec un verbe commençant par une lettre majuscule).
  - Des noms simples comme "A", "Utilise", "Possède", "Contient", etc. sont généralement des choix médiocres, car ils n'aident pas notre compréhension du domaine. Essayez de trouver des noms plus riches, si possible.
  - Une flèche (triangle) de "sens de lecture" optionnelle indique la direction dans laquelle lire l'association. Si la flèche est absente, on lit l'association de gauche à droite ou de haut en bas.
  - Les extrémités des associations ont une expression de la multiplicité indiquant une relation numérique entre les instances des classes.
  Vous pouvez en trouver plusieurs exemples dans la figure\ \ref{MDD-jeu-de-risk}.

:Extrait du tableau 9.2\ \faBook\ du livre du cours.\label{Tableau_associations_courantes}

**Catégorie** | **Exemple**
:----------|:----------
**A est une transaction liée à une transaction B**| *PaiementEnEspèces\ --\ Vente* \
*Réservation\ --\ Annulation*\newline
**A est un élément d'une transaction B**| *LigneArticles\ --\ Vente*\newline
**A est un produit pour une transaction (ou un élément de transaction) B**| *Article\ --\ LigneArticles\ (ou\ Vente)* \
*Vol\ --\ Réservation*\newline
**A est un rôle lié à une transaction B**| *Client\ --\ Paiement* \
*Passager\ --\ Billet*\newline
**A est une partie logique ou physique de B**| *Tiroir\ --\ Registre* \
*Case\ --\ Plateau* \
*Siège\ --\ Avion*\newline
**A est physiquement ou logiquement contenu dans B**| *Registre\ --\ Magasin* \
*Joueur\ --\ Monopoly* \
*Passager\ --\ Avion*\newline
**A est une description de B**| *DescriptionProduit\ --\ Article* \
*DescriptionVol\ --\ Vol*\newline
**A est connu/consigné/enregistré/saisi dans B**| *Vente\ --\ Registre* \
*Pion\ --\ Case* \
*Réservation\ --\ ManifesteDeVol*\newline
**A est un membre de B**| *Caissier\ --\ Magasin* \
*Joueur\ --\ Monopoly* \
*Pilote\ --\ CompagnieAérienne*\newline
**A est une sous-unité organisationnelle de B**| *Rayon\ --\ Magasin* \
*Maintenance\ --\ CompagnieAérienne*\newline
**A utilise, gère ou possède B**| *Caissier\ --\ Registre* \
*Joueur\ --\ Pion* *Pilote\ --\ Avion*\newline
**A est voisin de B**| *Article\ --\ Article* \
*Case\ --\ Case* \
*Ville\ --\ Ville*

## Exemple de MDD pour le jeu de Risk

```{.plantuml caption="Modèle du domaine du jeu de Risk. [(PlantUML)](http://www.plantuml.com/plantuml/uml/VLJRRjD047ttLupyuXObWHGe8a9Lgr9LBPM8aW8lVTdOKsVnUZRi9IL2IF0tv9q_o9_m9SpQSPscKQLedVMScNFspAoFhHF6-L95jf0q4qQKODr28Qz6fbkHYKYBt6XFMQgLDk2C8CiX91SbuARI0ly4J0LbTqOwXmItcXn8WY-ICdrdewGjb-6jyCe518aIuOEHDgHSN9z6oVKKBO9sKpGMbDO5v0P5LMhy-HpsIb6mI6-GUN6Hy5CI7qOfp9ZJmCdL5NmQdut66-JGVx7_b00hyh3Gaoelg81BxGs9JMksKT-BD8DnQkJCFLLiY6oIiHk5DhrpncDaKy7jw4TJcI5WENCBAB6SXAnK2Mk36FG6VaG0f4iOm9XRHpbldzDaA1RsOvhwsMffEIIvKp_NUUzNooffplKvlmasLT6Ff2sQRJnKmg6etiKWB0n7JIXGF6Q_BtJYdFZciKPCwftWcQZvmZiMSejaTuYeb0idDQtJHwjbBakUj_OmqN04SJ-6PzqknAyEubhF04xPOyb8E7g0E8ph266buSowxWrbSYxjQid_sFMZg0MqXJk7dHjwqtdBQxybEUVRCCD04VO17S3zNk_PFIGmpBMqahfPGAwDhS6gMprPO0tygZtBuB7U1cOCV1rNFHlm2ARAXuCbe6HEuHx8ENkAa3Q7zWJ8LpD5KCBmLE_z-_LxFrgFIWm01uF3bh-X6bJ35BZNm5q72kwOrLyLS7iri5F5zg7NssXPb6nLuHBt_TkgaxJ-gSV8Tp0qsgt-vCWTqfuNKGzLz32jbjaCt02k1AKxctD3cx1w_h9kCC_iEdtdeFEoyVuot5Z6HCUSmf_7_m00)" #MDD-jeu-de-risk}
@startuml
!include ../forme.pumlinclude
scale 1
hide empty members
class Joueur {
  nom : String
  /nbPaysOccupés : int
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
Joueur "   2:6" -l- "1" JeuRisk : Joue >
Joueur "1" -- "1..*" Pays : Contrôle >
(Joueur, Pays) .. Occupation
'Joueur "1" -- "*" Régiment : Contrôle >
'Pays "1" -l- "*" Régiment : < Protège-\nou-\nattaque
Pays "1" -l- "1..*" Attaque : Lance >
Pays "1" -- "1..*\n" Attaque : Défend-contre >
Joueur "1" -- "1,2,3" Dé : Jette >

@enduml
```

## Attributs dérivés

Les attributs dérivés sont expliqués en détail dans la section 9.16\ \faBook\ du livre du cours. 
Il s'agit des attributs qui sont calculés à partir d'autres informations reliées à la classe.
Ils sont indiqués par le symbole **`/`** devant leur nom.
L'exemple à la figure\ \ref{MDD-attribut-derive} s'applique à la règle du jeu de Risk spécifiant qu'un joueur reçoit un certain nombre de renforts selon le nombre de pays occupés. La classe Joueur pourrait avoir un attribut dérivé `/nbPaysOccupés` qui est calculé selon le nombre de Pays contrôlés par le joueur.

```{.plantuml caption="`nbPaysOccupés` est un attribut dérivé et sa valeur sera calculée selon le nombre de pays de l'association. [(PlantUML)](http://www.plantuml.com/plantuml/uml/VLB1QW8n4BtdAmOlsnRKUXKHYvHYArIwjZt7xEY6pKvaac2b-46zzm_yiSvQeM9123E4UNdlpKn68MgEgNOgL9RMcdKD8MuTIcHhpYeBRQeL-qI5ySupHDOKf8GKLGQnj07aQ2Wr5HksCIB1qbC4I_1kgV2ReB8_kWANEhdO84ZN24ziG_DaCX-hR5vYGF2nH0xWlAzWnQWFLFdR0rpLkXAJYL5qSPj9jYJDE8U5Q3BSJQVmcj-_v2VYqBkzlcGWw5KJwABB2LNmw1EJFXtDEUgZCWNaXkqwNYAReGo9mmdHwUmY9rJ1Q5b7JvMsGC1w7RTGOxreNXcdGsZCO6BuL03aQ-X3BgkZbLm7XpNr5oxXi4kBcTw6PsFIUlyL16Of3he7n53jZbmDv3_JJXqrMhqMjDkIEfsRrY-u3sDfXlVVOdAeHaY5_9aV)" #MDD-attribut-derive}
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
Joueur "1" -- "1..*" Pays : Contrôle >
@enduml
```

## Classes d'association

Les classes d'association dans le MDD sont le sujet de la section A32.10/F26.10\ \faBook\ du livre du cours.

> Une classe d'association permet de traiter une association comme une classe, et de la modéliser avec des attributs...

Il pourrait être utile d'avoir une classe d'association dans un MDD si:

- un attribut est lié à une association;
- la durée de vie des instances de la classe d'association dépend de l'association;
- il y a une association $N$-$N$ entre deux concepts et des informations liées a l'association elle-même.

Dans l'exemple à la figure\ \ref{MDD-classe-association}, voici pourquoi il y a une classe d'association Occupation. 
Lorsqu'un Joueur contrôle un Pays, il doit y avoir des armées dans ce dernier. 
Le MDD pourrait avoir un attribut `nbRégiments` dans la classe Pays. 
Cependant, l'attribut `nbRégiments` est lié à l'association entre le Joueur et le Pays qu'il contrôle, alors on décide d'utiliser une classe d'association. 

Si un Joueur envahit un Pays, la nouvelle instance de la classe d'association Occupation sera créée (avec la nouvelle association). 
Pourtant, cette instance d'Occupation sera détruite si un autre Joueur arrive à prendre le contrôle du Pays. 
Alors, la durée de vie de cette instance dépend de l'association. 

Voir le livre obligatoire pour plus d'exemples.

```{.plantuml caption="Classe d'association dans le MDD Jeu de Risk. [(PlantUML)](http://www.plantuml.com/plantuml/uml/VPBFIWD13CRl0xv3wALLRB5N3r8f8bL1wVhddCwckyFEP4fc5YtY0tdt3NmnirPm4ImCayFtI_9bChEKKN8Rl4cDumqA1aXvwqblSRPJ3dhI2crJIMovjD57WIp8IINYV626a6kNG0z2ZLm-YykP6DQHCpY69yTbV4uA_XOiQOsjpnt260YknQKkPt4_L-w-faGGSqsImCVOG2M4tyMAnqiO1MpKQ2kadMaxrEXO1_AUIkqgS7vp0m_5nRBejOVfoM5_fByE4bRTnVjzBhY1gzWAez_BlJIsXCAAs-Izt1tfKqdg6-i_OPQMJBAeUvcQsfK453Pv2u72IjECzPXIPuXQWLS3m370AHIwGwxCsuz-XzlqltfhRRl1x2BlcDNoyxroGLUR57QSbVpfC9WEO3pMC9aS3NPbJs6kiyZdXreyCwCTUFoj7S9aqgjkPiIb_gil)" #MDD-classe-association}
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

## Affinement du MDD

Lorsqu'on modélise un domaine, il est normal de commencer avec un modèle simple (à partir d'un ou deux cas d'utilisation) et ensuite on l'affine dans les itérations suivantes, où on y intègre d'autres éléments plus subtils ou complexes du problème qu'on étudie. Les détails de cette approche sont présentés dans le chapitre F26/A32\ \faBook\ du livre du cours. Bien que la matière soit présentée plus tard dans le livre, ce sont des choses à savoir pour la modélisation d'un domaine, même dans une première itération. 

Voici un résumé des points importants traités dans ce chapitre, dont quelques-uns ont déjà été présentés plus haut:

- Composition/Agrégation
- Généralisation/spécialisation
- Attribut dérivé
- Hiérarchies dans un MDD et héritage dans l'implémentation
- Noms de rôles
- Organisation des classes conceptuelles en Packages

## FAQ MDD

### Y a-t-il un MDD pour chaque cas d'utilisation?{#mddchaquecasutilisation}

Selon la méthodologie du livre du cours, bien qu'une application a souvent plusieurs fonctionnalités (cas d'utilisation), il n'y a qu'un seul MDD.

Cela dit, Le MDD est comme un fichier de code source.
Sa *version* peut évoluer avec le projet.
Le MDD évoluera normalement après chaque itération, car on fait une nouvelle analyse pour les nouvelles fonctionnalités visées dans l'itération.
Au début du projet, le MDD est plus simple, puisqu'il porte sur seulement les cas d'utilisation ciblés à la première itération.
Le MDD devient plus riche au fur et à mesure qu'on avance dans les itérations, parce qu'il modélise davantage de concepts reliés aux problèmes traités par les nouvelles fonctionnalités à réaliser.

Par exemple, dans\ \faBook\ le livre du cours la version initiale du MDD (chapitre 9) ne traite pas la fonctionnalité de paiement par carte de crédit.
Les classes conceptuelles modélisant la problématique de paiements par carte de crédit sont absentes dans le MDD initial.
Plus tard (après plusieurs itérations, dans le chapitre sur le raffinement du MDD), on voit un MDD beaucoup plus riche qui reflète la modélisation des concepts reliés à des fonctionnalités comme les paiements par carte de crédit, les demandes d'autorisation de paiement, etc.

### Un **modèle du domaine** est-il la même chose qu'un **modèle de données**?{#mdd_donnees}

Voici la réponse de Craig Larman dans la section 9.2\ \faBook\ du livre du cours:

> *Un **modèle du domaine** n'est pas un **modèle de données** (qui représente par définition des objets persistants stockés quelque part).*

Il peut y avoir des concepts dans un domaine qui ne sont pas dans la base de données. Considérez l'exemple de la carte de crédit utilisée pour payer mais qui n'est jamais stockée pour les raisons de sécurité. Avec seulement un modèle de données, cette classe conceptuelle ne serait jamais modélisée. Larman précise:

> *N'excluez donc pas une classe simplement parce que les spécifications n'indiquent pas un besoin évident de mémoriser les informations la concernant (un critère courant pour la modélisation des données quand on conçoit des bases de données relationnelles mais qui n'a pas cours en modélisation d'un domaine), ou parce que la classe conceptuelle ne possède pas d'attributs. Il est légal d'avoir une classe conceptuelle sans attribut, ou une classe conceptuelle qui joue un rôle exclusivement comportementale dans le domaine.*

\faStackOverflow\ Vous pouvez aussi lire [cette question sur stackoverflow](https://stackoverflow.com/q/3507671/1168342).

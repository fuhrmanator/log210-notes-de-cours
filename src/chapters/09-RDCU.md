# Réalisations de cas d'utilisation (RDCU){#sec:RDCU}

Les réalisations de cas d'utilisation (RDCU) sont le sujet du chapitre F17/A18\ \faBook.
Voici les points importants pour le cours:

- Une RDCU est une synthèse des informations spécifiées dans le MDD, le DSS et les contrats d'opération.
Elle sert à esquisser une solution (qui n'est pas encore codée) afin de rendre plus explicite l'activité impliquant des choix de conception.
Si vous n'avez pas bien compris les autres éléments (MDD, DSS, etc.), il est difficile de réussir les RDCU dans le cours.
Il est normal de ne pas tout comprendre au début, alors posez les questions si vous ne comprenez pas.
- De manière générale, toute bonne RDCU doit faire les choses suivantes:
  - spécifier un contrôleur (pour la première opération système dans un DSS, qui sera le même pour le reste des opérations dans le DSS);
  - satisfaire les postconditions du contrat d'opération correspondant;
  - rechercher les informations qui sont éventuellement rendues à l'acteur dans le DSS.
- Il s'agit d'un diagramme de séquence en UML.
Il faut alors maîtriser la notation UML pour ces diagrammes, mais on applique la notation de manière agile:
  - Il n'est pas nécessaire de faire les boîtes d'activation, car ça prend du temps à les faire correctement lorsqu'on dessine à la main un diagramme.
  - On doit se servir des annotations pour documenter les choix (GRASP).
  - On dessine à la main des diagrammes puisqu'on peut faire ça en équipe à un tableau blanc. Mais aussi, à l'examen vous devez faire des diagrammes à la main.
  - Au lieu d'un message pointillé indiquant le retour d'une valeur à la fin de l'exécution d'une méthode, on utilise l'affectation sur le message (comme dans la programmation), par exemple `c = getClient(...)` à la figure\ \ref{RDCU_ID_en_objets}
- Le livre présente quelques RDCU qui sont des *diagrammes de communication*. Cette notation n'est pas utilisée dans le cours, car elle est plus complexe à utiliser et elle est comparable à la notation des diagrammes de séquence.
- Faire des RDCU est plus agile que coder, car dans un diagramme on peut voir le flux de plusieurs messages à travers plusieurs classes.
Dans une solution codée, il serait nécessaire d'ouvrir plusieurs fichiers afin de voir le code de chaque méthode (message) et on ne peut pas voir toute la dynamique de la même manière.
Faire des changements à un diagramme (avant de le coder) est en principe plus facile que changer le code source.
On peut également se servir des structures (`List`, `Array`, `Map`, etc.) dans un diagramme, avant que celles-ci ne soient créées.
- Faire des RDCU est une activité créative.
Un diagramme dynamique en UML peut avoir une mauvaise logique, car il s'agit d'un dessin.
*Le codage dans un langage de programmation est la seule manière de valider une RDCU*.
Évidemment, la programmation prend beaucoup plus de temps et n'est pas insignifiante.
Faire une RDCU est comme faire un *plan* pour un bâtiment, tandis que faire de la programmation est comme *construire* le bâtiment.
Si un plan contient des erreurs de conception, on va les savoir lors de la construction.
Alors, votre RDCU sera en doute jusqu'à ce que vous la traduisiez en code exécuté et testé.

Tout le processus de proposer une solution (RDCU) peut être visualisé comme un diagramme d'activités, comme dans la figure\ \ref{RDCU_Aide_Memoire}.

```{.plantuml caption="Aide mémoire pour faire une RDCU. L'étape en rouge nécessite beaucoup de pratique, selon la complexité des postconditions. Vous pouvez vous attendre à ne pas la réussir du premier coup. [(PlantUML)](http://www.plantuml.com/plantuml/uml/TLHDJnin4BtxLqp3WMILBaALMXGG8YLjLQb55RGzSJ7hsOsBrtOzTg3_gBdt7-mVwtYJG8BWubtPy_7clMUVKPGXfjQ0s7-bRMMIGYZBWzg55alF1-jDGRVQUXba2pINojrfsq0j3MsVl9VLRHDSikhS6HTWhfL2knKmmrec4x_ZVPmQtTWMROIA5mnRKHSkucw8mJgA7Yg8W1ubVoUNk70wWDbtlbi66RMpG7yeTdzRF0PXkGe4tSpZ1F2-XC6WAAhGBJ5SkBH0O_1dRZmS5SLW8FQKgckb9hDkoM1QRP4h8rJEnj3zCvZ2yKx5gVT6_quSLHIVBgTNt-3yCRGehktmV2wzZW7Xu-7Ryl3DmVJm7Nz66RZq7irM0nv7RKtn1FmN96xY7KKELZf7K56Cyr3ZQmklVrW4RPaTMo6SwDF5oO4-1TQndmyay4ZT4lBiF7tEU0ZQd4aYLsa-1PdW4XjD33n7phYtZ37ecnGfrtn8PTphP6qPapIQkYLjv15xcKtcarcfLZeDCKAGTPsf7K6oeBHiMEuMUNYTBI2hF9lmBhsWwfXv8DwYMcgI322w597944LX6EbJZa2bPma6Z9mHaDE3pNKC0yYMNxT3mokBqoAHR1WVzYrM2QkoiwkhSQ-V9AQXcdTBhhDj4V6CGrW16Nj_Z45iTZ_SUmmnRnN5vncW1NVp2sEMM62iIjWnqb7leoE1La5kjhaETtFDQ8O1AMQyJxd81baJnuHTMvSWJynXZ1zjvRZycWzs0OtWnRgFBDA3BXnEqNbXiCcuyc--mnF8rYHdKa-hOhj8RKos6PU37WlqQbTpoKp1CvAN86PieJ5emmaf0jTYgwqkpre4seXCEoht-doTCQNv0I7X0xzbsdFuYlXLPmJEN32kCdEwca2SyS9ltty0)" #RDCU_Aide_Memoire }
@startuml 
'!include ../forme.pumlinclude
skinparam shadowing false
skinparam BackgroundColor hidden
skinparam DefaultTextAlignment center
skinparam NoteTextAlignment left
start 
repeat 
:Revoir l'opération système; 
note right: ex. ""**créerNouvelleVente()**""
#ddffdd:Déterminer le contrôleur;
note right: Appliquer **GRASP Contrôleur**\n(Chapitre F16.13/A17.13) 
:Rappeler le contrat d'opération; 
note right: Les **postconditions**, ex.,\n -Une instance <i>v</i> de Vente a été créée\n -<i>v</i> a été associée au Registre\n -Des attributs de <i>v</i> ont été initialisés 
repeat
#ffdddd:Concevoir (et raffiner) un diagramme d'interaction
pour l'opération système, **satisfaisant toutes**
**les postconditions** du contrat d'opération et
**retournant l'information selon le message de**
**retour** du DSS, le cas échéant;
note right
Appliquer **GRASP Créateur**, 
**GRASP Expert**, **ID en objets**,
etc. Chapitre F16.8/A17.8
end note
repeat while (reste des postconditions insatisfaites\nou infos pas encore retournées) 
repeat while (reste des opérations système) 
stop
legend top
Note: Une solution détaillée est faite pour chaque opération système. 
Donc, il faut utiliser le DSS, les contrats d'opération, le MDD et les
principes GRASP pour ce travail.
endlegend
@enduml
```

## Spécifier le contrôleur

Pour commencer une RDCU, on spécifie le contrôleur selon GRASP. 
Dans les travaux pour le cours, vous devez indiquer *pourquoi vous avez choisi telle classe pour être le contrôleur*.
Ce n'est pas un choix arbitraire.
Référez-vous à la définition dans \nameref{tab_GRASPControleur}.

Pour initialiser les liens entre la couche présentation et les contrôleurs GRASP, Larman vous propose de le faire dans la \nameref{RDCU_Demarrer}.

## Satisfaire les postconditions

### Créer une instance

Certaines postconditions concernent la création d'une instance.
Dans votre RDCU, vous devez respecter le GRASP Créateur.
Référez-vous à la définition dans le \nameref{tab_GRASPCreateur}.

> \faWarning\ Une erreur potentielle est de donner la responsabilité de créer à un contrôleur, puisqu'*il a les données pour initialiser* l'objet. Bien que ce soit justifiable par le principe GRASP Créateur, il vaut mieux favoriser une classe qui *agrège* l'objet à créer, le cas échéant.

### Former une association

Pour les postconditions où il faut former une association entre un objet *a* et *b*, il y a plusieurs façons de faire.

- S'il y a une agrégation entre les objets, il s'agit probablement d'une méthode `add()` sur l'objet qui agrège.
- S'il y a une association simple, il faut considérer la navigabilité de l'association. Est-ce qu'il faut pouvoir retrouver l'objet *a* à partir de l'objet *b* ou vice-versa? Il s'agira d'une méthode `setB(b)` sur l'objet `a` (pour trouver *b* à partir de *a*), etc.
- S'il faut former une association entre un objet et un autre "sur une base de correspondance avec" un identifiant passé comme argument, alors il faut repérer le bon objet d'abord. Voir la section \nameref{TransformerIDenObjets}.

Dans la plupart des cas, la justification GRASP pour former une association est Expert, défini dans le \nameref{tab_GRASPExpert}. Il faut faire attention à la \hyperref[Visibilite]{visibilité}\ \faLowVision.

### Modifier un attribut

Pour les postconditions où il faut modifier un attribut, c'est assez évident. Il suffit de suivre le principe GRASP Expert, défini dans le \nameref{tab_GRASPExpert}. Très souvent, c'est une méthode `setX(valeur)` où `X` correspond à l'attribut qui sera modifié à `valeur`. Attention à la \hyperref[Visibilite]{visibilité}\ \faLowVision.

Lorsque l'attribut d'un objet doit être modifié juste après la création de ce dernier, ça peut se faire dans le constructeur, comme on voit dans la figure\ \ref{RDCU_Constructeur_Modification}.

```{.plantuml caption="Combiner la création d'instance et une modification de son attribut dans un constructeur. [(PlantUML)](http://www.plantuml.com/plantuml/uml/VL9DRy8m3BrNuZzON833fg7TEA0XD4riJ48hsyvUQjgegTCvhXZ_VYuxhEA053aVxyL-Vib3KXJjcf2bsdEBWWqaFGMoADxro6W0VQ6hIuaT5ow6AA22d0mYrb4s0Qry0Xi85N9n5AzA38V82fxXqtCHZyc8_maBEc0NjASmDWGlubD_PxDV6szVKIA8Mf4a237MK0hXELd-yGJJ1ciJsWbPPJfDRFPi3OL0XLKLM6sty9u_lkM3yZ2_cmrRkbIGiEm3NzUvuHgUOoUCuIhlftO5v4vygrTvEpAh90s53IrKwIXB3krTvhVtmxUYxuxOqIkbNlWg-98Xq44pmzKxtwAPFrxi0YfXDmPCq5vWQqnq1bnc7hUPwpqcsxLmiro2WmNy7KqvDhECk80pxy5MzZz-0G00)" #RDCU_Constructeur_Modification }
@startuml
!include ../forme.pumlinclude
scale 1.3
skinparam sequenceMessageAlign left
participant ":Plateau" as p
participant ":Case" as c
loop
create c
p -->> c : create(nom)
end loop
@enduml
```

## Visibilité {#Visibilite}

Dans tous les cas, si un message est envoyé à un objet, ce dernier doit être *visible* à l'objet qui lui envoie le message.
Régler les problèmes de visibilité nécessite de la créativité.
Il est difficile à enseigner cette démarche, mais les points suivants peuvent aider:

- Pour un objet racine (par exemple `Université`) il peut s'agir d'un objet Singleton, qui aura une visibilité globale.
C'est-à-dire que n'importe quel objet pourrait lui envoyer un message.
Cependant, les objets Singleton posent des problèmes de conception, notamment pour les tests.
Il vaut mieux éviter ce choix, si possible.  
Voir [cette réponse sur stackoverflow](https://stackoverflow.com/a/2085988/1168342)\ \faStackOverflow.
- Sinon, il faudra que l'objet émetteur ait une référence de l'objet récepteur.
Par exemple dans la figure\ \ref{RDCU_Visibilite1}, la référence à *b* peut être:
  - stockée comme un attribut de *a*,
  - passée comme un argument dans un message antérieur, ou
  - affectée dans une variable locale de la méthode où `unMessage()` sera envoyé.

Pour plus de détails, voir le chapitre sur la Visibilité (F18/A19)\ \faBook.

```{.plantuml caption="L'objet *b* doit être visible à l'objet *a* si *a* veut lui envoyer un message. [(PlantUML)](http://www.plantuml.com/plantuml/uml/VLB1JiCm3BrNsZzOksmSg9YuxO3M8eG6Gq9imDbBlJPgwWmdqTZVumua2eT9aIFxlTZFTXOXeiJKkIoqblSes468HqTgnPeU6GsWBPgs5f-uCjvvWIZ8GI7YECec41iRG0z2WrmTnCP833lF4Ip3k-NA7u8IVnDMjCFaOazXx0WUnOR-pN9pgxnDGu70nuOaWFE-XLe8JydMR_SmxR1LeKb8AzDnehTbRSWvghIgGB5QmUlwxcKzA0-pgujXI_yL1Anxm-TrBhc51v-4qPtbVRQcWhKHkuzdUS-aev8m53OSOPH4MJ2eUvdbryDTqKSYDlH4eHTUE5ipEDh5JF5eZTsZ3d-Cys8C6A3u6zxEorEup2vle80vv7cU5Q1EgKxYdwpJYwpiWz_uWhZIR_45)" #RDCU_Visibilite1 }
@startuml
!include ../forme.pumlinclude
scale 1.3
skinparam sequenceMessageAlign left
participant "a:A" as A
participant "b:B" as B
-> A : ...
A -> B : unMessage()
B -> : ...
@enduml
```

Pour initialiser les références nécessaires pour la bonne visibilité, Larman vous propose de faire ça dans la \nameref{RDCU_Demarrer}.

## Transformer identifiants en objets {#TransformerIDenObjets}

La directive d'utiliser les types primitifs pour les opérations système nous mène à un problème récurrent dans les RDCU : transformer un identifiant (souvent de type `String` ou `int`) en objet.
Larman vous propose un idiome (pas vraiment un patron) nommé **Transformer identifiant en objet** qui sert à repérer la référence d'un objet qui correspond à l'identifiant.

Il y a un exemple à la figure\ \ref{RDCU_ID_en_objets} provenant du chapitre sur **l'Application des patterns GoF (Figure 23.18)**\ \faBook.
Un autre exemple du livre du cours est l'identifiant `codeArticle` transformé en objet `DescriptionProduit` par la méthode  
`CatalogueProduits.getDescProduit(codeArticle:String):DescriptionProduit`.

```{.plantuml caption="Un identifiant `idClient:String` est transformé en objet `c:Client`, qui est ensuite envoyé à la Vente en cours. [(PlantUML)](http://www.plantuml.com/plantuml/uml/VLB1Qjn03BqRyWyYboGBBTsheIKX2MNRB0GxJI-zJCQAhNgisKho9ldxohk4ke4i33CmxytJqzESgmMnSKY5ziIR8640jPU4lWl52JcQGGyXzgtaaPkOKnOm2QmE8TjHSGBMaOAl05tWvad831aUCniGmq_Y9Z-f4_y9DlWOncGJXSE0y5r8fpUhkqldtNMe2Daw58MKSm-jODY9rVTVuNG8lHiT1RqolfpuIUmDfOIDLnMukBc17_LrLS_Am_BJsRobjmuqjDF6Xtskk8TlUHGEwI3lkOyDr55eOmTvj-XHYSwDpICq6R7G67mkou_B-QpmpuWSSOqw6Rz8r3947mTAuGoZI9lWyH-N5ROUhU0n18Ng3RWERL3Y7RR-7zkMzvFS3jeM7xv01QNdGqfocSYXMu-Xme4KJwdPNvqL5JXpxSm8dw55sz_F29mDGQZjh8GQKsQuVjwW6A3zuiKYeSBg2hpr_F0RJHUBlUJs_UAnVDK-Hsxyu_u5)" #RDCU_ID_en_objets }
@startuml
!include ../forme.pumlinclude
scale 1.1
skinparam sequenceMessageAlign center
participant ":Registre" as R
participant ":Magasin" as M
participant "v:Vente" as v
-> R : saisirClientPourRemise(idClient)
R -> M : c = getClient(idClient)
note right: Selon Expert et\n**les ID en objets**
R -> v : saisirClientPourRemise(c:Client)
@enduml
```

La section \ref{UtilisationMap} explique comment implémenter la transformation avec un tableau associatif.

## Utilisation de tableau associatif (`Map<clé, objet>`) {#UtilisationMap}

Pour *transformer un ID en objets*, il est pratique d'utiliser un [tableau associatif (aussi appelé dictionnaire ou map en anglais)](https://fr.wikipedia.org/wiki/Tableau_associatif)\ \faWikipediaW. L'exemple du livre du cours concerne le problème de repérer une `Case` Monopoly à partir de son nom (`String`). C'est la figure A17.7/F17.7\ \faBook. Voir les détails dans le livre.

Notez que les exemples du livre ne montrent qu'un seul *type* dans le tableau associatif, par exemple `Map<Case>`, tandis que normalement il faut spécifier aussi le type de la clé, par exemple `Map<String, Case>`.

Un tableau associatif fournit une méthode `get` ou `find` pour rechercher un objet à partir de sa clé (son identifiant). La figure\ \ref{Map_Case_Monopoly} en est un exemple.

```{.plantuml caption="Exemple de l'utilisation de tableau associatif pour trouver une Case Monopoly à partir de son nom. [(PlantUML)](http://www.plantuml.com/plantuml/uml/VLBBQjn04BmB_0-DBsj3OhpN9J4s9WI_G4IRvE9BPzIM1erwvEcUEFuZvplsnz8Z6wBai21QYAgfggdMkIWcpMEePF0yOS8HH9y3sKpU5UHW0Vr0DtGfPcvT33619cGnY5WFgXLexmNiGUYHswVaLOdX8RA2P_ZkkOrFOiI_WYqzO0vQA8mZmKtoKivSRI-Dj-r92ABsb0H2Z0DqYN0MQxvzXgCH1mkQ4vapFQ_ixTak50ArvfhWulOMlZQVlZGBUrYV7Y-lz7y2mQuCtf_pYWUuZZanXhsyNuDheN79JxgNLvDLbMGPR5cXfaoLEBIzh4_MortHOoPsT4TIWby4tp4uMmUboXZgdP_GwZ_Sr06LC1y22jJ_OkuEftlUsFpGsDQvUtU9GcSpTQpUdq4D6n3u21rfGOuuZiSLHoL8lklLq3Trm2xjNgn0ZLd9TaPop-M802bCKMJtqX9aXjaIVv834mCNHol1XTtlasfLmvjboVNgkftbPg5gXiS2ls9p6liiQ7LEtDe_-mS0)" #Map_Case_Monopoly }
@startuml
!include ../forme.pumlinclude
scale 1.1
skinparam sequenceMessageAlign center
participant ":Plateau" as P
participant "cMap\n:Map<String,Case>" as m
-> P : s = getCase(nom)
note right : Plateau agrège toutes les\nCases et possède un Map\navec nom comme clé.
'P -> P : cMap = getToutesCases
P -> m : c = get(nom) : Case
@enduml
```

Dans la section suivante, l'initialisation des éléments utilisés dans les RDCU (comme des tableaux associatifs) est expliquée.

## RDCU pour l'initialisation, le scénario Démarrer {#RDCU_Demarrer}

Le lancement de l'application correspond à la RDCU "Démarrer".
La section **Initialisation et cas d'utilisation Démarrer** (F17.4, p.345) ou **Initialization and the 'Start Up' Use Case** (A18.4, p.274)\ \faBook\ traite ce sujet important. C'est dans cette conception où il faut mettre en place tous les éléments importants pour les hypothèses faites dans les autres RDCU, par exemple les classes de collection (Map), les références pour la visibilité, l'initialisation des contrôleurs, etc.

Voici quelques points importants:

- Le lancement d'une application dépend du langage de programmation et du système d'exploitation.
- À chaque nouvelle RDCU, on doit possiblement actualiser la RDCU "Démarrer" pour tenir compte des hypothèses faites dans la dernière RDCU. Elle est assez "instable" pour cette raison. Larman recommande de faire sa conception en dernier lieu.
- Il faut choisir l'objet du domaine initial, qui est souvent l'objet racine, mais ça dépend du domaine. Cet objet aura la responsabilité, lors de sa création, de générer ses "enfants" directs, puis chaque enfant aura à faire la même chose selon la structure. Par exemple, selon le MDD pour le jeu de Risk à la figure\ \ref{MDD-jeu-de-risk}, `JeuRisk` pourrait être l'objet racine, qui devra créer l'objet `PlateauRisk` et les cinq instances de `Dé`. L'objet `PlateauRisk`, lors de son initialisation, pourra instancier les 42 objets `Pays` et les six objets `Continent`, en passant à chaque `Continent` leurs objets `Pays` lors de son initialisation. Si `PlateauRisk` fournit une méthode `getPays(nom)` qui dépend d'un tableau associatif selon \nameref{TransformerIDenObjets}, alors c'est dans l'initialisation de cette classe où l'instance de `Map<String,Pays>` sera créée.
- Selon l'application, les objets peuvent être chargés en mémoire à partir d'un système de persistance, par exemple une base de données ou un fichier. Pour l'exemple de Risk, `PlateauRisk` pourrait charger, à partir d'un fichier JSON, des données pour initialiser toutes les instances de `Pays`. Pour une application d'inscription de cours à l'université, il se peut que toutes les descriptions de cours soient chargées en mémoire à partir d'une base de données. Une base de données amène un lot d'avantages et d'inconvénients, et elle n'est pas toujours nécessaire. Dans LOG210, on n'aborde pas le problème de base de données (c'est le sujet d'un autre cours).

```{.plantuml caption="Exemple de l'initialisation partielle du jeu de Risk. [(PlantUML)](http://www.plantuml.com/plantuml/uml/ZLLDJzj04BrRuZ-Ck2H88Ig7NYoAG6bLGQ4WGji3uR3i3lR6zknsTqrBVr7pE_B7EdPYnvYF8aKRP-VDcpTlHiwX3yA5iiWZdscomea2V7Z8aK-dPHNPweHkXSmIPqfIqkJ6GN22F8UGmbOqW91g3_mHa0fIlvmE0Gdk30NG13yqAVFBCt13gF1Eb7ce82GAX2zE-ohd-6h2kAiKFO89AJeFkJ4P90v5JJRz_Xc6XSXOQEcGA-F3WByrSKDvZeghEZWwFOLlqq-Nqqvvs7ktqssfhy2Bf3heTPt7bC69AHs9_5NSxqmgc4gdRNWLTu5ibVDTOLqBWokHqwNWmUoDzxh3mfybaiGpz9Noermd19BdWIvYHD1IMy7-RyVdjtCCPqBJDWWFfWnUA-nXJh2yr3wh4VC-mSVbeWwetlr5BWAAJQBj9qwuIqsigGxBnr4RNuW7lqhiHSw4dL7Cv_wKbv6IqOmgx44DBY9PxG9MEjVDmExkmG7_XXXMiOWC0vnEqX33kZT07o0VcCeDS4Aoi8XNouBUVzzGgeX9QZB5N6gvyDVw1ZuyOZNtwBZMICN0gc7YbWkEbMv6JI6HkELVNYRsBK9IrGBRfW9xr9ImVRqDitN_fUvOtp0NaLqJ5ynRUVYSSEj6HOyzxhAr5JhkrzxNx8tePgx-w1vb5RvcbsOaK-4IT9CduSuyE7soWa6El5E6QBb0FoCrAFcLeMMgENGoFV_AxvLDeMPKJqkFlVw3ZGcoDK6svWwVaQjlncIA4Op7uvt7xiWtkTEskD8rtt--Xkthiwq-MmsfdT3mvVph-OjQxPkqrWDOJQ_Q3A7KqEwiB-JcejtKzk6Gd_X_u1y0)" #DemarrerRisk }
@startuml
!include ../forme.pumlinclude
'scale 1.1
skinparam sequenceMessageAlign center
participant ":ObjetMain" as outside
participant ":JeuRisk" as jr
participant ":Dé" as d
participant ":PlateauRisk" as pr
participant ":Continent" as c
participant "p:Pays" as p
participant "pMap\n:Map<String,\nPays>" as m
create jr
outside -->> jr : create
note right: JeuRisk est l'objet racine. **Contrôleur** ne s'applique pas ici, car il ne s'agit pas d'une opération système
loop i<5
create d
jr -->> d : dés[i] = create
note over jr,d: par **Créateur**\nJeuRisk agrège Dé
end loop
create pr
jr -->> pr : create
note over jr,pr: par **Créateur**\nJeuRisk agrège PlateauRisk
create m
pr -->> m : pMap = create
note over pr,m: par **Créateur**: PlateauRisk agrège Map<String,Pays>
pr -> pr : continentsAvecPays[] =\nchargerContinentsAvecPays
note right : Par **Expert**\nCharger les données d'un fichier JSON
' continents
loop i<continentsAvecPays.size
create c
pr -->> c : create(continentsAvecPays[i].nom, ...)
note over pr,c: par **Créateur**: PlateauRisk agrège Continent
loop j<continentsAvecPays[i].pays.size
create p
pr -->> p : p = create(continentsAvecPays[i].pays[j].nom, ...)
note over pr,p: par **Créateur**: PlateauRisk agrège Pays
pr -> m : add(p)
note right: Par **Expert**
pr -> c : add(p)
note right: Par **Expert**
end loop
end loop
@enduml
```

## Réduire le décalage des représentations

Le principe du \nameref{DecalageRepresentations} est la différence entre la modélisation (la représentation) du problème (du domaine) et la modélisation de la solution.
Lorsqu'on fait l'ébauche d'une RDCU, on peut réduire le décalage des représentations principalement en s'inspirant des classes conceptuelles (du modèle du domaine) pour proposer des classes logicielles dans la solution décrite dans la RDCU.
Plus une solution ressemble à la description du problème, plus elle sera facile à comprendre.

> \faWarning\ Une application de pattern GoF à la solution peut nuire à ce principe, car ces patterns rajoutent souvent des classes logicielles n'ayant aucun lien avec le modèle du domaine.
Par exemple, un Visiteur ou un Itérateur sont des classes logicielles sans binôme dans le modèle du domaine.
Il faut vérifier avec une personne expérimentée (l'architecte du projet si possible) que l'application du pattern est justifiée, qu'elle apporte de vrais bénéfices au design en dépit des désavantages dus à des classes ajoutées.
Chaque fois qu'on propose des classes logicielles qui n'ont pas de liens avec la représentation du problème du domaine, on *augmente le décalage des représentations* et on rend la solution un peu plus difficile à comprendre.
C'est aussi une forme de \nameref{ComplexiteCirc}.
Ce dilemme est un bon exemple de la nature pernicieuse de la conception de logiciels.
Il est très difficile, même pour les experts en conception, de trouver un bon équilibre entre toutes les forces: la maintenabilité, la simplicité, les fonctionnalités, etc.
Vous pouvez en lire plus dans [cette réponse sur StackOverflow](https://stackoverflow.com/a/18702842/1168342)\ \faStackOverflow.

## Pattern "Faire soi-même" {#FaireSoiMeme}

Dans la section F30.8/A33.7\ \faBook, Larman mentionne le pattern "Faire soi-même" de Peter Coad [-@coad97a] qui permet de réduire le \nameref{DecalageRepresentations}, même s'il ne représente pas exactement la réalité des objets (voir la figure\ \ref{main_des}):

> **Faire soi-même**: "Moi, objet logiciel, je fais moi-même ce qu'on fait normalement à l'objet réel dont je suis une abstraction"

![Dans la vraie vie, les dés sont lancés par une main (["Hand of chance"](https://www.flickr.com/photos/aerust/9590772048/) [(CC BY 2.0)](https://creativecommons.org/licenses/by/2.0/) par [Alexandra E Rust](https://www.flickr.com/people/aerust/)).](images/flickr_aerust_hand_of_chance.jpg){width=80% #main_des}

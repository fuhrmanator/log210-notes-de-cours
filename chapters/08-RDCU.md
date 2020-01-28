# Réalisations de cas d'utilisation (RDCU)

Les réalisations de cas d'utilisation (RDCU) sont le sujet du chapitre F17/A18&nbsp;\faBook&nbsp;du livre du cours. 
Voici les points importants pour le cours:

- Une RDCU est une synthèse des informations spécifiées dans le MDD, le DSS et les contrats d'opération.
Si vous n'avez pas bien compris ces autres éléments, il est difficile de réussir les RDCU. Mais, d'une autre part, c'est aussi une étape pour valider votre compréhension. Il est normal de ne pas tout comprendre au début.
- De manière générale, toute bonne RDCU doit faire les choses suivantes:
  - spécifier un contrôleur (pour la première opération système dans un DSS, qui sera le même pour le reste des opérations dans le DSS);
  - satisfaire les postconditions du contrat d'opération correspondant;
  - rechercher les informations qui sont éventuellement rendues à l'acteur dans le DSS.
- Il s'agit d'un diagramme de séquence en UML. Il faut alors maîtriser la notation UML pour ces diagrammes, mais c'est agile:
  - Il n'est pas nécessaire de faire les boîtes d'activation.
  - On doit se servir des annotations pour documenter les choix (GRASP).
  - Il vaut mieux apprendre à dessiner à la main des diagrammes, car c'est comme ça à l'examen (et c'est plus rapide qu'un outil).
- Le livre présente quelques RDCU qui sont des *diagrammes de communication*. Cette notation n'est pas utilisée dans le cours, car elle est plus complexe à utiliser et elle est comparable à la notation des diagrammes de séquence.
- Faire des RDCU est plus agile que coder, car dans un diagramme on peut voir le flux de plusieurs messages à travers plusieurs classes.
Dans le code source, il serait nécessaire d'ouvrir plusieurs fichiers en même temps et on ne peut pas voir toute la dynamique de la même manière.
Faire des changements à un diagramme est aussi plus facile que changer tout le code source.
Ceci étant dit, *le codage dans un langage de programmation est la seule manière de valider une RDCU*. Évidemment la programmation prend beaucoup plus de temps et n'est pas triviale.
Une RDCU est comme un plan d'un architecte pour un bâtiment et la programmation est comme la construction d'un bâtiment.

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
Référez-vous à la définition dans \nameref{tab_GRASPCreateur}.

> \faWarning &nbsp;Une erreur potentielle est de donner la responsabilité de créer à un contrôleur, puisqu'*il a les données pour initialiser* l'objet. Bien que ce soit justifiable par le principe GRASP Créateur, il vaut mieux favoriser une classe qui *agrège* l'objet à créer, le cas échéant. 

### Former une association

Pour les postconditions où il faut former une association entre un objet *a* et *b*, il y a plusieurs façons de faire.

- S'il y a une agrégation entre les objets, il s'agit probablement d'une méthode `add()` sur l'objet qui agrège.
- S'il y a une association simple, il faut considérer la navigabilité de l'association. Est-ce qu'il faut pouvoir retrouver l'objet *a* à partir de l'objet *b* ou vice-versa? Il s'agira d'une méthode `setB(b)` sur l'objet `a` (pour trouver *b* à partir de *a*), etc. 

Dans la plupart des cas, la justification GRASP pour former une association est Expert, défini dans \nameref{tab_GRASPExpert}. \faLowVision &nbsp;Il faut faire attention à la \nameref{Visibilite}.

### Modifier un attribut

Pour les postconditions où il faut modifier un attribut, c'est assez évident. Il suffit de suivre le principe GRASP Expert, défini dans \nameref{tab_GRASPExpert}. Très souvent, c'est une méthode `setX(valeur)` où `X` correspond à l'attribut qui sera modifié à `valeur`. \faLowVision &nbsp;Attention à la \nameref{Visibilite}.

Lorsque l'attribut d'un objet doit être modifié juste après la création de ce dernier, ça peut se faire dans le constructeur, comme on voit dans la figure&nbsp;\ref{RDCU_Constructeur_Modification}.

```{.plantuml hide-image=true plantuml-filename=build/images/diag_constructeur_modification.pdf}
@startuml
!include ../forme.pumlinclude
scale 1.3
skinparam sequenceMessageAlign left
participant ":Plateau" as p
participant ":Case" as c
loop
create c
p ->> c : create(nom)
end loop
@enduml
```

![Combiner la création d'instance et une modification de son attribut dans un constructeur](build/images/diag_constructeur_modification.pdf){#RDCU_Constructeur_Modification}

## Visibilité {#Visibilite}

Dans tous les cas, si un message est envoyé à un objet, ce dernier doit être *visible* à l'objet qui lui envoie le message.
Régler les problèmes de visibilité nécessite de la créativité.
Il est difficile à enseigner cette démarche, mais les points suivants peuvent aider:

- Pour un objet racine (par exemple `Université`) il peut s'agir d'un objet Singleton, qui aura une visibilité globale.
C'est-à-dire que n'importe quel objet pourrait lui envoyer un message.
Cependant, les objets Singleton posent des problèmes de conception, notamment pour les tests.
Il vaut mieux éviter ce choix, si possible.  
\faStackOverflow
&nbsp;Voir [cette réponse sur stackoverflow](https://stackoverflow.com/a/2085988/1168342).
- Sinon, il faudra que l'objet émetteur ait une référence de l'objet récepteur.
Par exemple dans la figure&nbsp;\ref{RDCU_Visibilite1}, la référence à *b* peut être:
  - stockée comme un attribut de *a*,
  - passée comme un argument dans un message antérieur, ou
  - affectée dans une variable locale de la méthode où `unMessage()` sera envoyé.

Pour plus de détails, voir le chapitre sur la Visiblilté&nbsp;\faBook&nbsp;du livre du cours.

```{.plantuml hide-image=true plantuml-filename=build/images/diag_visibilite_RDCU.pdf}
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

![L'objet *b* doit être visible à l'objet *a* si *a* veut lui envoyer un message](build/images/diag_visibilite_RDCU.pdf){#RDCU_Visibilite1}

Pour initialiser les références nécessaires pour la bonne visibilité, Larman vous propose de faire ça dans la \nameref{RDCU_Demarrer}.

## Transformer identifiants en objets {#TransformerIDenObjets}

La directive d'utiliser les types primitifs pour les opérations système nous mène à un problème récurrent dans les RDCU : transformer un identifiant (souvent de type `String` ou `int`) en objet.
Larman vous propose un idiome (pas vraiment un pattern) nommé **Transformer identifiant en objet** qui sert à repérer la référence d'un objet qui correspond à l'identifiant.

Il y a un exemple à la figure&nbsp;\ref{RDCU_ID_en_objets} provenant du chapitre sur **l'Application des patterns GoF (Figure 23.18)**&nbsp;\faBook&nbsp;du livre du cours.
Un autre exemple du livre du cours est l'identifiant `codeArticle` transformé en objet `DescriptionProduit` par la méthode  
`CatalogueProduits.getDescProduit(codeArticle:String):DescriptionProduit`.

```{.plantuml hide-image=true plantuml-filename=build/images/diag_transformer_id_objet_RDCU.pdf}
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
```

![Un identifiant `idClient:String` est transformé en objet `c:Client`, qui est ensuite envoyé à la Vente en cours](build/images/diag_transformer_id_objet_RDCU.pdf){#RDCU_ID_en_objets}

La section \ref{UtilisationMap} explique comment implémenter la transformation avec les dictionnaires (map).

## Utilisation de tableau associatif (`Map<clé, objet>`) {#UtilisationMap}

Pour *transformer ID en objets*, il est pratique d'utiliser un [tableau associatif (aussi appelé dictionnaire ou map en anglais)\faWikipediaW](https://fr.wikipedia.org/wiki/Tableau_associatif). L'exemple du livre du cours concerne le problème de repérer une `Case` Monopoly à partir de son nom (`String`). C'est la figure A17.7 ou F17.7&nbsp;\faBook&nbsp;du livre du cours. Voir les détails dans le livre.

Notez que les exemples du livre ne montrent qu'un seul *type* dans le tableau associatif, par exemple `Map<Case>`, tandis que normalement il faut spécifier aussi le type de la clé, par exemple `Map<String, Case>`.

Un tableau associatif fournit une méthode `get` ou `find` pour rechercher un objet à partir de sa clé (son identifiant). La figure&nbsp;\ref{Map_Case_Monopoly} en est un exemple.

```{.plantuml hide-image=true plantuml-filename=build/images/diag_map_monopoly_RDCU.pdf}
@startuml
!include ../forme.pumlinclude
scale 1.1
skinparam sequenceMessageAlign center
participant ":Plateau" as P
participant "cMap\n:Map<String,Case>" as m
-> P : s = getCase(nom)
note right : Plateau agrège toutes les\nCases et en possède un Map\navec nom comme clé.
'P -> P : cMap = getToutesCases
P -> m : c = get(nom) : Case
@enduml
```

![Exemple de l'utilisation de tableau associatif pour trouver une Case Monopoly à partir de son nom](build/images/diag_map_monopoly_RDCU.pdf){#Map_Case_Monopoly}

Dans la section suivante, l'initialisation des éléments utilisés dans les RDCU (comme des tableaux associatifs) est expliquée.

## RDCU pour l'initialisation, le scénario Démarrer {#RDCU_Demarrer}

Le lancement de l'application correspond à la RDCU "Démarrer".
La section **Initialisation et cas d'utilisation Démarrer** (Sec. 17.4, p.345 dans le livre en français) ou **Initialization and the 'Start Up' Use Case** (Sec. 18.4, p.274 dans le livre en anglais)&nbsp;\faBook&nbsp;traite ce sujet important. C'est dans cette conception où il faut mettre en place tous les éléments importants pour les hypothèses faites dans les autres RDCU, par exemple les classes de collection (Map), les références pour la visibilité, l'initialisation des contrôleurs, etc.

Voici quelques points importants:

- Le lancement d'une application dépend du langage de programmation et du système d'exploitation.
- À chaque nouvelle RDCU, on doit possiblement actualiser la RDCU "Démarrer" pour tenir compte des hypothèses faites dans la dernière RDCU. Elle est assez "instable" pour cette raison. Larman recommande de faire sa conception en dernier lieu.
- Il faut choisir l'objet du domaine initial, qui est souvent l'objet racine, mais ça dépend du domaine. Cet objet aura la responsabilité, lors de sa création, de générer ses "enfants" directs, puis chaque enfant aura à faire la même chose selon la structure. Par exemple, selon le MDD pour le jeu de Risk à la figure&nbsp;\ref{MDD-jeu-de-risk}, `JeuRisk` pourrait être l'objet racine, qui devra créer l'objet `PlateauRisk` et les cinq instances de `Dé`. L'objet `PlateauRisk`, lors de son initialisation, pourra instancier les 42 objets `Pays` et les six objets `Continent`, en passant à chaque `Continent` leurs objets `Pays` lors de son initialisation. Si `PlateauRisk` fournit une méthode `getPays(nom)` qui dépend d'un tableau associatif selon \nameref{TransformerIDenObjets}, alors c'est dans l'initialisation de cette classe où l'instance de `Map<String,Pays>` sera créée.
- Selon l'application, les objets peuvent être chargés en mémoire à partir d'un système de persistance, par exemple une base de données ou un fichier. Pour l'exemple de Risk, `PlateauRisk` pourrait charger, à partir d'un fichier JSON, des données pour initialiser toutes les instances de `Pays`. Pour une application d'inscription de cours à l'université, peut-être toutes les descriptions de cours seront chargées en mémoire à partir d'une base de données. Une base de données amène un lot d'avantages et d'inconvénients, et elle n'est pas toujours nécessaire. Dans LOG210, on n'aborde pas le problème de base de données (c'est le sujet pour un autre cours).

```{.plantuml hide-image=true plantuml-filename=build/images/diag_initialisation_RDCU.pdf }
@startuml
!include ../forme.pumlinclude
scale 1.1
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
note right: JeuRisk est l'objet racine
loop i<5
create d
jr -->> d : dés[i] = create
end loop
create pr
jr -->> pr : create
create m
pr -->> m : pMap = create
pr -> pr : continentsAvecPays[] =\nchargerContinentsAvecPays
note right : Charger les données\nd'un fichier JSON
' continents
loop i<continentsAvecPays.size
create c
pr -->> c : create(continentsAvecPays[i].nom, ...)
loop j<continentsAvecPays[i].pays.size
create p
pr -->> p : p = create(continentsAvecPays[i].pays[j].nom, ...)
pr -> m : add(p)
pr -> c : add(p)
end loop
end loop
@enduml
```

![Exemple de l'initialisation partielle du jeu de Risk](build/images/diag_initialisation_RDCU.pdf){#DemarrerRisk}

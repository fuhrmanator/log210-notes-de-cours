# Analyse et conception de logiciels

Voici le descriptif du cours, selon le plan de cours:

> À la suite de ce cours, l'étudiant sera en mesure:
>
> - de maîtriser et appliquer des patrons de conception logicielle;
> - de concevoir un logiciel orienté objet en appliquant un ensemble de principes et des méthodes heuristiques de génie logiciel;
> - de réaliser un logiciel en suivant un processus itératif et évolutif incluant les activités d'analyse et de conception par objets.
>
> Méthodes et techniques de modélisation orientés objet, langage de modélisation, cas d'utilisation, analyse orientée objet, modèle du domaine, conception et programmation orientées objet, principes GRASP, patrons de conception, processus itératif et évolutif.
>
> Séances de laboratoire axées sur l'application des notions d'analyse, de conception et de programmation orientées objet vues en classe. Mise en œuvre d'un modèle d'objet à partir d'une spécification de logiciel et à l'aide d'un langage orienté objet contemporain. Conception d'applications utilisant les outils UML ainsi que des techniques et des outils utiles au génie logiciel, tels qu'un environnement de développement intégré, la compilation automatique et les tests automatiques.

## Livre obligatoire

Le livre obligatoire [@craig_uml_2005] pour ce cours est indiqué dans le plan de cours. **Le présent document n'est pas un substitut pour le livre obligatoire.**

Les références au livre obligatoire sont indiquées par l'icône du livre\ \faBook.

Le livre est disponible en français et en anglais, cependant les chapitres ne sont pas toujours les mêmes.
Donc, il est parfois nécessaire d'indiquer la référence avec **F** et **A** pour la langue.
Par exemple, **F16.10/A17.10** indique la section **16.10 du livre en français** et la section **17.10 du livre en anglais.**

Toutes les références sont données pour la 3^e^ édition du livre.
Si vous avez une autre édition, les chapitres ne sont pas toujours les mêmes et vous devez chercher le sujet dans la table des matières.

## Analyse vs Conception

Ce sujet est abordé en détail dans le chapitre 1\ \faBook.

L'**analyse** met l'accent sur une investigation du problème et des besoins plutôt que sur la recherche d'une solution.

La **conception** sous-entend l'élaboration d'une solution conceptuelle répondant aux besoins plutôt que la mise en œuvre de cette solution.

```{.plantuml caption="Diagramme de *classes conceptuelles* décrivant le *problème* d'un jeu de dés (adapté du Jeu de dés du Ch. 1 de Larman). Ceci est élaboré lors d'une activité d'analyse." #mdd-des}
@startuml
!include ../forme.pumlinclude
'left to right direction
hide empty members
class Joueur {
  nom : String
  nbLancers : int
  nbLancersGagnés : int
}
class Dé {
  face : int
}
class JeuDeDés

JeuDeDés "1" -- "2" Dé : inclut > 
Joueur "*" -l- "1" JeuDeDés : joue > 
@enduml
```

```{.plantuml caption="Diagramme de *classes logicielles* décrivant une *solution* au problème du jeu de dés. La conception s'inspire du modèle du problème, afin de faciliter sa compréhension." #ddc-des}
@startuml
!include ../forme.pumlinclude
'left to right direction
hide empty methods
class Dé {
    +face : int
    brasser()
}
class JeuDeDés {
    '-joueurs: Map<string, Joueur>;
    ' -d1 : De;
    ' -d2 : De;

    getJoueurs()
    demarrerJeu(nom: string)
    jouer(nom: string)
    terminerJeu(nom: string)
}
class Joueur {
    +nom : string
    +nbLancers : number
    +nbLancersGagnés : number
}
JeuDeDés --> "d1" Dé
JeuDeDés --> "d2" Dé
JeuDeDés -r- "[nom]" Joueur : "        "
@enduml
```

Imaginez un jeu qui est joué dans la vraie vie avec deux dés à six faces.
Ensuite, on veut construire un logiciel pour ce jeu et donc on peut spécifier la règle du jeu, dont un de nombreux besoins est de générer un nombre aléatoire entre 1 et 6 (comme un dé à six faces).
On peut aussi modéliser ce besoin (un élément du problème) par une classe conceptuelle `Dé` ayant un attribut `face` dont sa valeur est un type `int`.
Les personnes travaillant sur un projet vont facilement comprendre ce modèle, car les gens comprennent les objets qui représentent des aspects de la vraie vie.

Dans LOG210 une modélisation orientée objet est utilisée et pour l'analyse (classes conceptuelles décrivant le problème et les besoins comme à la figure\ \ref{mdd-des}) et pour la conception (classes logicielles proposant une solution dont sa représentation est proche de la modélisation du problème comme à la figure\ \ref{ddc-des}).

## Décalage des représentations {#DecalageRepresentations}

Vous avez sûrement remarqué que le modèle du problème (figure\ \ref{mdd-des}) ressemble beaucoup au modèle de la solution (figure\ \ref{ddc-des}) pour notre exemple de jeu de dés.
Cependant, il y a des différences, car une solution comporte des détails sur la dynamique du jeu qui sera codée.
Le modèle du problème et le modèle de la solution ne sont pas identiques.

> On pourrait bien imaginer une autre solution avec une seule classe `Jeu` qui contient toute la logique du jeu.
C'est un design qui peut fonctionner.
Avez-vous déjà codé une solution simple comme ça une fois?
Un problème avec une telle solution serait qu'elle est plus difficile à comprendre, surtout si tout le code est dans une grosse classe.
<!-- Par exemple, on voit une méthode `brasser()` dans la classe `Dé` qui montre que ce sera la responsabilité de cette classe de changer sa valeur quand ça sera le bon moment. -->

Alors, une caractéristique souhaitable d'un design est qu'il soit facile à comprendre et à valider par rapport au problème qu'il est censé résoudre.
Plus une solution (conception) ressemble à une description (modèle d'analyse) du problème, plus elle est facile à comprendre et à valider.
La différence entre la représentation d'un problème et la représentation de sa solution s'appelle le *décalage des représentations*.
C'est un terme complexe pour un principe très intuitif.
Méfiez-vous des classes importantes dont leur nom est difficile à tracer au problème.
Elles vont rendre votre solution plus difficile à comprendre.
Pour des explications de Larman, lisez la section 9.3\ \faBook.

L'exemple du jeu est trivial, puisque le problème est relativement simple.
Réduire le décalage des représentations est un principe très important surtout lorsque le problème à résoudre est complexe.

## La complexité et ses sources

Un.e ingénieur.e logiciel est constamment dans une bataille avec un adversaire dont le nom est la complexité.
Mais qu'est-ce que la complexité? La figure\ \ref{complexity} est une image de la complexité. Reconnaissez-vous le domaine d'où vient cette image?

Voici une définition de la complexité:

> **Complexité**: Caractère de ce qui est complexe, difficile à comprendre, de ce qui contient plusieurs éléments.

![["Complexity"](https://www.flickr.com/photos/lytfyre/6489338411/) [(CC BY-SA 2.0)](https://creativecommons.org/licenses/by-sa/2.0/) par [lytfyre](https://www.flickr.com/people/lytfyre/).](images/flickr_lytfyre_complexity.jpg){width=80% #complexity}

En voici quelques exemples en développement de logiciels:

- Un *problème* peut être complexe, par exemple le domaine des lois fiscales pour lequel des logiciels existent pour aider les gens à faire des déclarations de revenus.
- Un *projet logiciel* peut être complexe, avec plusieurs packages, chacun ayant beaucoup de classes, etc.
- Un cadre d'applications (cadriciel, *framework*) est toujours complexe. 
Par exemple un framework comme Angular ou React pour développer un *front-end* (application frontale), car l'interaction entre l'utilisateur et une application répartie dans le nuage nécessite beaucoup de fonctionnalités supportées par le cadriciel.
- Un *algorithme* peut être complexe, par exemple, l'algorithme de [tri de Shell](https://fr.wikipedia.org/wiki/Tri_de_Shell)\ \faWikipediaW est plus complexe qu'un simple algorithme de [tri à bulles](https://fr.wikipedia.org/wiki/Tri_%C3%A0_bulles)\ \faWikipediaW. Notez que la complexité d'un algorithme peut parfois apporter des gains de performance, mais coder, déboguer et maintenir une implémentation d'un algorithme complexe sera plus coûteux.
- Un *patron de conception* peut être complexe, par exemple, les patrons Visiteur, Décorateur, Médiateur, etc.
Un patron définit des rôles et parfois des classes et du code supplémentaires à créer. Le tout doit s'intégrer dans un design existant (qui est possiblement déjà complexe).
- Un *environnement* peut être complexe, par exemple les applications mobiles sont plus complexes à développer et à déboguer que les applications simples sur PC, à cause de l'environnement sans fil, des écrans tactiles, la pile limitée, etc.

La figure\ \ref{complex-sources} présente les sources de complexité ainsi que leurs noms qu'on va utiliser dans le cours:

### Complexité inhérente (provenant du problème)

La complexité inhérente est au sein du problème que résout un logiciel.
Elle se compose des parties du logiciel qui sont nécessairement des problèmes difficiles.
N'importe quel logiciel qui tente de résoudre ces problèmes aura une manifestation de cette complexité dans son implémentation.
Exemple: un logiciel qui aide à faire des déclarations de revenus aura une complexité inhérente due à la complexité des lois fiscales qui spécifient comment doit être préparée une déclaration.

### Complexité circonstancielle (provenant des choix de conception) {#ComplexiteCirc}

Les choix que font les ingénieur.e.s dans un projet peuvent amener de la complexité circonstancielle.
En tant qu'ingénieur.e.s, nous avons un devoir de contrôler cette forme de complexité, par exemple en prenant soin avec un choix de cadriciel Web ou d'architecture logicielle.
La complexité circonstancielle peut aussi être due à des contraintes imposées sur la conception, comme une utilisation obligatoire d'une vieille base de données ou d'une bibliothèque logicielle héritée, d'un langage de programmation, etc.
La complexité circonstancielle (aussi appelée accidentelle) peut être gérée avec des technologies, par exemple les débogueurs, les patrons de conception (un Adaptateur pour les bases de données différentes), etc.

### Complexité environnementale (provenant de l'environnement d'exécution)

Cette forme de complexité comprend des aspects d'une solution qui ne sont pas sous le contrôle des ingénieur.e.s.
Dans un environnement d'exécution, il y a des dimensions comme le ramasse-miettes (*garbage collection*), l'ordonnancement des fils d'exécution (*threads*) sur un serveur, l'utilisation de *containers* (à la Docker), etc. qui peuvent affecter la qualité d'un logiciel.
Les ingénieur.e.s doivent gérer ces formes de complexité, mais il n'y a pas beaucoup de stratégies évidentes face aux technologies qui évoluent très vite.

```{.plantuml caption="Sources de complexité." #complex-sources}
@startuml
scale 0.8
skinparam style strictuml
skinparam backgroundColor transparent
skinparam packageBackgroundColor transparent
skinparam defaultFontName Arial 
skinparam defaultTextAlignment center
cloud "Domaine (du problème)" as P {
 cloud "Complexité\ninhérente" as PP #red {
 }
}
note right of PP: Exemple:\nLois fiscales (impôts)
rectangle "Spécification d'exigences" as S {
}
cloud "Conception logicielle" as C #lightgreen {
cloud "Complexité\ncirconstancielle" as CC #pink {
}
}
note right of CC: Exemples:\nFramework REST,\nutilisation du patron Visiteur,\nintégration avec un logiciel "ancien"
rectangle "Solution exécutable" as E {
cloud "Complexité\nenvironnementale" as EE #orange {
}
}
note left of EE: Exemples:\nApplication mobile,\ndéploiement dans conteneur Docker
P --> S
S --> C
C --> E
@enduml
```

## Survol de la méthodologie

La figure\ \ref{SurvolMethodologie} présente la méthode d'analyse et de conception enseignée dans le cours. C'est une adaptation de plusieurs figures présentées dans le livre du cours.

![Survol de la méthodologie.](images/FigA.1-avec-contrats.png){#SurvolMethodologie}

## Développement itératif, évolutif et agile

Le chapitre 2 du livre\ \faBook\ définit un processus itératif et adaptatif ainsi que les concepts fondamentaux du Processus Unifié.

Les points importants sont les suivants:

- Le développement itératif et évolutif implique de programmer et de tester précocement un système partiel selon des cycles répétitifs.
- Un cycle est nommé une itération et dure un temps fixe (par exemple, 3 semaines) comprenant les activités d'analyse, de conception, de programmation et de test, ainsi qu'une démonstration pour solliciter des rétroactions du client (voir la figure\ \ref{DevIteratifIncremental}).
- La durée d'une itération est limitée dans le temps (*timeboxed* en anglais), de 2 à 6 semaines. Il n'est pas permis d'ajouter du temps à la durée d'une itération si le projet avance plus lentement que prévu, car cela impliquerait un retard de la rétroaction du client. Si le respect des délais semble compromis, on supprime plutôt des tâches ou des spécifications et on les inclut dans l'itération suivante.
- Les premières itérations peuvent sembler chaotiques, car elles sont loin de la "bonne voie". Avec la rétroaction du client et l'adaptation, le système à développer converge vers une solution appropriée (voir la figure\ \ref{StabiliteDansLesIterations}).
- Il y a plusieurs avantages du développement itératif et incrémental:
  - moins d'échecs, amélioration de la productivité et de la qualité;
  - gestion précoce des risques élevés (risques techniques, exigences, objectifs, convivialité, etc.)
  - progrès immédiatement visibles;
  - rétroaction, implication des utilisateurs et adaptations précoces;
  - complexité gérée (par itération);
  - possibilité d'exploiter méthodiquement les leçons tirées d'une itération.
- Dans une itération, la modélisation avec l'UML se fait au début et devrait prendre beaucoup moins de temps (quelques heures) que la programmation, qui n'est pas triviale (voir la figure \ref{AnalyseConceptionDansLesIterations}).

![Le développement itératif et incrémental (Figure 2.1 du livre).](images/A2.1.svg){#DevIteratifIncremental}

![Rétroaction et adaptation itératives convergent vers le système souhaité (Figure 2.2 du livre).](images/F2.2.svg){#StabiliteDansLesIterations}

![Analyse et conception évolutives, majoritairement effectuées dans les premières itérations (Figure 2.4 du livre).](images/F2.4.svg){#AnalyseConceptionDansLesIterations}

![Processus itératif et évolutif.](images/iteratif-evolutif.png){#IteratifEvolutif}

![Nuage de mots importants du plan de cours de LOG210.](images/LOG210wordle_ordre_alph.png)

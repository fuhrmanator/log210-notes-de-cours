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

![Nuage de mots importants du plan de cours de LOG210.](images/LOG210wordle_ordre_alph.png)

## Livre obligatoire

Le livre obligatoire [@craig_uml_2005] pour ce cours est indiqué dans le plan de cours. **Le présent document n'est pas un substitut pour le livre obligatoire.**

Les références au livre obligatoire seront indiquées par l'icône du livre\ \faBook.

## Analyse vs Conception

Ce sujet est abordé en détail dans le chapitre 1\ \faBook\ du livre du cours.

L'**analyse** met l'accent sur une investigation du problème et des besoins plutôt que sur la recherche d'une solution.

La **conception** sous-entend l'élaboration d'une solution conceptuelle répondant aux besoins plutôt que la mise en œuvre de cette solution.

Dans LOG210, c'est une modélisation orientée objet qui est utilisée et pour l'analyse (classes conceptuelles décrivant le problème et les besoins) et pour la conception (classes logicielles proposant une la solution dont sa représentation est proche de la modélisation du problème).

## Décalage des représentations

Plus une solution (conception) ressemble à une description du problème, plus elle est facile à comprendre.
La distance entre la représentation d'un problème et la représentation de sa solution s'appelle le *décalage des représentations*.
Pour des explications de Larman, lisez la section 9.3\ \faBook\ du livre du cours.

Imaginez un jeu qui est joué dans la vraie vie avec un dé à six faces. Ensuite, on veut construire un logiciel pour ce jeu et donc on peut spécifier un besoin de générer un nombre aléatoire entre 1 et 6 (comme un dé à six faces). On peut aussi modéliser ce besoin (un élément du problème) par une classe conceptuelle `Dé` ayant un attribut `face` dont sa valeur est un type `int`. Les personnes travaillant sur un projet vont facilement comprendre ce modèle, car les gens comprennent les objets qui représentent des aspects de la vraie vie.

Ensuite, imaginez des solutions à ce problème:

1. On peut définir un programme en langage assembleur pour générer un nombre réel entre 0.00000 et 1.00000. Le programme sera assez complexe, car les métaphores en assembleur sont des registres, des adresses, peut-être des modules, etc.
2. On peut utiliser un langage orienté objet (comme Java ou TypeScript) pour définir une classe `GénérateurNombreAléatoire` qui a une fonction `générer()` qui retourne une valeur réelle aléatoire entre 0.000000 et 1.000000.
Il faudra travailler un peu avec le code pour obtenir un nombre entier entre 1 et 6, mais c'est possible.
Lorsqu'on lit le nom de la classe, il est possible de deviner à quelle partie du problème ça correspond, mais le lien n'est pas aussi évident.
3. On peut utiliser encore un langage orienté objet, mais cette fois on définit une classe `Dé` ayant une fonction `brasser` qui retourne une valeur aléatoire entière entre 1 et 6.

Parmi toutes les solutions au problème, laquelle a le plus faible décalage de représentation?
C'est la troisième, car elle utilise la même notion de classe `Dé` qui a été utilisée pour modéliser le problème.
Cet exemple est trivial, mais le principe est encore plus important lorsque le problème est complexe.

Un défi dans la programmation est d'éviter d'augmenter trop l'écart des représentations.
Sinon, la solution devient moins évidente par rapport à son problème.
Cette notion est aussi reliée à la facilité de la traçabilité.
C'est-à-dire que chaque élément de la solution devrait être facilement traçable au problème.
La méthodologie enseignée dans LOG210 cherche à réduire le décalage des représentations, car c'est un bénéfice des langages orientés objet si on fait attention.

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

![Le développement itératif et incrémental (Figure 2.1 du livre).](images/A2.1.pdf){#DevIteratifIncremental}

![Rétroaction et adaptation itératives convergent vers le système souhaité (Figure 2.2 du livre).](images/F2.2.pdf){#StabiliteDansLesIterations}

![Processus itératif et évolutif.](images/iteratif-evolutif.png){#IteratifEvolutif}

## La complexité et ses sources

Un ingénieur logiciel est constamment dans une bataille avec un adversaire dont le nom est la complexité.
Mais qu'est-ce que la complexité? La figure\ \ref{complexity} est une image de la complexité. Reconnaissez-vous le domaine d'où vient cette image?

Voici une définition de la complexité:

> **Complexité**: Caractère de ce qui est complexe, difficile à comprendre, de ce qui contient plusieurs éléments.

![["Complexity"](https://www.flickr.com/photos/lytfyre/6489338411/) [(CC BY-SA 2.0)](https://creativecommons.org/licenses/by-sa/2.0/) par [lytfyre](https://www.flickr.com/people/lytfyre/).](images/flickr_lytfyre_complexity.jpg){width=80% #complexity}

En voici quelques exemples en développement de logiciels:

- Un *problème* peut être complexe, par exemple le domaine des lois fiscales pour lequel des logiciels existent pour aider les gens à faire des déclarations de revenus.
- Un *projet logiciel* peut être complexe, avec plusieurs packages, chacun ayant beaucoup de classes, etc.
- Un cadre d'applications (cadriciel, *framework*) est toujours complexe. 
Par exemple un framework comme Angular ou React pour développer un *front-end* (application frontale), car l'interaction entre l'utilisateur et une application répartie dans le nuage nécessite beaucoup de fonctionnalités supportées par le cadriciel.
- Un *algorithme* peut être complexe, par exemple, l'algorithme de \faWikipediaW\ [tri de Shell](https://fr.wikipedia.org/wiki/Tri_de_Shell) est plus complexe qu'un simple algorithme de \faWikipediaW\ [tri à bulles](https://fr.wikipedia.org/wiki/Tri_%C3%A0_bulles). Notez que la complexité d'un algorithme peut parfois apporter des gains de performance, mais coder, déboguer et maintenir une implémentation d'un algorithme complexe sera plus coûteux.
- Un *patron de conception* peut être complexe, par exemple, les patrons Visiteur, Décorateur, Médiateur, etc.
Un patron définit des rôles et parfois des classes et du code supplémentaires à créer. Le tout doit s'intégrer dans un design existant (qui est possiblement déjà complexe).
- Un *environnement* peut être complexe, par exemple les applications mobiles sont plus complexes à développer et à déboguer que les applications simples sur PC, à cause de l'environnement sans fil, des écrans tactiles, la pile limitée, etc.

La figure\ \ref{complex-sources} présente les sources de complexité ainsi que leurs noms qu'on va utiliser dans le cours:

### Complexité inhérente (provenant du problème)

La complexité inhérente est au sein du problème que résout un logiciel.
Elle se compose des parties du logiciel qui sont nécessairement des problèmes difficiles.
N'importe quel logiciel qui tente de résoudre ces problèmes aura une manifestation de cette complexité dans son implémentation.
Exemple: un logiciel qui aide à faire des déclarations de revenus aura une complexité inhérente due à la complexité des lois fiscales qui spécifient comment doit être préparée une déclaration.

### Complexité circonstancielle (provenant des choix de conception)

Les choix qui font les ingénieur.e.s dans un projet amènent de la complexité circonstancielle.
En tant qu'ingénieur.e.s, nous avons un devoir de contrôler cette forme de complexité, par exemple en prenant soin avec un choix de framework Web ou architecture logicielle.
Cette complexité peut aussi être due à des contraintes imposées sur la conception, comme une utilisation obligatoire d'une vieille base de données ou d'une bibliothèque logicielle héritée, d'un langage de programmation, etc.
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


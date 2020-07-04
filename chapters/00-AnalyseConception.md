# Analyse et conception de logiciels

Voici le descriptif du cours, selon le plan de cours:

> À la suite de ce cours, l'étudiant sera en mesure :
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

Le livre obligatoire pour ce cours est indiqué dans le plan de cours. **Le présent document n'est pas un substitut pour le livre obligatoire.**

Les références au livre obligatoire seront indiquées par l'icône du livre&nbsp;\faBook.

## Analyse vs Conception

Ce sujet est abordé en détail dans le chapitre 1&nbsp;\faBook&nbsp;du livre du cours.

L'**analyse** met l'accent sur une investigation du problème et des besoins plutôt que sur la recherche d'une solution.

La **conception** sous-entend l'élaboration d'une solution conceptuelle répondant aux besoins plutôt que la mise en œuvre de cette solution.

Dans LOG210, c'est une modélisation objet qui est utilisée et pour l'analyse (classes conceptuelles décrivant le problème et les besoins) et pour la conception (classes logicielles proposant une la solution dont sa représentation est proche de la modélisation du problème).

## Décalage des représentations

Plus une solution (conception) ressemble à une description du problème, plus elle est facile à comprendre.
La distance entre la représentation d'un problème et la représentation de sa solution s'appelle le *décalage des représentations*.
Pour des explications de Larman, lisez la section 9.3&nbsp;\faBook&nbsp;du livre du cours.

Imaginez un jeu qui est joué dans la vraie vie avec un dé à six faces. Ensuite, on veut construire un logiciel pour ce jeu et donc on peut spécifier un besoin de générer un nombre aléatoire entre 1 et 6 (comme un dé à six faces). On peut aussi modéliser ce besoin (un élément du problème) par une classe conceptuelle `Dé` ayant un attribut `face` dont sa valeur est un type `int`. Les personnes travaillant sur un projet vont facilement comprendre ce modèle, car les gens comprennent les objets qui représentent des aspects de la vraie vie.

Ensuite, imaginez des solutions à ce problème suivantes:

1. On peut définir un programme en langage assembleur pour générer un nombre réel entre 0.00000 et 1.00000. Le programme sera assez complexe, car les métaphores en assembleur sont des registres, des adresses, peut-être des modules, etc.
2. On peut utiliser un langage orienté objet (comme Java ou TypeScript) pour définir une classe `GénérateurNombreAléatoire` qui a une fonction `générer()` qui retourne une valeur réelle aléatoire entre 0.000000 et 1.000000.
Il faudra travailler un peu avec le code pour obtenir un nombre entier entre 1 et 6, mais c'est possible.
Lorsqu’on lit le nom de la classe, il est possible de deviner à quelle partie du problème ça correspond, mais le lien n'est pas aussi évident.
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

La figure&nbsp;\ref{SurvolMethodologie} présente la méthode d'analyse et de conception enseignée dans le cours. C'est une adaptation de plusieurs figures présentées dans le livre du cours.

![Survol de la méthodologie.](images/FigA.1-avec-contrats.svg){#SurvolMethodologie}

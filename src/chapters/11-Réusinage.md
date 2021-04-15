# Réusinage (Refactorisation) {#Refactoring}

## Introduction

Considérez l'histoire suivante, provenant de la 2e édition du livre *Refactoring* de Martin Fowler (2019):

> Il était une fois, un consultant qui a rendu visite à un projet de développement afin de regarder une partie du code qui avait été écrit.
En parcourant la hiérarchie des classes au centre du système, le consultant l'a trouvée plutôt désordonnée.
Les classes de niveau supérieur ont émis certaines hypothèses sur la façon dont les classes fonctionneraient, hypothèses incorporées dans le code hérité. Ce code n'était pas cohérent avec toutes les sous-classes, cependant, et a été redéfini à beaucoup d'endroits.
De légères modifications à la superclasse auraient considérablement réduit la nécessité de la redéfinir.
À d'autres endroits, l'intention de la superclasse n'avait pas été bien comprise et le comportement présent dans la superclasse était dupliqué.
Dans d'autres endroits encore, plusieurs sous-classes ont fait la même chose avec du code qui pouvait clairement être déplacé dans la hiérarchie.
> \newline\newline
>Le consultant a recommandé à la direction du projet que le code soit examiné et nettoyé, mais la direction du projet n'était pas enthousiaste.
Le code semblait fonctionner et il y avait des contraintes sur l'emploi du temps considérables.
Les gestionnaires ont dit qu'ils y parviendraient ultérieurement.
> \newline\newline
>Le consultant a également montré ce qui se passait aux programmeurs travaillant sur la hiérarchie.
Les programmeurs étaient enthousiastes et ont vu le problème.
Ils savaient que ce n'était pas vraiment de leur faute; parfois, l'évaluation par une autre personne est nécessaire pour détecter le problème.
Les programmeurs ont donc passé un jour ou deux à nettoyer la hiérarchie.
Une fois terminés, ils avaient supprimé la moitié du code de la hiérarchie sans réduire sa fonctionnalité.
Ils étaient satisfaits du résultat et ont constaté qu'il était devenu plus rapide et plus facile d'ajouter de nouvelles classes et d'utiliser les classes dans le reste du système.
> \newline\newline
>La direction du projet n'était pas contente.
L'échéancier était serré et il y avait beaucoup de travail à faire.
Ces deux programmeurs avaient passé deux jours à effectuer un travail qui n'ajoutait rien aux nombreuses fonctionnalités que le système devait offrir en quelques mois.
L'ancien code avait très bien fonctionné.
Oui, la conception était un peu plus "pure" et un peu plus "propre".
Mais le projet devait expédier du code qui fonctionnait, pas du code qui plairait à un universitaire.
Le consultant a suggéré qu'un nettoyage similaire soit effectué sur d'autres parties centrales du système, ce qui pourrait interrompre le projet pendant une semaine ou deux.
Tout cela était pour rendre le code plus beau, pas pour lui faire faire ce qu'il ne faisait pas déjà.

Cette histoire est un bon exemple des deux forces constamment en jeu lors d'un développement de logiciel. D'un côté, on veut que le code fonctionne (pour satisfaire les fonctionnalités) et d'un autre côté, on veut que la conception soit acceptable puisqu'il y a d'autres exigences sur un logiciel telles que la maintenabilité, l'extensibilité, etc. La section sur le \nameref{Spectre_conception} aborde cette dynamique.

Le réusinage (anglais *refactoring*) est, selon Fowler, "l'amélioration de la conception du code après avoir écrit celui-ci". Il s'agit de retravailler le code source de façon à en améliorer la lisibilité ou la structure, sans en modifier le fonctionnement. C'est une manière de gérer la dette technique, car grâce au réusinage on peut transformer du code chaotique (écrit peut-être par les gens en mode "hacking cowboy") en code bien structuré. De plus, beaucoup d'IDE supportent l'automatisation d'activités de réusinage, rendant le processus plus facile et robuste. Probablement vous avez déjà "renommé" une variable dans le code source, à travers un menu "Refactoring".

## Symptômes de la mauvaise conception - Code smells

En anglais, le terme "Code smell" a été proposé par Fowler pour les symptômes d'une mauvaise conception.
Le but est de savoir à quel moment il faut affecter des activités de réusinage. 

Par exemple, le premier "smell" dans son livre est "Mysterious Name".
Il apparaît lorsqu'on voit une variable ou une méthode dont le nom est incohérent avec son utilisation.
Cela arrive puisqu'il n'est pas toujours facile de trouver un bon nom au moment où on est en train d'écrire du code.
Plutôt que de rester bloqué sur le choix, on met un nom arbitraire (ou peut-être par naïveté on se trompe carrément de nom).
Alors, si vous observez ce problème (smell) dans un logiciel, vous n'avez qu'à appliquer l'activité de réusinage nommée [Change Function Declaration](https://refactoring.com/catalog/changeFunctionDeclaration.html), [Rename Field](https://refactoring.com/catalog/renameField.html) ou [Rename Variable](https://refactoring.com/catalog/renameVariable.html), selon le cas.

Un autre exemple serait que vous avez un programme assez complexe, mais avec seulement une ou deux classes.
Ces classes ont beaucoup d'attributs et de méthodes.
Alors, ce "smell" s'appelle "Large class" et la solution est d'appliquer des activités de réusinage [Extract Class](https://refactoring.com/catalog/extractClass.html), ou éventuellement [Extract Superclass](https://refactoring.com/catalog/extractSuperclass.html) ou [Replace Type Code with Subclasses](https://refactoring.com/catalog/replaceTypeCodeWithSubclasses.html).
Avec un IDE dominant et un langage populaire, vous aurez probablement des fonctionnalités pour supporter l'automatisation de ces activités de réusinage.

Certaines activités traitent des sujets avancés en conception, mais c'est très intéressant pour ceux qui aiment le bon design. Voici la liste complète des "smells" ainsi que les activités de réusinage à appliquer (voir le catalogue sur le site web pour les détails).

Symptôme de mauvaise conception ("Smell") | Activités de réusinage à appliquer éventuellement
:----------|:----------
Mysterious Name | [Change Function Declaration](https://refactoring.com/catalog/changeFunctionDeclaration.html), [Rename Variable](https://refactoring.com/catalog/renameVariable.html), [Rename Field](https://refactoring.com/catalog/renameField.html)
Duplicated Code | Extract Function, Slide Statements, Pull Up Method
Long Function | Extract Function, Replace Temp with Query, Introduce Parameter Object, Preserve Whole Object, Replace Function with Command, Decompose Conditional, Replace Conditional with Polymorphism, Split Loop
Long Parameter List | Replace Parameter with Query, Preserve Whole Object, Introduce Parameter Object, Remove Flag Argument, Combine Functions into Class
Global Data | Encapsulate Variable
Mutable Data | Encapsulate Variable, Split Variable, Slide Statements, Extract Function, Separate Query from Modifier, Remove Setting Method, Replace Derived Variable with Query, Use Combine Functions into Class, Combine functions into Transform, Change Reference to Value
Divergent Change | Split Phase, Move Function, Extract Function, Extract Class
Shotgun Surgery | Move Function, Move Field, Combine Functions into Class, Combine Functions into Transform, Split Phase, Inline Function, Inline Class
Feature Envy | Move Function, Extract Function
Data Clumps | Extract Class, Introduce Parameter Object, Preserve Whole Object
Primitive Obsession | Replace Primitive with Object, Type Code with Subclasses, Replace Conditional with Polymorphism, Extract Class, Introduce Parameter Object
Repeated Switches | Replace Conditional with Polymorphism
Loops | Replace Loop with Pipeline
Lazy Element | Inline Function, Inline Class, Collapse Hierarchy
Speculative Generality | Collapse Hierarchy, Inline Function, Inline Class, Change Function Declaration, Remove Dead Code
Temporary Field | Extract Class, Move Function, Introduce Special Case
Message Chains | Hide Delegate, Extract Function, Move Function
Middle Man | Remove Middle Man, Inline Function, Replace Superclass with Delegate, Replace Subclass with Delegate
Insider Trading | Move Function, Move Field, Hide Delegate, Replace Subclass with Delegate, Replace Superclass with Delegate
Large Class | Extract Class, Extract Superclass, Replace Type Code with Subclasses
Alternative Classes with\newline Different Interfaces | Change Function Declaration, Move Function, Extract Superclass
Data Class | Encapsulate Record, Remove Setting Method, Move Function, Extract Function, Split Phase
Refused Bequest | Push Down Method, Push Down Field, Replace Subclass with Delegate, Replace Superclass with Delegate
Comments | Extract Function, Change Function Declaration, Introduce Assertion

## Automatisation du réusinage par les IDE

À la **section F19.2/A22.2** du livre du cours, le sujet de réusinage est abordé.
Il y a plusieurs exemples de base détaillés qui sont automatisés par les IDE dominants tels que Eclipse, IntelliJ IDEA, JetBrains PyCharm, Visual Studio Code, etc.
Il se peut que dans un avenir proche le réusinage (l'amélioration du design) devienne une activité réalisée par des algorithmes d'intelligence artificielle.

Pour plus d'activités de réusinage, il y a le catalogue du site [refactoring.com](https://refactoring.com/catalog/).

Voir [cette page web pour savoir comment les activités de réusinage sont faites dans Visual Studio Code](https://code.visualstudio.com/docs/editor/refactoring). D'autres automatisations sont implémentées par des extensions.

## Impropriété

Si quelqu'un dit que son code est cassé pendant plusieurs jours parce qu'il fait du réusinage, ce n'est pas la bonne utilisation du terme [selon Martin Fowler](https://martinfowler.com/bliki/RefactoringMalapropism.html). Il s'agit de la *restructuration* dans ce cas. 

Le réusinage est basé sur les petites transformations qui ne changent pas le comportement du logiciel. 

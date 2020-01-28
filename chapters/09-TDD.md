# Développement piloté par les tests

Si on écrivait des logiciels pouvant se tester automatiquement?
Le développement piloté par les tests (anglais, *test-driven development, TDD*) est une pratique populaire et intéressante.
Il s'agit d'écrire des logiciels avec un composant d'autovalidation (des tests automatisés).
Mais, écrire beaucoup de tests n'est pas toujours une tâche agréable pour des développeurs.
Historiquement, si on attend la fin d'un projet pour écrire des tests, il ne reste plus beaucoup de temps et l'équipe laisse tomber les tests.
Pour pallier ce problème, le développement piloté par les tests propose de travailler **en petit pas**. C'est-à-dire écrire un test simple (en premier), puis écrire la partie du logiciel pour passer le test de manière simple (le plus simple).
Ça fait moins d'ouvrage de codage entre les validations et c'est possiblement même plus stimulant pour les développeurs.

Ainsi, il y a toujours des tests pour les fonctionnalités et le développement se fait en petits incréments qui sont validés par les tests.
Faire les petits pas réduit le risque associé à de gros changements dans un logiciel sans validation intermédiaire.
Au fur et à mesure qu'on développe un logiciel, on développe également des tests de ce dernier.
Puisque les tests sont automatiques, ils sont aussi faciles à exécuter que le compilateur.

Il y a une discipline imposée dans le TDD qui nécessite d'écrire un *test en premier*, avant d'écrire le code.
La démarche est illustrée par la figure&nbsp;\ref{TDD_states}.
Plusieurs chercheurs ont essayé de voir si tester en premier avait un vrai bénéfice.
Les résultats de leurs expériences n'ont pas montré toujours que c'est le cas.
Faire un petit test après avoir écrit le code a aussi un bénéfice en termes de qualité.
Cependant, des chercheurs sont d'accord que le fait de travailler en petit pas apporte toujours un avantage en termes de qualité.

Sachez qu'il existe beaucoup d'intergiciels (anglais *frameworks*) pour faciliter l'exécution automatique des tests réalisés dans le cadre du TDD.
En Java, il y a JUnit, mais il y en a pour pratiquement tous les langages et environnements.
En ce qui concerne le squelette pour le laboratoire de LOG210, la version TypeScript utilise [Mocha](https://mochajs.org/index.html) avec [Chai](https://www.chaijs.com/).
La version Python utilise [PyTest](https://docs.pytest.org/en/latest/).

L'exécution de test peut être même faite à chaque commit du code dans un dépôt comme GitHub. Le squelette de LOG210 utilise [Travis](https://travis-ci.org/) pour cela, et dans la version TypeScript et dans la version Python.

Il est possible de mesurer la [couverture de code \faWikipediaW](https://fr.wikipedia.org/wiki/Couverture_de_code) atteinte par les tests (mais ce sujet commence à sortir du cadre de la matière du cours). Les deux versions du squelette utilisent [Coveralls](https://coveralls.io/) pour ce faire.

```{.plantuml hide-image=true plantuml-filename=build/images/diag_etats_TDD.pdf}
@startuml
hide empty description
skinparam style strictuml
skinparam StateBorderColor black
skinparam StateFontColor white
skinparam StateFontStyle bold
skinparam StateFontSize 16
skinparam StateArrowFontSize 16
'skinparam DefaultFontName "Segoe UI Black"
'title États du développement piloté par les tests
state Rouge as "Au moins\nun test\néchoue" #red
state Vert as "Tous\nles tests\npassent" #green
state PasTDD as "<color red>Pas TDD\n<color red><size:48><&thumb-down></color>" #yellow
[*] -right-> Rouge : Créer\nnouveau\ntest
Rouge -r-> Vert : Écrire code\npour faire\npasser test(s)<sup>‡</sup>
Vert -l-> Rouge : \nCréer\nnouveau\ntest
Vert -> Vert : <color green>Faire une activité</color>\n<color green>de réusinage<sup>†</sup></color>
Vert -->  PasTDD : Écrire code sans test
legend center
<sup>†</sup>Une activité de réusinage n'est pas censée causer
un problème avec un test. Cependant, cela peut
arriver que les tests ne passent plus et il faudra
corriger des problèmes.
<sup>‡</sup>Il peut arriver qu'un test soit mal codé (il contient
un bogue). Dans ce cas, on corrige le code du test.
end legend
@enduml
```

![États du développement piloté par les tests](build/images/diag_etats_TDD.pdf){#TDD_states}

Les activités de réusinage sont expliquées dans la section \nameref{Refactoring}.  

## Kata TDD

Pour apprendre à faire du développement piloté par les tests (et pour apprendre les cadriciels supportant l'automatisation des tests), il existe une activité nommée "Kata TDD". *Kata* est un terme japonais désignant une séquence de techniques réalisée dans le vide dans les arts martiaux japonais. C'est un outil de transmission de techniques, mais aussi de principes, de combat.

Alors, le "kata TDD" a été proposé par Dave Thomas et le but est de développer la fluidité avec le développement piloté par les tests. Un kata TDD se pratique avec un IDE (environnement de développement logiciel) et un support pour les tests (par exemple JUnit). Pratiquer le même kata peut améliorer votre habileté de programmation. On peut pratiquer le même kata dans un langage différent ou avec un IDE ou environnement de test différent.

### Exemple de Kata TDD FizzBuzz

L'inspiration de cet exercice vient de http://codingdojo.org/kata/FizzBuzz/.

Dans cet exercice il faut écrire par le développement piloté par les tests un programme qui imprime les nombres de 1 à 100.
Mais pour les multiples de trois, il faut imprimer `Fizz` au lieu du nombre et pour les multiples de cinq, il faut imprimer `Buzz`. Pour les nombres étant des multiples de trois et cinq il faut imprimer `FizzBuzz`. Voici un exemple des sorties:

```
1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
FizzBuzz
16
17
Fizz
19
Buzz
... etc jusqu’à 100
```

#### Préalables

Il faut installer un IDE qui supporte le réusinage (refactorings) comme VisualStudio Code, Eclipse, IntelliJ, etc. puis un framework de test unitaire (JUnit, Mocha/Chai, unittest, etc.).
Pour un exemple qui fonctionne en TypeScript, vous pouvez cloner le code à https://github.com/profcfuhrmanets/code-kata-typescript

#### Déroulement

Cet exercice peut se faire individuellement ou en équipe de deux.
En équipe, une personne écrit le test et l’autre écrit le code pour passer le test (c’est la variante ping-pong).
Chacun réfléchit au réusinage lorsque le projet est dans l’état vert.
On peut changer de rôle plus tard.

Pour respecter la philosophie de petits pas, il vaut mieux:

- Ne lire que l’étape courante.
- Ne travailler que sur l’étape courante.
- Ne faire que les tests avec les entrées valides.

#### Kata pour FizzBuzz

Les étapes sont simples et précises.
Il s’agit de créer une classe ayant une méthode acceptant un entier et retournant une valeur selon les exigences de FizzBuzz décrite plus haut.

1. Un argument de 1 retourne `1`.
2. Un argument de 2 retourne `2`
3. Un argument de 3 retourne `Fizz`
4. Un argument de 6 retourne `Fizz`
5. Un argument de 5 retourne `Buzz`
6. Un argument de 10 retourne `Buzz`
7. Un argument de 15 retourne `FizzBuzz`
8. Un argument de 30 retourne `FizzBuzz`
9. Supporter des exigences qui évoluent:

    a. Il faut imprimer Fizz au lieu du nombre si le nombre est un multiple de 3 ou contient un 3 (p.ex. 13 → `Fizz`).
    b. Il faut imprimer Buzz au lieu du nombre si le nombre est un multiple de 5 ou contient un 5 (p.ex. 51 → `Fizz`).
    c. Il faut imprimer FizzBuzz si le nombre est un multiple de 5 et de 3 ou contient un 5 et un 3 (p.ex. 53 → `FizzBuzz`).


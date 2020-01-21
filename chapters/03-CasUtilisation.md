# Cas d'utilisation

Le chapitre 6&nbsp;\faBook&nbsp;du livre du cours présente les cas d'utilisation.
Il s'agit des documents textuels décrivant l'interaction entre un système (logiciel à développer) et un ou plusieurs acteurs (les utilisateurs ou systèmes externes).
Le cas d'utilisation décrit plusieurs scénarios, mais en général il y a un scénario principal (*"Happy Path"*) représentant ce qui se passe lorsqu'il n'y a pas d'anomalie.

La notation UML inclut les diagrammes de cas d'utilisation, qui sont comme une table des matières pour les fonctionnalités d'un système.

Dans LOG210, le sujet de comment écrire les cas d'utilisation ne fait pas partie du cours; c'est un élément expliqué dans un autre cours (*LOG410 Analyse de besoins et spécifications*).

## Exemple: jeu de Risk

L'exemple suivant concerne le jeu de Risk.

![Cinq dés utilisés dans le jeu de Risk[^riskdice]](images/Risk-dice-example.jpg){width="300px"}

[^riskdice]: By Val42 - [https://en.wikipedia.org/wiki/Image:Risk-dice-example.jpg](http://en.wikipedia.org/wiki/Image:Risk-dice-example.jpg), [CC By-SA 3.0](http://creativecommons.org/licenses/by-sa/3.0/ "Creative Commons Attribution-Share Alike 3.0") [Link](https://commons.wikimedia.org/w/index.php?curid=3272090)

Selon "Risk". 2019. Wikipédia. https://fr.wikipedia.org/w/index.php?title=Risk&oldid=164264587 (December 9, 2019):

> L'attaquant jette un à trois dés suivant le nombre de régiments qu'il désire engager (avec un maximum de trois régiments engagés, et en considérant qu'un régiment au moins doit rester libre d'engagements sur le territoire attaquant) et le défenseur deux dés (un s'il n'a plus qu'un régiment). On compare le dé le plus fort de l'attaquant au dé le plus fort du défenseur et le deuxième dé le plus fort de l'attaquant au deuxième dé du défenseur. Chaque fois que le dé du défenseur est supérieur ou égal à celui de l'attaquant, l'attaquant perd un régiment; dans le cas contraire, c'est le défenseur qui en perd un.

### Scénario: Attaquer un pays

1. Le Joueur attaquant choisit d'attaquer un pays voisin du Joueur défenseur.
2. Le Joueur attaquant annonce combien de régiments il va utiliser pour son attaque.
3. Le Joueur défenseur annonce combien de régiments il va utiliser pour sa défense.
4. Les deux Joueurs jettent le nombre de dés selon leur stratégie choisie aux étapes précédentes.
5. Le Système compare les dés et élimine les régiments de l'attaquant ou du défenseur selon les règles et affiche le résultat.

*Les Joueurs répètent l'étape 2 jusqu’à ce que l'attaquant ne puisse plus attaquer ou ne veuille plus attaquer.*

### Diagramme de cas d'utilisation

```{.plantuml #uml-uc caption="Diagramme de cas d'utilisation"}
@startuml
!include ../forme.pumlinclude
scale 1
left to right direction
skinparam packageStyle rect
actor Joueur as J
rectangle "Système" {
  (...) as other
  (Attaquer\nun pays) as JP
  (Démarrer) #lightgray
  J -- JP
  J -- other
}
@enduml
```

Notes:

- Le cas d'utilisation "..." signifie tous les autres cas d'utilisation du jeu, par exemple pour distribuer les régiments à chaque tour, etc.
- Le cas d'utilisation *Démarrer* n'est pas normalement indiqué dans un diagramme. C'est une astuce pédagogique pour la méthodologie du cours, car il faudra concevoir et coder ce scénario, bien qu'il ne soit pas une fonctionnalité connue par l'utilisateur.


# Principes GRASP

GRASP est un acronyme de l'expression anglaise "General Responsibility Assignment Software Patterns" c'est-à-dire les principes pour affecter les responsabilités logicielles dans les classes.

Une approche GRASP devrait amener un design vers la modularité et la maintenabilité.

L'acronyme d'une expression vulgarisée pourrait être POMM: "Principes pour déterminer Où Mettre une Méthode".

En tant qu'ingénieur logiciel, vous devez décider souvent où placer une méthode (dans quelle classe) et cette décision ne devrait pas être prise de manière arbitraire, mais plutôt en suivant les directives d'ingénierie favorisant la modularité.

Alors, les GRASP sont les directives qui vous aident à prendre des décisions de conception, menant à un design avec moins de couplage inutile et des classes plus cohésives.
Les classes cohésives sont plus faciles à comprendre, à maintenir et à réutiliser.

> \faHatCowboySide\ Avez-vous déjà une bonne expérience en programmation?
Avez-vous l'habitude de coder rapidement des solutions qui fonctionnent?
Si la réponse est oui, alors travailler avec les principes GRASP peut être un défi pour vous.
Dans LOG210, vous devez être en mesure de justifier vos choix de conception et cela va vous ralentir au début.
Le but avec les principes GRASP est de (ré)apprendre à faire du code qui fonctionne, mais qui soit également facile à maintenir.
C'est normal au début que ça prenne plus de temps, car il faut réfléchir pour appliquer les principes.
Une fois que vous avez l'habitude à utiliser les GRASP, vous serez encore rapide avec votre développement, mais en plus votre design sera meilleur sur le plan de la maintenabilité.

## Spectre de la conception {#SpectreDeLaConception}

Neal Ford [-@Ford2009] a [proposé](https://www.ibm.com/developerworks/library/j-eaed1/index.html) la notion d'effort pour la conception qu'il a nommée le "Spectre de la conception".
La figure\ \ref{Spectre_conception} illustre le principe.

```{.plantuml caption="Spectre de la conception, adapté de Neal Ford. [(PlantUML)](http://www.plantuml.com/plantuml/uml/VLJRRjf047stb7yOvIK95LNIlbK81KWlQQEgAg5zW3oiTmTxvVMkjHTHyaTHFw5loOzrriR4X0Z9CjAPCsTcpW4kdMVMXr8bhf2wOfQLuFnQ8RsjvB5or2cbZ1UPDK4BRfInu2tJZage_L5o0ZwN3kXXa3CjLbPwZngMHdkG6dvBBSpA4V5PKE2I1UKZHRCIuPkLBlPStqw8TvkZGp0-H-j06LD0Pf7LOjDVd-6qP0Kj6YpIP5oVqAVKT91IA6YgXT7D3Soc7tzEE-FXuloiUzBB3HpBuaiVtlDQ5_3L1AkPEiZxKt01KsvbvG_oVY1PPLrtiQw5tWPC76UKoyNRTnqILyoviR42xQHE99T2eDvZR7Cxn1fPQrOD8LNKaH0jVX7Gel7h2bq3O5dvDPHOfhHnKdV2yS39U_pm_dnuTmpCmOfHrvAIQEkFVs72w0Bghs9WZ_zgtdTUjOnUxqslLuEf24iO34fQKk5ms1B6o08teIBp5feRpR7oqkY5PW74qqCQ_4AVZgzcdyuQwIYpB_wwzan3XII3z3YPlH2T6eheMVXLNPP9IcTVUHJnfe-rsDLcnjD3YJQZ7yz65_VSdDULdCAGEkju-QL1W9jLQjPRD_CasJeFVOLBFq-D4dVzsjEaDdO7ZkWUM9-ID0Vj5DezEaC6_J0NpEKOwp7D9ho-wA1fEsMN7D6DQpjqWLkuIsV9PlmBUfvSeXRqH_KV)" #Spectre_conception }
@startuml
!include ../forme.pumlinclude
scale 1.2
skinparam classBorderColor hidden
skinparam classBackgroundColor hidden
skinparam classArrowColor black
hide stereotypes
hide empty members
class "<size:30>]" as waterfall
class "« Cascade pure »" as Ncp
class "**+**" as bduf <<middle>>
class "Beaucoup de\nconception\nau début\n(BDUF)" as Nbduf
class "**+**" as duf <<middle>>
class "Un peu de design\nau début\n(Some DUF)" as Nduf
class "**+**" as agile <<middle>>
class "Agile" as Na
class "Design\némergent" as Nde
class "<size:30>[" as hacking
class "« Hacking cowboy »" as Nh

waterfall -left[bold]- bduf
bduf -left[bold]- duf
duf -left[bold]- agile
agile -left[bold]- hacking

waterfall <-u[dashed]- Ncp
bduf <-d[dashed]- Nbduf
duf <-u[dashed]- Nduf
agile <-d[dashed]- Nde
agile <-u[dashed]- Na
hacking <-d[dashed]- Nh
@enduml
```

À une extrémité, il y a la mentalité de mettre presque zéro effort pour une conception, que l'on nomme "Hacking cowboy".
C'est le cas lors d'un hackathon (un marathon de programmation durant 24 ou 48 heures où il faut produire une solution rapidement).
Vous ne feriez pas un logiciel avec 10 patrons GoF ou les diagrammes UML pour réfléchir à votre architecture.
Mais vous savez aussi que le code qui est produit lors d'un hackathon ne sera pas facile à maintenir.
Le seul but est de faire du code qui marche pour montrer une idée intéressante.

Au fait, dans certains contextes d'entreprise (par exemple une entreprise en démarrage qui a seulement six mois de financement), c'est une situation similaire.
Si une solution de ["produit minimum viable" (MVP en anglais)](https://en.wikipedia.org/wiki/Minimum_viable_product)\ \faWikipediaW n'existe pas à la fin de la période de financement, l'entreprise n'existera plus, car il n'y aura pas une deuxième période de financement.
Si la compagnie est financée pour une deuxième période, la conception du code pourrait avoir besoin de beaucoup de soins, car elle a été négligée.
Cette négligence à la conception (pour la maintenabilité) est aussi nommée la \hyperref[DetteTechnique]{dette technique}.

À l'autre extrémité du spectre, c'est beaucoup d'effort dépensé sur la conception, que l'on nomme "Cascade pure".
Dans le cycle de vie en cascade, on met un temps fixe, par exemple plusieurs mois, à étudier la conception.
Comme toute chose poussée à l'extrême, ce n'est pas idéal non plus.
Dans le livre du cours, Larman explique en détail des problèmes posés par une approche en cascade.
Dans certains domaines, par exemple les logiciels pour le contrôle d'avion ou des appareils médicaux, une approche en cascade est encore utilisée, en dépit des problèmes dus à l'approche.
La sécurité et la robustesse des logiciels sont très importantes, alors on passe beaucoup de temps à vérifier et valider la conception.
Puisque les exigences sont plus stables (et les développeurs ont *a priori* une meilleure compréhension du domaine), l'approche en cascade n'est pas si mal.
Pourtant le coût pour produire des logiciels certifiés est énorme.

Le spectre de la conception est très important pour LOG210, parce que votre bagage d'ingénieur devrait vous permettre de travailler partout sur ce spectre.
C'est le contexte de l'entreprise pour laquelle vous travaillez qui déterminera combien d'effort à mettre sur la conception.
<!-- Si vous négligez complètement la conception, vous pouvez peut-être produire du code qui fonctionne plus vite à court terme.
Mais il faudra repayer la dette technique un jour.
Un moyen de gérer cette dette technique est de *réusiner* (anglais refactor). -->

\newpage

## Tableau des principes GRASP {#GRASPTable}

Voici un extrait du livre du cours, **UML 2 et les design patterns** de Craig Larman.

+---------------+--------------------------------------------------------------------------------+
| Pattern       | Description                                           |
+===============+================================================================================+
| Expert en     | Un principe général de conception d'objets et d'affectation des responsabilités.\label{tab_GRASPExpert} \newline |
| information   |  |
|*F16.11/A17.11*| Affecter une responsabilité à l'expert – la classe qui possède les informations nécessaires pour s'en acquitter. \newline |
| \faBook       | |
+-------------+--------------------------------------------------------+
| Créateur      | Qui crée? \label{tab_GRASPCreateur} (Notez que Fabrique Concrète est une solution de rechange courante.) \newline\newline Affectez à la classe B la responsabilité de créer une instance de la classe A si l'une des assertions suivantes est vraie: |
|*F16.10/A17.10*| |
| \faBook       | 1. B contient A |
|               | 2. B agrège A |
|               | 3. B a les données pour initialiser A |
|               | 4. B enregistre A |
|               | 5. B utilise étroitement A \newline |
+-------------+--------------------------------------------------------+
| Contrôleur    | Quel \label{tab_GRASPControleur}est le premier objet en dehors de la couche présentation qui reçoit et coordonne ("contrôle") les opérations système? \newline\newline Affectez une responsabilité à la classe qui correspond à l'une de ces définitions: |
|*F16.13/A17.13*| |
| \faBook       | 1. Elle représente le système global, un "objet racine", un équipement ou un sous-système (contrôleur de façade). |
|               | 2. Elle représente un scénario de cas d'utilisation dans lequel l'opération système se produit (*contrôleur de session* ou contrôleur de cas d'utilisation). On la nomme GestionnaireX, où X est le nom du cas d'utilisation \newline |
+-------------+--------------------------------------------------------+
| Faible        | Comment minimiser les dépendances? \newline\newline Affectez les responsabilités de sorte que le couplage (inutile) demeure faible. Employez ce principe pour évaluer les alternatives. |
| Couplage      | \newline |
| (évaluation)  |
|*F16.12/A17.12*| |
| \faBook       | |
+-------------+--------------------------------------------------------+
| Forte Cohésion| Comment conserver les objets cohésifs, compréhensibles, gérables et, en conséquence, obtenir un Faible Couplage? \newline\newline Affectez les responsabilités de sorte que les classes demeurent cohésives. Employez ce principe pour évaluer les différentes solutions. |
| (évaluation)  | \newline |
|*F16.14/A17.14*| |
| \faBook       | |
+-------------+--------------------------------------------------------+
| Polymorphisme | Qui est responsable quand le comportement varie selon le type? \newline\newline Lorsqu'un comportement varie selon le type (classe), affectez la responsabilité de ce comportement — avec des opérations polymorphes — aux types pour lesquels le comportement varie. \newline |
| *F22.1/A25.1* | |
| \faBook       | |
+-------------+--------------------------------------------------------+
| Fabrication   | En cas de situation désespérée, que faire quand vous ne voulez pas transgresser les principes de faible couplage et de forte cohésion? \newline\newline Affectez un ensemble très cohésif de responsabilités à une classe "comportementale" artificielle qui ne représente pas un concept du domaine — une entité fabriquée pour augmenter la cohésion, diminuer le couplage et faciliter la réutilisation.\newline |
| Pure          | |
| *F22.2/A25.2* | |
| \faBook       | |
+-------------+--------------------------------------------------------+
|Indirection    | Comment affecter les responsabilités pour éviter le couplage direct? \newline\newline Affectez la responsabilité à un objet qui sert d'intermédiaire avec les autres composants ou services.\newline |
| *F22.3/A25.3* | |
| \faBook       | |
+-------------+--------------------------------------------------------+
| Protection    | Comment affecter les responsabilités aux objets, sous-systèmes et systèmes de sorte que les variations ou l'instabilité de ces éléments n'aient pas d'impact négatif sur les autres? \newline\newline Identifiez les points de variation ou d'instabilité prévisibles et affectez les responsabilités afin de créer une « interface » stable autour d'eux. |
| \newline des  | |
| variations    | |
| *F22.4/A25.4* | |
| \faBook       | |
+-------------+--------------------------------------------------------+

: Patterns (principes) GRASP \label{tableGRASP}

## GRASP et RDCU

Les principes GRASP sont utilisés dans les réalisations de cas d'utilisation (RDCU). 
On s'en sert pour annoter les décisions de conception, pour rendre explicites (documenter) les choix. 
Voir la section \nameref{sec:RDCU} pour plus d'informations.

## GRASP et Patterns GoF

On peut voir les principes GRASP comme des généralisations (principes de base) des patterns GoF. Voir la section \nameref{sec:GRASP-GoF} pour plus d'informations.

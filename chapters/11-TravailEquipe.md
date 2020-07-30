# Développement de logiciel en équipe

Le développement de logiciels se fait souvent en équipe.
Cependant, il y a des défis pour travailler en équipe.
Souvent, avant l'université on apprend comment s'organiser en équipe, faire des rencontres, répartir le travail, planifier, etc.
Pourtant, il y a d'autres défis dans ce travail, des défis sur le plan humain.
C'est le sujet du livre "Team Geek" [-@fitzpatrick_team_2012] écrit par Brian W. Fitzpatrick (anciennement de Google) et Ben Collins-Sussman (Subversion, Google).

Aujourd'hui, la demande pour le talent en technologies de l'information est importante.
Les technologies évoluent constamment.
Qui développe du code pour [Flash \faWikipediaW](https://fr.wikipedia.org/wiki/Adobe_Flash) ces jours-ci?
Cette technologie est quasiment désuète.
Cependant, une chose qui ne change pas (beaucoup) est le comportement humain.

Les auteurs de "Team Geek" abordent les problèmes dus aux tendances comportementales chez les développeurs.
Par exemple, une personne n'a pas toujours envie de montrer son code source à ses coéquipiers pour plusieurs raisons:

- Son code n'est pas fini.
- Elle a peur d'être jugée.
- Elle a peur que quelqu'un vole son idée.

Dans tous ces cas, il s'agit de l'insécurité et c'est tout à fait normal.
Par contre, ce genre de comportement augmente certains risques dans le développement:

- de faire des erreurs dans la conception initiale;
- de "réinventer la roue";
- de terminer le travail plus tard que son compétiteur, qui, lui, a collaboré avec son équipe.

Les auteurs le disent et c'est un fait: si nous sommes tous plus ou moins compétents sur le plan technique, ce qui fera la différence importante dans une carrière est notre habileté à collaborer avec les autres.

![Pratiquement tout conflit social est dû à un manque d’humilité, de respect ou de confiance.](images/HRC_venn.pdf){width=40% #HRC_venn}

## Humilité, Respect, Confiance

L'humilité, le respect et la confiance (voir la figure&nbsp;\ref{HRC_venn}) sont les qualités de base pour le bon travail en équipe.
Cette section présente ces aspects en détail.

### Humilité

Voici la définition d'*humilité* selon Antidote:

> *Disposition à s'abaisser volontairement, par sentiment de sa propre faiblesse.*

Une personne humble pense ainsi:

- Je ne suis pas le centre de l'univers.
- Je ne suis ni omniscient ni infaillible.
- Je suis ouvert à m'améliorer.

> \faWarning &nbsp;L'humilité ne veut pas dire "je n'ai pas de valeur" ou "j'accepte d'être mal traité.e par les autres".

![Éviter d'être le ["Centre de l'univers"](https://www.flickr.com/photos/diamondduste/466060240/) ([CC BY-NC-ND 2.0](https://creativecommons.org/licenses/by-nc-nd/2.0/)) par [Diamondduste](https://www.flickr.com/people/diamondduste/).](https://farm1.static.flickr.com/171/466060240_0f1914cbb3_b.jpg){width="200px"}

![["Missing"](https://www.flickr.com/photos/smkybear/2705041322/) ([CC BY-SA 2.0](https://creativecommons.org/licenses/by-sa/2.0/)) par [smkybear](https://www.flickr.com/people/smkybear/).](https://farm4.static.flickr.com/3135/2705041322_d1e23d37d6_b.jpg){width="200px"}

```{.plantuml hide-image=true plantuml-filename=build/images/diag_moi_inf_equipe.pdf}
@startuml
skinparam defaultfontname Cooper Black
skinparam rectangleBorderColor transparent
hide empty members
hide circle
skinparam shadowing false
rectangle "<size:50>Moi < Équipe</size>" #ffbbbb|bbffbb
@enduml
```

![Un coéquipier humble va accepter une décision prise par l'équipe, même s'il n'était pas en accord à 100%. [(PlantUML)](http://www.plantuml.com/plantuml/uml/JOz12i8m54JtFSMd7a0tRgIKqguzn4_oquOcF_4dHHGluBcyc2s2T5R3pF1WkbnGoX9ybMV72GK36BAu-68Z5yP0CCIOIA3tgEVTJ4WNvD5J7yMG3D57WIB8UUs9IpKvGq0XbGS42eea_oBjH7lQaVA49juTZs3HPwh-PAYRx9vqEP_QQtJGmETzMroYvhZ5RGq7QzMgbrARgJfYitxv0W00)](build/images/diag_moi_inf_equipe.pdf)

Quelques exemples concrets d'humilité dans le développement:

- Un coéquipier débutant en JavaScript, git, etc. va le reconnaître et va même faire des exercices sur Internet pour s'améliorer.
- Un coéquipier (même le chef d'équipe) qui a pris une mauvaise décision (technique ou autre) va l'avouer. Il sait que les autres ne sont pas là pour l'attaquer (ils le respectent).
- Un coéquipier va travailler fort pour que *son équipe* réussisse.
- Un coéquipier qui reçoit une critique ne va pas la prendre personnellement.
Il sait que la qualité de son code n'équivaut pas à son estime de soi. (Cela n'est pas toujours facile!)

### Respect

Une personne démontrant du respect pense ainsi:

- Je me soucie des gens avec qui je travaille.
- Je les traite comme des êtres humains.
- J'ai de l'estime pour leurs capacités et leurs réalisations.

### Confiance

Une personne démontrant la confiance pense ainsi:

- Je crois que les autres coéquipiers sont compétents et qu'ils feront la bonne chose.
- Je suis à l’aise lorsqu'ils prennent le volant, le cas échéant.

Le dernier point peut être extrêmement difficile si vous avez déjà été déçu par une personne incompétente à qui vous avez délégué une tâche.

## Redondance des compétences dans l'équipe (Bus Factor) {#Bus_Factor}

Pour qu'une équipe soit robuste, il faut une redondance des compétences.
Sinon, la perte d'un coéquipier (pour une raison quelconque) peut engendrer de graves conséquences, voire arrêter carrément le développement.
Ce principe a été nommé en anglais *Bus factor*.
C'est le nombre minimum de coéquipiers à perdre (heurtés par un bus) pour arrêter le projet par manque de personnel bien informé ou compétent.
Par exemple, dans un projet de stage, si c'est vous qui écrivez tout le code, alors c'est un *bus factor* de 1.
Si vous n'êtes plus présent, le projet s'arrête.

Un coéquipier peut être absent (ou moins disponible) pour des raisons moins graves, par exemple, il part en vacances, il tombe malade, il prend un congé parental, il change d'emploi, ou il abandonne le cours.
Cherchez à répartir les responsabilités dans l'équipe afin d'avoir un *bus factor* d'au moins 2.
Partagez des compétences pour maintenir une équipe robuste.
Vous pouvez également garder votre solution *simple* et garder la documentation de votre conception à jour.

> \faWarning&nbsp;Si un coéquipier quitte en cours de la session, il n'est pas facile de maintenir le même rythme.
Cependant, les enseignants et les chargés de laboratoire de LOG210 s'attendront à ce que vous ayez pensé à un plan B avant de perdre le coéquipier. Au moins un autre coéquipier doit être au courant de ce que faisait l'ancien coéquipier, pour que le projet ne soit pas complètement arrêté.

## Mentorat

En LOG210, ça peut être l'enseignant qui décide la composition des équipes.
Ça veut dire que forcément certains coéquipiers ont plus d'expérience et de facilité à faire certaines tâches que d'autres.
Les équipes doivent composer avec cette diversité.
C'est une approche pédagogique reconnue par les experts.

Selon TeamGeek:

> Si vous avez déjà un bon bagage en programmation, ça peut être pénible de voir un coéquipier moins expérimenté tente un travail qui lui prendra beaucoup de temps lorsque vous savez que ça vous prendra juste quelques minutes.
Apprendre à quelqu'un comment faire une tâche et lui donner l'occasion d'évoluer tout seul est un défi au début, mais cela est une caractéristique importante du leadership.

Si les plus forts n'aident pas les autres, ils risquent de les éloigner de l'équipe et de se trouver seuls sur le plan des contributions techniques. Voir la section sur la \nameref{Bus_Factor}.

Encadrer un coéquipier au début de la session peut prendre beaucoup de temps. Mais, si la personne devient plus autonome, c'est un gain pour toute l'équipe. Cela augmente également le *bus factor*.

Voici quelques conseils pour le mentorat:

- avoir les compétences sur un plan technique;
- être capable d'expliquer des choses à quelqu'un d'autre;
- savoir combien d'aide à donner à la personne encadrée.

Selon TeamGeek, le dernier point est important parce que si vous donnez trop d'information, la personne peut vous ignorer plutôt que vous dire gentiment qu'elle a compris.

![Encadrer les coéquipiers est une habileté à mettre sur son CV ["CultureTECH BT Monster Dojo"](https://www.flickr.com/photos/24498081@N06/10081683216/) ([CC BY 2.0](https://creativecommons.org/licenses/by/2.0/)) par [connor2nz](https://www.flickr.com/people/24498081@N06/).](https://farm8.static.flickr.com/7459/10081683216_2b02836f82_b.jpg){width="400px"}

## Scénarios

Voici des situations qui pourraient arriver dans une session de LOG210:

- un coéquipier se trouve à être le seul à faire de la programmation.
  - il ne fait plus confiance à ses coéquipiers, car leur code est trop bogué.
  - il n'a pas la patience pour accommoder les coéquipiers moins expérimentés.
  - il croit qu'ils auraient dû apprendre mieux à programmer dans les cours préalables.
- un coéquipier dit qu'il a "fait ses 3 heures de contribution" chaque dimanche chez lui et que ça devrait suffire pour sa partie (il a un emploi et n'a pas beaucoup de temps disponible pour l'équipe d'un laboratoire).
- un ou deux membres d'une équipe abandonnent le cours après l'examen intra, à cause du double-seuil du cours.
- un coéquipier suit cinq (!) cours en même temps et n'a pas le temps adéquat pour travailler correctement dans LOG210.
- plusieurs coéquipiers sont "expérimentés" mais ils ont de la difficulté à s'entendre sur la direction du projet.
- l'équipe n'est pas cohésive; chacun fait avancer sa partie, mais le code ne fonctionne pas ensemble.

Vous devez en parler avec votre équipe. 
Si la situation ne s'améliore pas, vous pouvez en parler avec les chargés de laboratoire et l'enseignant.

Pour mieux évaluer le travail de chacun dans l'équipe au laboratoire, il y a des conseils dans la section \nameref{ContributionsEquipe}.

# Diagrammes de séquence système (DSS)

Un diagramme de séquence système (DSS) est un diagramme UML (diagramme de séquence) limité à un acteur (provenant du scénario d'un cas d'utilisation) et le Système.
Les DSS sont expliqués en détail dans le chapitre 10\ \faBook, mais voici des points importants pour LOG210:

- Le DSS a toujours un titre.
- L'acteur est indiqué dans la notation par un bonhomme et est représenté comme une *instance* de la classe du bonhomme, comme `:Joueur` dans la figure\ \ref{DSS-attaquer-un-pays} (le ":" signifie une instance).
- Le Système est un objet (une instance `:Système`) et n'est jamais détaillé plus.
- Le but du DSS est de définir des opérations système (Application Programming Interface) du système; il s'agit d'une conception de haut niveau.
- Le côté acteur du DSS n'est pas un acteur tout seul, mais une couche logicielle de présentation, comme une interface graphique ou un logiciel qui peut reconnaître la parole. Cette couche reconnaît des gestes de l'acteur (par exemple un clic sur un bouton dans l'interface, une demande "Hé Siri", etc.) et envoie une opération système.
- Puisque la couche présentation reçoit des informations des êtres humains, *les opérations système ont des arguments de type primitif*. Il est difficile pour un utilisateur de spécifier une référence (pointeur en mémoire) à un objet. Alors, on peut donner le nom (de type `String`) d'un morceau de musique à jouer, ou spécifier une quantité (de type `Integer`).
- Puisque les types des arguments sont importants, on les spécifie dans les opérations système du DSS.
- Un message de retour (ligne pointillée avec flèche ouverte) vers l'acteur représente la communication des informations précises, par exemple les valeurs des dés dans l'attaque. Puisque la couche présentation a beaucoup de moyens pour afficher ces informations, *on ne va pas spécifier les messages de retour comme des méthodes*.

## Exemple: DSS pour Attaquer un pays

La figure\ \ref{DSS-attaquer-un-pays} est un exemple de DSS pour le cas d'utilisation *Attaquer un pays*. Vous pouvez noter tous les détails (titre, arguments, types).

```{.plantuml caption="Diagramme de séquence système pour *Attaquer un pays*. [(PlantUML)](http://www.plantuml.com/plantuml/uml/VLFBRjj03BmBo3yGlZW6uhP1RuPXn6YA8cqA557INd9XLhIyi4Ifv2uI_r7r7VgnSkFOKN8me1V4uN268rreG0cnhZBTU6vHi0ODsuhiAjwboicWz81kKqeJkN1DrGW4GLOh4OUJR0nXxHNiG5WZ5u_YGo26LSC1FCCVpqNpg0Py9IneXR4A2S9O4_mGhwddwlQBuMxNf0HDM9CeL4spWL88dydotz_WjCQD2Or2DfcsOxjxDaDLHOLD5LXUNyDT_lKc7uo7yq-JeQNt2XJBTE7ZEgzu0z-RA8pLKTpJnXMGE_5jE8hxHROgqQ6muGg3HChKeULo_k7pC2lw6uaT_IHDmfULBncSnK6I1HyCVvddq9fIcFl5CWGql41aQ76hyuz-aQ4BjghHpEnGb16WWikCFNZdMxJeHhDygw7_LzDpKJCtNIZCeEYx6aL8NcXF4-NkERND8BTFYCkpUqw5oxvR4QkDE5GccMNQcX85qrjxxhizDp8tPkj0pGytVLVwsfoz6U4vJDxtx2UzQTgzB8PTy_bqclgaxzIomA0MIphZ4rIOcFGi5LyOe2Kfei8z5mJL60ygA40HqpRs_cphpZprdLltdI4o6vm-ttQlTEVsrTqakp28_Ml_0G00)" #DSS-attaquer-un-pays }
@startuml
!include ../forme.pumlinclude
scale 1.3
skinparam sequenceMessageAlign center
title DSS pour <i>Attaquer un pays</i>
actor ":Joueur" as c
participant ":Système" as s
c->s : démarrerAttaque(paysAttaquant : String,\npaysDéfenseur : String)
loop pas terminé
c->s : annoncerAttaque(nbRégimentsAttaquant : int)
c->s : annoncerDéfense(nbRégimentsDéfendant : int)
c<<--s : résultats des deux lancers, régiments perdus \nde l'attaquant et du défenseur le cas échéant
end loop
c->s : terminerAttaque()
@enduml
```

## Les DSS font abstraction de la couche présentation

Le but du DSS est de se concentrer sur l'API (les opérations système) de la solution.
Dans ce sens, c'est une conception de haut niveau.
Le "Système" est modélisé comme une boîte noire.
Par exemple, dans la figure\ \ref{DSS-abstraction} il y a l'acteur, le Système et une opération système.
On ne rentre pas dans les détails, bien qu'ils existent et sont importants.

```{.plantuml caption="Une opération système dans un DSS. C'est une abstraction. [(PlantUML)](http://www.plantuml.com/plantuml/uml/VLB1IWD13Bqlz1z2Bwq7YyLR3z8Y8ce5SQkUusniXvtDr2HBxH_fT_J7pFRYug4mP0xl9Nd9ormDnTec5Lf7tg9W0shxH1ubXWuPzA1t3FLQSijLo2aBc22hGyGsA4PWcwZW3s63NEqacX73HsQ3oF0MkSexTU9VmOe-i4tMKHWRWWU9skNShQwTjzgG4cJRa2Yad6jO2-6nMFbw2-C6QnVQ2dbdse_yZ-m3fKILTnLOB9VmKjuybxtsCBquwu_qNu7YkWjyMkSTrt2VMs5C9tbVTQYW31AtTfBtHBugqRwm_WfDMYeqeFiodLpslQBFbZZG8sadV97YcY6u7IG51lCT36UkareP0Yg4mjCiXhX5zsGuA_TgX--6Zg0MuVnAOGRLuQT14PA56NhzyMGoEIlcn9MVmoy0)" #DSS-abstraction }
@startuml
!include ../forme.pumlinclude
scale 1.3
skinparam sequenceMessageAlign center
actor ":Joueur" as c
participant ":Système" as s
c->s : démarrerAttaque(...)
@enduml
```

Plus tard, lorsque c'est le moment d'implémenter le code, les détails importants seront à respecter.
Il faut faire attention aux principes de la séparation des couches présentation et domaine.
Par exemple, la figure\ \ref{DSS-details} rentre dans les détails de ce qui se passe réellement dans une opération système quand la solution fonctionne avec un service web:

- D'abord, l'acteur clique sur un bouton;
- Ce clic se transforme en service REST;
- Un routeur transforme l'appel REST en une opération système envoyée à un contrôleur GRASP. Notez que c'est un **objet du domaine qui reçoit l'opération système** -- c'est l'essence du principe GRASP Contrôleur;
- Le contrôleur GRASP dirige la suite, selon la solution proposée dans la réalisation de cas d'utilisation (RDCU).

```{.plantuml caption="Une opération système est envoyée par la couche présentation et elle est reçue dans la couche domaine par son contrôleur GRASP. Ceci est un exemple avec un navigateur web, mais d'autres possibilités existent pour la couche présentation. [(PlantUML)](http://www.plantuml.com/plantuml/uml/VLJ1RXen4Bslb7yOqKC2Ig6ebmf5gm29qgH9YrZIN7ePx06SDVPsx4r8lwYvzm_uiSwksdH1LQILlVAyUU_DZENJ495ZkRP9o8qha74D8JvPafMDgY87ZT0SLRvaNpgjlFKCaT452P6B1yaXn9K981_22fr-P1CZELXu5y4uk3DE-ySWm7-4cXPOsbX17Au9Fh49LSxbR2ousOe2WOyhuW3M-noMJ5YJPLylu6YDkHWjcKIPdWvbDquAifQqg38Chw_XDZkVPWrvwBzhDqlQTn1mMItkTP-NBeShNx93-ofkaoiDcM9Jn5Tn4v9MSMWQQxOmSab9K2XpwNVVDsT5tqjoYcueLCQ7rYmTA1a7SGCbQpJA5EZY1BKsRYbT-0_Bo6z6dZNnU7-w2Qee9ws154qbjm03t2Tplu7Ms9TgHL3mzZa84gFnhWLlj5uij4uQqf8zAcEief8zXvEJp_XWbXY5y8xcQGfxwAalurynhk1Uq_ccOAarJHDo6iJ0ZWdjrsWSrVALWJt2Aogd9kGreHB2iRIVjx-iY5nCXzb4M7SIkjrkZGqlOlVmDXNh0r3MICyucSj1Aku6y74scy35-UoRws5XUW_zdju-hv6PU1WZ2hedV8dpKQxq0t6TL9V8zQojx4T_ocid_CAhQOUaIN0CQW1VYkqprrs7y1JYzgTS9r5U66VaHoO8PrbMyqdD0-XqJeBvGOF-XtIF-KZijJkTH5NG8D1Tk-guFWnaHSaYJC_6jycfD4RUYDy0)" #DSS-details }
@startuml
!include ../forme.pumlinclude
scale 1.3
skinparam sequenceMessageAlign center
skinparam participantPadding 10
skinparam sequenceBoxBorderColor transparent
actor ":Joueur" as j
box "Couche présentation" #ddffdd
participant ":Button" as b <<NavigateurWeb>> 
participant ":Routeur" as r <<NodeExpress>>
end box
box "Couche domaine" #ddddff
participant ":JeuRisk" as c <<ContrôleurGRASP>>
participant "..." as s
end box
j -> b : cliquer
b ->> r : HTTP GET\n/api/v1/démarrerAttaque/...
note over r : Router handler (Express)
r ->> r : demarrerAttaque
note over r, c: Opération système définie dans DSS
r -> c : **<size:18>demarrerAttaque(...)**
c -> s : ...
note over c, s : selon la RDCU
@enduml
```

> \faWarning\ La figure\ \ref{DSS-details} est à titre d'information seulement. Les DSS sont censés être simples (sans rentrer dans les détails). C'est de la conception à haut niveau.

## FAQ DSS

### Faut-il une opération système après une boucle?

> Dans l'exemple pour *Attaquer un pays*, à l'extérieur de la boucle il y a une opération système `terminerAttaque`.
> Est-ce obligatoire d'avoir une opération système après une boucle?

L'opération système `terminerAttaque` sert pour signaler la fin de la boucle.
Le système saura que l'acteur ne veut plus répéter les actions dans la boucle.
Mais elle permet aussi de faire des calculs concernant ce qui s'est passé dans la boucle, p. ex. pour déterminer qui contrôle quel pays après les attaques.

Cependant, si vous avez une boucle pour indiquer la possibilité de répéter une action (p. ex. ajouter des produits dans un système d'inventaire) et vous n'avez pas besoin de faire un calcul à la fin, alors une opération système pour terminer une telle boucle n'est pas nécessaire (surtout avec une application web).

### Comment faire si un cas d'utilisation a des *scénarios alternatifs*?

> Fait-on plusieurs DSS (un pour chaque scénario) ou utilise-t-on la notation UML (des blocs `opt` et `alt`) pour montrer des flots différents dans le même DSS?

Un objectif de faire un DSS est de **définir les opérations système**.
Donc, on peut se poser la question suivante: les scénarios alternatifs impliquent-ils une ou plusieurs opérations système n'ayant pas encore été définies?
Si la réponse est non, on peut ignorer les scénarios alternatifs dans le DSS.
Par contre, si la réponse est oui, il est essentiel de définir ces opérations système dans un DSS.
Quant au choix de faire des DSS séparés ou d'utiliser la notation UML pour montrer les flots différents sur le même DSS, ça dépend de la complexité de la logique des flots.
Un DSS devrait être *facile à comprendre*.
C'est à vous de juger si votre DSS avec des `opt` ou `alt` est assez simple ou fait du *spaghetti*.
Utilisez un autre DSS (ou plusieurs) ayant le nom des scénarios alternatifs si cela vous semble plus clair.

### Est-ce normal d'avoir une opération système avec beaucoup d'arguments (de type primitif)?

> Puisqu'une opération système doit avoir seulement des arguments de type primitif, j'ai plusieurs opérations système avec de nombreux (plus que 5) arguments. Pourquoi il n'est pas permis de passer des objets comme argument?

Il n'est pas conseillé de passer des *objets du domaine* comme argument, puisque c'est la couche présentation qui invoque l'opération système.
La couche présentation n'est pas censée manipuler directement les objets dans la couche domaine, sinon elle empiète sur les responsabilités de la couche domaine.

Une solution pour réduire le nombre d'arguments sans utiliser un objet du domaine est d'appliquer un \nameref{Refactoring} pour le *smell* nommé *Long Parameter List*, par exemple [Introduce Parameter Object](https://refactoring.com/catalog/introduceParameterObject.html).
Notez que l'objet de paramètres que vous introduisez n'est pas un objet (classe) du domaine!
La distinction est importante, car la logique d'affaires demeure dans la couche domaine.
En TypeScript, une fonction peut être définie avec un objet de paramètre. Cet exemple montre même comment on peut "déstructurer" l'objet pour déclarer les variables utilisées dans la fonction:

```typescript
// inspiré de https://leanpub.com/essentialtypescript/read
function compteARebours({ initial: number, final: final = 0,
                          increment: increment = 1, initial: actuel }) {
    while (actuel >= final) {
        console.log(actuel);
        actuel -= increment
    }
}
compteARebours({ initial: 20 });
compteARebours({ initial: 20, increment: 2, final: 4 });
```

### Ne serait-il pas plus simple de passer l'objet `body` de la page web au contrôleur GRASP?

> Décortiquer toutes les informations dans un formulaire web est compliqué, puis on doit passer tout ça à un contrôleur GRASP comme des arguments de type primitif.
Ne serait-il pas plus simple de passer l'objet `body` de la page web au contrôleur GRASP et le laisser faire le décorticage?

Dans un sens ça serait plus simple (pour le code de la couche présentation).
Cependant, nous voulons séparer les couches pour favoriser le remplacement de la couche présentation, par exemple à travers une application iOS ou Android.

Si vous mettez la logique de la couche présentation (décortiquer un formulaire web) dans la couche domaine (le contrôleur GRASP), ça ne respecte pas les responsabilités des couches.
Imaginez un tel contrôleur GRASP si vous aviez trois types d'application frontale (navigateur web, application iOS et application Android).
Le contrôleur GRASP recevra des représentations de "formulaire" de chaque couche présentation différente.
En passant, l'objet `body` n'a rien à voir avec une interface Android!
Ce pauvre contrôleur serait obligé de connaître alors toutes les trois formes (web, iOS, Android) et ainsi sa cohésion sera beaucoup plus faible.
Pour respecter les responsabilités, on laisse la couche présentation faire le décorticage et construire une opération système selon l'API définie dans le DSS.
Cela simplifie aussi le contrôleur GRASP.

# Outils pour la modélisation UML

Le chapitre F20/A22&nbsp;\faBook&nbsp;définit quelques termes importants pour la modélisation avec UML et les outils.

En mode esquisse, lorsqu'on dessine un modèle sur un tableau blanc ou un papier, un outil pratique pour numériser le tout est **Office Lens** ([Android](https://play.google.com/store/apps/details?id=com.microsoft.office.officelens&hl=fr_CA) ou [iOS](https://apps.apple.com/ca/app/microsoft-office-lens-pdf-scan/id975925059)).
Les filtres pour supprimer les reflets sur les tableaux blancs sont impeccables.

![Office Lens peut détecter le cadre d'un dessin sur un tableau blanc ou papier et le transformer](images/OfficeLensWhiteBoard.JPG){width="200px"}

Dans LOG210, on exploite l'outil PlantUML pour faire beaucoup de modèles. C'est un outil qui a plusieurs avantages:

- il est basé sur un langage dédié simple (anglais *domain specific language* ou DSL), dont les fichiers peuvent être facilement mis sur contrôle de version (git);
- il est basé sur du code libre;
- il s'occupe de la mise en page des diagrammes (cela est parfois un inconvénient si un modèle est complexe);
- il est populaire (utilisé par des ingénieurs chez Google pour documenter Android, Pay, etc.);
- il existe plusieurs supports pour les outils de documentation:
  - extension [PlantUML pour VisualStudio Code](https://marketplace.visualstudio.com/items?itemName=jebbs.plantuml) (figure&nbsp;\ref{PlantUMLVSCode});
  - extension [PlantUML Gizmo](https://gsuite.google.com/marketplace/app/plantuml_gizmo/950520042571?pann=cwsdp&hl=en) pour Google Docs et Google Slides,développée en 2014 par le professeur Christopher Fuhrman dans le cadre de son travail à l'ÉTS (figure&nbsp;\ref{PlantUMLGizmo})

> \faWarning&nbsp;Tous les travaux demandés pour les **examens** de LOG210 doivent être faits *à la main*.
Pour cette raison, il vaut mieux pratiquer dessiner les modèles en mode esquisse (à la main).

![L'extension PlantUML pour VisualStudio Code](images/PlantUMLVSCode.png){#PlantUMLVSCode}

![PlantUML Gizmo pour Google Docs et Google Slides](images/PlantUMLGizmoSlides.png){#PlantUMLGizmo}

Pour un débutant, le langage PlantUML peut sembler plus compliqué que utiliser un outil graphique comme Lucidcharts.
Cependant, pour beaucoup de diagrammes (p.ex. diagrammes de séquence), ça peut étre plus long à créer ou à modifier.
Bien que ces éditeurs aient des gabarits ou des modes "UML", ceux-ci ne sont pas toujours conviviaux ou complets.
C'est souvent des objets groupés et le vrai sens de la notation UML n'est pas considéré (p.ex. une ligne de vie dans un diagramme de séquence est toujours verticale).
Ça peut prend beaucoup de clics pour effectuer une modification et on peut obtenir des résultats intermédiaires qui n'ont aucun sens en UML (p.ex. la figure&nbsp;\ref{LucidchartUML}).
Il est possible de corriger le diagramme, mais en combien de clics?
C'est très vite tannant.

![Lucidcharts mode UML pour Google permet des diagrammes qui ne sont pas du tout de l'UML. C'est principalement un éditeur graphique et vous risquez de perdre du temps à faire de l'UML avec ce genre d'outil.](images/LucidchartDSSBotched.png){#LucidchartUML}

## Exemples de diagramme avec PlantUML pour LOG210

Voir le menu dans PlantUML Gizmo...

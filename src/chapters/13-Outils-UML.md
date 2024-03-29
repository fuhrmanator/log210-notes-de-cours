# Outils pour la modélisation UML

Le chapitre F20/A22\ \faBook\ définit quelques termes importants pour la modélisation avec UML et les outils.

En mode esquisse, lorsqu'on dessine un modèle sur un tableau blanc ou un papier, un outil pratique pour numériser le tout est **Office Lens** ([Android](https://play.google.com/store/apps/details?id=com.microsoft.office.officelens&hl=fr_CA) ou [iOS](https://apps.apple.com/ca/app/microsoft-office-lens-pdf-scan/id975925059)).
Les filtres pour supprimer les reflets sur les tableaux blancs sont impeccables.

![Office Lens peut détecter le cadre d'un dessin sur un tableau blanc ou papier et le transformer.](images/OfficeLensWhiteBoard.jpg){width="200px"}

> \faWarning\ Tous les travaux demandés pour les **examens** de LOG210 doivent être faits *à la main*.
Pour cette raison, il vaut mieux pratiquer dessiner les modèles en mode esquisse (à la main).

Dans LOG210, on exploite l'outil PlantUML pour faire beaucoup de modèles. C'est un outil qui a plusieurs avantages:

- il est basé sur un langage dédié simple (anglais *domain specific language* ou DSL), dont les fichiers peuvent être facilement mis sur contrôle de version (git);
- il est basé sur du code libre;
- il s'occupe de la mise en page des diagrammes (cela est parfois un inconvénient si un modèle est complexe);
- il est populaire (utilisé par des ingénieurs chez Google pour documenter Android, Pay, etc.);
- il existe plusieurs supports pour les outils de documentation:
  - extension [PlantUML pour VisualStudio Code](https://marketplace.visualstudio.com/items?itemName=jebbs.plantuml) (figure\ \ref{PlantUMLVSCode}) avec [tutoriel](https://www.youtube.com/watch?v=xkwJ9GwgZJU)\ \faYoutube;
  - extension [PlantUML Gizmo](https://gsuite.google.com/marketplace/app/plantuml_gizmo/950520042571?pann=cwsdp&hl=en) pour Google Docs et Google Slides, développée en 2014 par le professeur Christopher Fuhrman dans le cadre de son travail à l'ÉTS (figure\ \ref{PlantUMLGizmo})

![L'extension PlantUML pour VisualStudio Code.](images/PlantUMLVSCode.png){#PlantUMLVSCode}

Pour un débutant, le langage PlantUML peut sembler plus compliqué qu'utiliser un outil graphique comme Lucidchart.
Cependant, pour beaucoup de diagrammes (comme les diagrammes de séquence), ça peut être plus long à créer ou à modifier.
Bien que ces outils aient des gabarits ou des modes "UML", ceux-ci ne sont pas toujours conviviaux ou complets.
C'est souvent juste des objets groupés et le vrai sens de la notation UML n'est pas considéré. 

Par exemple, une ligne de vie dans un diagramme de séquence est toujours verticale, mais un éditeur graphique quelconque permet de l'orienter dans n'importe quel sens. 
Ça peut prendre beaucoup de clics pour effectuer une modification et on peut obtenir des résultats intermédiaires qui n'ont aucun sens en UML (voir la figure\ \ref{LucidchartUML}).
Il est possible de corriger le diagramme, mais en combien de clics?
C'est très vite tannant.

## Exemples de diagramme avec PlantUML pour LOG210

Dans le menu "Select sample diagram" de PlantUML Gizmo (Google Docs), il y a plusieurs exemples de diagrammes utilisés dans le cadre de LOG210 (voir la figure\ \ref{GizmoSamples}).

## Astuces PlantUML

- [Comment intégrer PlantUML dans le `Readme.md` de GitHub/GitLab?](https://stackoverflow.com/q/32203610/1168342)\ \faStackOverflow
- Le serveur de PlantUML.com génère un diagramme à partir d'un URL:  
`https://plantuml.com/plantuml/{forme}/{clé}` qui contient une clé comme  
`Syp9J4vLqBLJSCfFib9mB2t9ICqhoKnEBCdCprC8IYqiJIqkuGBAAUW2rJY256DHLLoGdrUS2W00`.  
La clé est en fait une représentation compressée du code source.
- On peut changer la forme du diagramme en changeant la partie `{forme}` de l'URL:
  - `{forme}` → `png`, `img` ou `svg` : représentation graphique correspondante;
  - `{forme}` → `uml` : récupération du code source PlantUML (ça marche avec `http:` seulement);
- On peut également récupérer le code source d'un URL avec l'outil PlantUML localement avec l'option `-decodeurl {clé}` de la ligne de commande:
```bash
$ java -jar plantuml.jar -decodeurl Syp9J4vLqBLJSCfFib9mB2t9ICqhoKnEBCdCprC8IYqiJIqkuGBAAUW2rJY256DHLLoGdrUS2W00
@startuml
Alice -> Bob: Authentication Request
Bob --> Alice: Authentication Response
@enduml
```
- Les images `png` générées par le serveur ou par l'outil contiennent une copie du code source dans les meta-données PNG. 
  - On peut [récupérer le code source PlantUML à partir d'une image PNG](https://twitter.com/thefuhrmanator/status/1193565869227556868) avec un outil sur le Web comme [ceci](http://exif.regex.info/exif.cgi).
  - On peut également utiliser l'option `-metadata` de la ligne de commande PlantUML:
```bash
$ java -jar plantuml.jar -metadata diagram.png > diagram.puml
```

![PlantUML Gizmo pour Google Docs et Google Slides.](images/PlantUMLGizmoSlides.png){#PlantUMLGizmo}

![PlantUML Gizmo offre plusieurs exemples de diagramme UML.](images/SelectSampleDiagramGizmo.png){#GizmoSamples}

![Exemple de tentative de créer un diagramme de séquence système (DSS) avec Lucidcharts. C'est principalement un éditeur graphique avec les éléments graphiques UML qui sont essentiellement des éléments graphiques composés. Il n'y a pas de sémantique UML dans l'outil. Par exemple, un "messages" dans Lucidcharts est juste une ligne groupée avec un texte. Elle peut se coller dynamiquement à d'autres éléments en se transformant en courbe (!) lorsque vous déplacez un bloque "loop". La ligne de vie de l'acteur Étudiant se transforme en diagonale lorsque l'acteur est déplacé à droite. Un vrai message UML est normalement toujours à l'horizontale et une vraie ligne de vie est toujours à la verticale. Puisque Lucidcharts ne connaît pas cette sémantique, vous risquez de perdre beaucoup de temps à faire des diagrammes UML avec ce genre d'outil.](images/LucidchartDSSBotched.png){#LucidchartUML}


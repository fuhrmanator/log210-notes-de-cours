
# Laboratoires

Ce chapitre contient des information sur le volet technique des laboratoires.

## JavaScript/TypeScript

Un tutoriel intéressant (et libre) est sur [javascript.info](https://javascript.info/). Je vous recommande de contribuer à des [traductions en français sur GitHub](https://github.com/javascript-tutorial/fr.javascript.info#readme). 

Voici les points qui posent plus de problèmes pour quelqu'un ayant déjà des connaissance en Java:

- Fonctions flèche (*arrow functions* en anglais)
- Traitement asynchrone en JavaScript
  - Promesses et `async`/`await` : [Tutoriel](https://javascript.info/async)
- REST (GET vs PUT)
- Environnement de test (Mocha/Chai)
- Les templates PUG (anciennement Jade) : [Tutoriel](https://www.youtube.com/watch?v=DSp9ExFw3Ig)

Le lab0 aborde plusieurs de ces aspects, mais certaines notions sont plus complexes. 
Le but de cette section est de donner des tutoriels plus spécifiques.

Il y a un [dépôt d'exemples avec TypeScript (utilisant `ts-node` pour les voir facilement)](https://github.com/profcfuhrmanets/exemples-ts) sur GitHub.

## Contribution de l'équipe

Il existe un outil nommé `gitinspector` qui peut indiquer le niveau d'implication des membres de l'équipe dans un projet sur GitHub. Étant donné que LOG210 utilise un squelette avec les tests, les fichiers `src` de TypeScript, les modèles PlantUML et le README.md, il est possible d'utiliser `gitinspector` pour voir des rapports de contribution sur chacun des volets.

Pour faciliter l'utilisation de l'outil, le professeur Fuhrman a créé un [script en bash](https://gist.github.com/fuhrmanator/b5b098470e7ec4536c35ca1ce3592853). Voici comment l'utiliser:

- Installer `gitinspector` dans npm avec la commande `npm install -g gitinspector`
- Télécharger le script 
```bash
$ git clone https://gist.github.com/fuhrmanator/b5b098470e7ec4536c35ca1ce3592853 log210-contributions
Cloning into 'log210-contributions'...
remote: Enumerating objects: 10, done.
remote: Counting objects: 100% (10/10), done.
remote: Compressing objects: 100% (5/5), done.
remote: Total 10 (delta 3), reused 7 (delta 2), pack-reused 0
Unpacking objects: 100% (10/10), 2.02 KiB | 82.00 KiB/s, done.
```

- Lancer le script sur un repo, par exemple `sga-equipe-g02-equipe-4`:
```bash
$ cd log210-contributions/
$ ./contributions.sh ../sga-equipe-g02-equipe-4/
gitinspector running on ../sga-equipe-g02-equipe-4/ : patience...
ContributionsÉquipeTest.html
ContributionsÉquipeModèles.html
ContributionsÉquipeDocs.html
ContributionsÉquipeTypeScript.html
ContributionsÉquipeViews.html
```

Les fichiers `.html` qui sont créés vont indiquer des informations sur deux volets:
- Le nombre de soumissions par auteur (activité)
- Le nombre de lignes par auteur encore présentes et intactes

Vous pouvez voir un exemple du rapport à la Figure&nbsp;\ref{GitinspectorOutput}.

![Exemple de rapport généré par `gitinspector`](images/gitinspector_output.png){#GitinspectorOutput}

## TODO

- modifier le squelette pour aussi utiliser `PUT` (REST)
- inclure exemples de `before` et `after` dans les tests, avec une référence à la doc

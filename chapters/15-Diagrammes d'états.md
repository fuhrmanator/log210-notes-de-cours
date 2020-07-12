# Diagrammes d'état

Ce chapitre contient des informations sur les diagrammes d'état en UML. Le sujet est traité dans les chapitres 25 (français) et 29 (anglais)&nbsp;\faBook&nbsp;du livre du cours.

Il s'agit de la modélisation. Un état est une simplification de la réalité de quelque chose qui évolue dans le temps. 

Les points importants:

- Un diagramme d'état sert à modéliser les comportements. Un concept préalable: \faWikipediaW&nbsp;[Automate fini](https://fr.wikipedia.org/wiki/Automate_fini#Automates_UML)
- Un diagramme d'état contient des éléments suivants:
  - Événement
    - occurrence d'un fait significatif ou remarquable
  - État
    - la condition d'un objet à un moment donné, jusqu'à l'arrivée d'un nouvel événement
  - Transition
    - relation état-événement-état
    - indique que l'objet change d'état
- La différence entre les objets
  - Un objet répondant de la même manière à un événement donné est un objet *état-indépendant* (par rapport à l'événement)
  - Un objet répondant différemment, selon son l'état, à un événement donné est un objet état-dépendant
- Les transitions peuvent avoir des *actions* et des *conditions de guard*
- Dans la notation, il y a également la possibilité de faire les *états imbriqués*

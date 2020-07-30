# Diagrammes d'état

Ce chapitre contient des informations sur les diagrammes d'état en UML. Le sujet est traité dans le chapitre A29/F25&nbsp;\faBook&nbsp;du livre du cours.

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
- Les transitions peuvent avoir des *actions* et des *conditions de garde*
- Dans la notation, il y a également la possibilité de faire les *états imbriqués*

La figure&nbsp;\ref{DiagrammeEtat} est un exemple tiré du livre du cours et fait en PlantUML.

```{.plantuml hide-image=true plantuml-filename=build/images/DiagrammeEtat.pdf}
@startuml
skinparam style strictuml
skinparam backgroundcolor transparent
skinparam DefaultTextAlignment center
hide empty description
[*] --> Inactif
Inactif -> Actif : décrocher / tonalité \n [abonné valide]
Actif -> Inactif : raccrocher
state Actif {
[*] --> ÉmissionTonalité
ÉmissionTonalité --> Numérotation : chiffre
Numérotation --> Connexion: terminé
Numérotation --> Numérotation : chiffre
Connexion -u-> Conversation : connecté
}
@enduml
```

![Diagramme d'états (figure A29.3/F25.10&nbsp;\faBook&nbsp;du livre). [(PlantUML)](http://www.plantuml.com/plantuml/uml/TL6xRiCm3Dpr5PmB6Dqz537QfKkdR4a6HQ9Z8HPbK7IGeEW7z5Fo7VwnqgbjzBbGrDtnT8HMMInB7rkJZu4wopP2bakBMZcu7ypUkkE1Kq_UfJOn25lAIY795zKJrhPlPOrdgTfmeAWqE2t8fWaU0MCd5_2O7OTEGYApkTj1KJp0CradeJRJ2GfLjwO4FrmT9zSWmpr88ji66Qwm9TZOVIBI_gIOnvsfvjdPfWIsRfeskh7WPFkwl3oynv2pPbdFrkOtT5E-z76uSb8NfTJQDQ6k6SrtV5G-QYmywwq4tJq6pVY7wZ-_PHgA_jFiX9mNrSYwCUQRMI5v_QWF)](build/images/DiagrammeEtat.pdf){#DiagrammeEtat}



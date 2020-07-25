# Diagrammes de déploiement et de composants

Ce chapitre&nbsp;\faIcon{truck-loading}&nbsp;contient des informations sur les diagrammes de déploiement et de composants en UML. Les détails se trouvent dans le chapitre F31/A37&nbsp;\faBook&nbsp;du livre du cours.

## Diagrammes de déploiement

Un diagramme de déploiement présente le déploiement sur l'**architecture physique**. Il sert à documenter

1. comment les fichiers exécutables seront affectés sur les nœuds de traitement et 
2. la communication entre composants physiques

Voici les éléments importants:

- Types de nœuds
  - **Nœud physique (équipement)** : Ressource de traitement physique (p.ex. de l'électronique numérique), dotée de services de traitement et de mémoire destinés à exécuter un logiciel. Ordinateur classique, cellulaire, etc.
  - **Nœud d'environnement d'exécution  (EEN *execution environment node*)** : Ressource de traitement logiciel qui s'exécute au sein d'un nœud externe (comme un ordinateur) et offrant lui-même un service pour héberger et exécuter d'autres logiciels, par exemple:
    - Système d'exploitation (OS) est un logiciel qui héberge et qui exécute des programmes
    - Machine virtuelle (JVM ou .NET)
    - Moteur de base de données (p.ex. PostgreSQL) exécute les requêtes SQL
    - Navigateur Web héberge et exécute JavaScript, applets Flash/Java
    - Moteur de workflow
    - Conteneur de servlets ou conteneur d'EJB

La figure&nbsp;\ref{DiagrammeDeploiement} est un exemple de diagramme de déploiement.


```{.plantuml hide-image=true plantuml-filename=build/images/DiagrammeDeploiement.pdf}
@startuml
skinparam style strictuml
skinparam componentStyle uml2

node "Browser moderne" {
    component [Application frontale\nminimaliste, par exemple\nles pages web (templates)\net un peu de JavaScript] as GUI
}

node "Système de gestion\ndes apprentissages\n(SGA)" <<Système>> {
    interface Routage as Router

    [Application conçue\nselon la méthodologie\nproposée par Larman] as App

    database "Solution\nsimple" as SimpleDB {
    } 
}

node "Système de gestion\ndes borderaux\n(SGB)" as SGB <<Système>> #999999 {
note as SGBNote
<&arrow-circle-left> Source pour les
infos sur les cours, 
les étudiants, etc.
<&arrow-circle-right> Destination pour les
résultats des question-
naires et devoirs.
end note
}


GUI -left-( Router : API REST niveau 1
Router -down- App
App -down- SimpleDB
App -right- SGB : API REST
@enduml
```

![Diagramme de déploiement. [(PlantUML)](http://www.plantuml.com/plantuml/uml/ZLDHQnin37xthn0PZ1HwXUrj8uGcT8IECKPlUrhseDmfgPbFzcGxQHdzFLj-H_vOvRkaetsQuUuaMVxqwPFlCYQKb3jdua_B0GKxYEdUaRx5DYzs6jy5pyIfxbDqywqnx5k2qLpyBf90fvumZU2t0LrF9-3xB0Hd6qpMCwp5Sq97I-uismwTZOdEGQi0tL4NoewZg86DldUqWd4gOKmKpvPC2J93e0nQ-YDkiMx4XlG3CCBYsxLvEB6gxsCw_Esev2bIgRtaLY4n155MDiPIOSdZUZ4x6y5aSZendHuxi9n8rjWGtFYSDBiKAIQ9wHEUDTPuFlp9oZwIKzSXT8TzklMjTtvZDHx41nyFU-gR_OJI8VUy5MN0Qp7X2cDXxrqUA4TRD1cLlBeth-P7UW_m7zsklEXKCD_rZSxF1g35_7c_hzxrIu7P9pgcV5RJJ5wZw7ohnahZg7AqJbEeVHPL9UW7T5R6yjf7Y8EdGcI9vs2AhGharY8d3L1gBbxYYTtSAk1LeSo3Za-eSjZ7x1Ac2AMJNtdegpACLZIWLw6bhRSIBmnn2uLwKSJeFO2UQJK-ZWlUm-pBDTnygBy2sorXXZVck5MrViTLFmHzJkv9wo7MqwnwtVuXcKkjgZ_28m00)](build/images/DiagrammeDeploiement.pdf){#DiagrammeDeploiement}


# Diagrammes de déploiement et de composants

Ce chapitre\ \faIcon{truck-loading} contient des informations sur les diagrammes de déploiement et de composants en UML. Les détails se trouvent dans le chapitre F31/A37\ \faBook.

## Diagrammes de déploiement

Un diagramme de déploiement présente le déploiement sur l'**architecture physique**. Il sert à documenter:

1. comment les fichiers exécutables seront affectés sur les nœuds de traitement et
2. la communication entre composants physiques

Voici les éléments importants:

- Types de nœuds
  - **Nœud physique (équipement)** : Ressource de traitement physique (ex. de l'électronique numérique), dotée de services de traitement et de mémoire destinés à exécuter un logiciel. Ordinateur classique, cellulaire, etc.
  - **Nœud d'environnement d'exécution  (EEN *execution environment node*)** : Ressource de traitement logiciel qui s'exécute au sein d'un nœud externe (comme un ordinateur) et offrant lui-même un service pour héberger et exécuter d'autres logiciels, par exemple:
    - Système d'exploitation (OS) est un logiciel qui héberge et qui exécute des programmes
    - Machine virtuelle (JVM ou .NET)
    - Moteur de base de données (ex. PostgreSQL) exécute les requêtes SQL
    - Navigateur Web héberge et exécute JavaScript, applets Flash/Java
    - Moteur de workflow
    - Conteneur de servlets ou conteneur d'EJB

La figure\ \ref{DiagrammeDeploiement} est un exemple de diagramme de déploiement (laboratoire). 
La figure\ \ref{iTunesDiagrammeDeploiement} est un exemple de diagramme de déploiement pour le logiciel iTunes d'Apple. 

```{.plantuml caption="Diagramme de déploiement du système à développer pour le laboratoire. [(PlantUML)](http://www.plantuml.com/plantuml/uml/ZLDHQnin37xthn0PZ1HwXUrj8uGcT8IECKPlUrhseDmfgPbFzcGxQHdzFLj-H_vOvRkaetsQuUuaMVxqwPFlCYQKb3jdua_B0GKxYEdUaRx5DYzs6jy5pyIfxbDqywqnx5k2qLpyBf90fvumZU2t0LrF9-3xB0Hd6qpMCwp5Sq97I-uismwTZOdEGQi0tL4NoewZg86DldUqWd4gOKmKpvPC2J93e0nQ-YDkiMx4XlG3CCBYsxLvEB6gxsCw_Esev2bIgRtaLY4n155MDiPIOSdZUZ4x6y5aSZendHuxi9n8rjWGtFYSDBiKAIQ9wHEUDTPuFlp9oZwIKzSXT8TzklMjTtvZDHx41nyFU-gR_OJI8VUy5MN0Qp7X2cDXxrqUA4TRD1cLlBeth-P7UW_m7zsklEXKCD_rZSxF1g35_7c_hzxrIu7P9pgcV5RJJ5wZw7ohnahZg7AqJbEeVHPL9UW7T5R6yjf7Y8EdGcI9vs2AhGharY8d3L1gBbxYYTtSAk1LeSo3Za-eSjZ7x1Ac2AMJNtdegpACLZIWLw6bhRSIBmnn2uLwKSJeFO2UQJK-ZWlUm-pBDTnygBy2sorXXZVck5MrViTLFmHzJkv9wo7MqwnwtVuXcKkjgZ_28m00)" #DiagrammeDeploiement }
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

```{.plantuml caption="Diagramme de déploiement pour iTunes d'Apple, inspiré de [ceci](https://www.uml-diagrams.org/apple-itunes-uml-deployment-diagram-example.html). [(PlantUML)](http://www.plantuml.com/plantuml/uml/ZLF9JkGm4BtxAqhXW3HIWfeZGX6RH1yQEb9wr9UvE4b1MtBiO3k4dX7_FbM91M4Hu9ENUlKMssS-I1VwLWkDTm621QVkTm4QvR0EoXfXR8EGd7UTHjXY1IMwHtG9d9us-AXgpFE3GchSzEwXjyeZ_1D0OuIfJM_GW_Gqsn9YmCghm90LivHIjzP400-Iekva7I8GImnzb-4J4bQI0bLBrfJd8-BvbIY9J6Mm3fE9iFm18PkKvfwi9JVOA0ahLJdfzaaaU1Q7h3njx61IxXdZMDeMuTAsNHyu2-9RNiuJ-SWsuM2i7Qf96bJE3XxTMu1uAsoUuViO3XmsuaiVZBjPBO08MhnsY8OynSYAdJLuf0hP766eiwdsYZXQMobgzQqRjIuZQCrXhyilZNogxFYzie1ySBiGKxKUgnK7u53ulQbtpXhrbtnN60P2HPaUghsOiX9e6k1EudO1MSR-NsR7uf2lwbUQZjjneLEw4q5Jthw24_XTNl3DGzPdEPLGOpxYDtL2HZjdWwsjplC_Plxme8W7r9VQZ2GKpMn5_7JvOwljXrRBpQOGOvOphe4-eaRluNlIC_9DF_a_)" #iTunesDiagrammeDeploiement }
@startuml
left to right direction
node "Apple Web Server" <<device>>#PaleTurquoise {
    node iTunes as iTW <<website>>#LightSalmon {
        artifact iTuneseSetup.exe <<application>>
    }
    node "iTunes Store" as iTS <<website>>#LightSalmon {
        rectangle "Media Library"
    }
}
'iTW -down- iTS
node "Home Computer" as HC <<device>>#LightSalmon {
    node " " as wb <<web browser>>#LightSalmon
    rectangle iTunes as iT <<application>>#red
    rectangle "Media Library" as ML1 #LimeGreen
}
node "iPhone/iPad/etc." as MD <<mobile device>>#LightSalmon {
    node "iOS" as MDOS <<OS>>#LightSalmon
    rectangle "Media Library" as ML2 #LimeGreen
}
note as N1
Media libraries are
synchronized
between devices by
iTunes
end note
N1 .. ML1
N1 .. ML2
' HC *-- ML1
' HC *-l- wb
HC -- MD : USB
'iT .u.> HC
iT -- iTS : <<protocol>>\niTunes Store Protocol
' MD *-- MDOS
' MD *-- ML2
wb -- iTW : <<protocol>>\nHTTP
MDOS -- iTS : <<wireless protocol>>\niTunes Store Protocol
@enduml
```

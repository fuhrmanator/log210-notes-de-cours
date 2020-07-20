# Diagrammes de déploiement et de composants

Ce chapitre contient des informations sur les diagrammes de déploiement et de composants en UML. Les détails se trouvent dans le chapitre F31/A37&nbsp;\faBook&nbsp;du livre du cours.

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
!include ../forme.pumlinclude
'Diagramme du système SGA
Title SGA
node SGA_server {
    database flatfile
}
@enduml
```

![Diagramme de déploiement. [(PlantUML)]()](build/images/DiagrammeDeploiement.pdf){#DiagrammeDeploiement}


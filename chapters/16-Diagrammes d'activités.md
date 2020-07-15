# Diagrammes d'activités

Ce chapitre contient des informations sur les diagrammes d'activités en UML. Les détails se trouvent dans les chapitres 25 (français) et 28 (anglais)&nbsp;\faBook&nbsp;du livre du cours.

> Les diagrammes d'activités servent à modéliser des processus d'affaires (de métier), des enchaînements d'activités (workflows), des flots de données et des algorithmes complexes.

Voici les éléments importants:

- début et fin (activité)
- partition
- action
- nœud d'objet
- débranchement et jointure (parallélisme)
- décision et fusion (exclusion mutuelle)

Pour la modélisation de flot de données, il existe une notation pour les [diagrammes de flots de données (DFD)](https://fr.wikipedia.org/wiki/Diagramme_de_flux_de_donn%C3%A9es)&nbsp;\faWikipediaW&nbsp;. Il ne s'agit pas de l'UML, mais cette notation est encore utilisée (depuis les années 1970). 

Un exemple de diagramme d'activité utilisé dans le cadre du cours de LOG210 est dans la figure&nbsp;\ref{GitHubClassroomActivities}. Ce diagramme qui explique comment GitHub Classrooms permet à l'étudiant qui accepte un devoir (*assignment* en anglais) sur GitHub Classrooms de choisir son identité universitaire, mais seulement si l'enseignant a téléversé la liste de classe *avant* d'envoyer les invitations aux étudiants. 

```{#GitHubClassroomActivitiesSource .puml frame=single caption="Code source PlantUML pour la figure&nbsp;\ref{GitHubClassroomActivities}"}
@startuml
skinparam style strictuml
skinparam backgroundcolor transparent
skinparam DefaultTextAlignment center
title Enchaînement d'activités pour chaque //Classroom// (groupe-cours)
|Enseignant.e|
start
:Créer Classroom;
#ffdddd:Importer liste de classe
(Identifiants Moodle);
:Créer Assignment
(Individual/Team);
:Partager (courriel) l'URL d'invitation;
|#ddffdd|Étudiant.e|
:Open URL;
#ffdddd:Choisir identifiant Moodle;
:Choisir équipe (ou créer équipe);
|GitHub|
:Dupliquer (fork) le dépôt
(au besoin, avec le compte
d'un membre de l'organisation);
stop
@enduml
```


```{.plantuml hide-image=true plantuml-filename=build/images/GitHubClassroomActivity.pdf}
@startuml
skinparam style strictuml
skinparam backgroundcolor transparent
skinparam DefaultTextAlignment center
title Enchaînement d'activités pour chaque //Classroom// (groupe-cours)
|Enseignant.e|
start
:Créer Classroom;
#ffdddd:Importer liste de classe
(Identifiants Moodle);
:Créer Assignment
(Individual/Team);
:Partager (courriel) l'URL d'invitation;
|#ddffdd|Étudiant.e|
:Open URL;
#ffdddd:Choisir identifiant Moodle;
:Choisir équipe (ou créer équipe);
|GitHub|
:Dupliquer (fork) le dépôt
(au besoin, avec le compte
d'un membre de l'organisation);
stop
@enduml
```

![Diagramme d'activités pour les activités séquentielles de GitHub Classrooms.](build/images/GitHubClassroomActivity.pdf){#GitHubClassroomActivities}


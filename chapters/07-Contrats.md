# Contrats d'opération

Les contrats d'opération sont le sujet du chapitre 11&nbsp;\faBook&nbsp;du livre du cours.
Voici les points importants pour le cours:

- Pour simplifier les choses, on ne spécifie pas les préconditions dans les contrats.
- Notez que les postconditions d'un contrat d'opération et d'un cas d'utilisation ne sont pas la même chose.
- Une postconditions décrit les modifications de l'état des objets dans le modèle du domaine après une opération système.
- Le vocabulaire pour les postconditions provient du modèle du domaine.
- Chaque postcondition doit avoir la bonne forme:
  - création (ou suppression) d'instances;
  - modification des valeurs des attributs;
  - formation (ou rupture) d'associations.
- En rédigeant les contrats, il est normal de découvrir dans le modèle du domaine des incohérences ou des éléments manquants.
Il *faut* les corriger (il faut changer le MDD), car cela fait partie d'un processus itératif et évolutif.

## Exemple: Contrats d'opération pour Attaquer un pays

### Attaquer un pays

#### Opération: `démarrerAttaque(paysAttaquant:String, paysDéfenseur:String)`

##### Postconditions

- une nouvelle instance a de Attaque a été créé
- a a été associé au Pays sur une base de correspondance avec paysAttaquant
- a a été associé au Pays sur une base de correspondance avec paysDéfenseur

#### Opération: `annoncerAttaque(nbRégimentsAttaquant:int)`

##### Postconditions

- a.nbAttaquant est devenu nbRégimentsAttaquant

#### Opération: `annoncerDéfense(nbRégimentsDéfendant:int)`

##### Postconditions

- a.nbDéfendant est devenu nbRégimentsDéfendant
- L'attribut valeur des d1 à d5 est devenue un nombre entier aléatoire entre 1 et 6
- Occupation.nbRégiments est ajusté selon le résultat des valeurs sur une base de correspondance avec paysAttaquant.
- Occupation.nbRégiments est ajusté selon le résultat des valeurs sur une base de correspondance avec paysDéfendant.

#### Opération: `terminerAttaque()`

##### Postconditions

- TODO: Handle the change of Occupation?


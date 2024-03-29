# Besoins (exigences)

Un exemple d'une exigence d'un système pourrait être qu'il doit afficher le nombre d'utilisateurs dans un forum de discussion en ligne.
Il s'agit d'une exigence de fonctionnalité.
Si cette information doit être actualisée toutes les 2 secondes, alors il s'agit d'une exigence sur *la qualité de la performance* du système.
Pour les qualités d'un système comme la performance, on peut les appeler *exigences non fonctionnelles*, car elles ne sont pas les fonctionnalités.
Il y a beaucoup d'exemples d'exigences non fonctionnelles, par exemple sur [Wikipedia](https://en.wikipedia.org/wiki/Non-functional_requirement#Examples)\ \faWikipediaW.

![Besoins non fonctionnels?](images/RamasserBesoins.jpg){width="60%"}

## FURPS+

Le chapitre 5\ \faBook\ traite le sujet des besoins et leur évolution.
FURPS+ est un modèle (avec un acronyme) pour classer les exigences (besoins) d'un logiciel. Voici un résumé, mais la section 5.4\ \faBook\ explique en détail:

- **Fonctionnalité** (*Functionality*). Ce sont les exigences exprimées souvent par les cas d'utilisation, par exemple, *Traiter une vente*. La sécurité est aussi considérée dans ce volet.
- **Aptitude à l'utilisation** (*Usability*). Convivialité - les facteurs humains du logiciel, par exemple le nombre de clics que ça prend pour réaliser une fonctionnalité, à quel point une interface est facile à comprendre par un utilisateur, etc.
- **Fiabilité** (*Reliability*). Comment le logiciel doit se comporter lorsqu'il y a des problèmes ou des pannes. 
Par exemple, un traitement texte produit un fichier de sauvegarde de secours, ou une application continue à fonctionner même si le réseau est coupé.
- **Performance** (*Performance*). Comment un logiciel doit se comporter lors d'une charge importante sur le système.
Par exemple, lors de la période d'inscription, Cheminot doit avoir un temps de réponse de moins de 2 secondes.
- **Possibilités de prise en charge** (*Supportability*). Adaptabilité ou maintenabilité - à quel point le logiciel sera facile à modifier face aux changements prévus.
Par exemple, lors d'un changement de lois fiscales, quelles sont les caractéristiques de la conception qui vont faciliter le développement d'une nouvelle version du logiciel.
- **\+** : Comprend toutes les autres choses:
  - **Implémentation**. Par exemple, le projet doit être réalisé avec des langages et des bibliothèques qui ne sont pas payants (logiciel libre).
  - **Interface**. Par exemple, contraintes d'interfaçage avec un système externe.
  - **Exploitation**. Par exemple, utilisation de système d'intégration continue.
  - **Aspects juridiques**. Par exemple, la licence du logiciel, les politiques de confidentialité, etc.

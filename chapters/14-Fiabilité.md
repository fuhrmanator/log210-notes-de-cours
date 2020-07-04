# Fiabilité

Le chapitre A35/F30&nbsp;\faBook&nbsp;du livre du cours présente le problème de la fiabilité pour le système NextGen POS. 
C'est le basculement sur un service local en cas d'échec d'un service distant. 

![Comment tolérer une panne de connexion ou de service?](images/PanneConnexionService.png "Comment tolérer une panne de connexion ou de service?"){width=70% #PanneConnexionService}


Voici les points importants:

- Définitions des termes, A35.3/F30.3&nbsp;\faBook:
  - **Faute.** La cause première du problème
  - **Erreur.** La manifestation de la faute lors de l'exécution. Les erreurs sont détectées (ou non).
  - **Échec.** Déni de service causé par une erreur.
- Les solutions proposées par l'architecte système et documentées par Larman impliquent les concepts suivants:
  - Mise en cache locale d'informations recherchées au service distant, A35.2/F30.2&nbsp;\faBook
  - Utilisation d'*Adaptateur \[GoF\]* pour réaliser le service redondant (lecture d'information), A35.2/F30.2&nbsp;\faBook&nbsp;
  - Réalisation d'un scénario dans le cas d'utilisation pour supporter l'échec de tout (rien ne va plus) en permettant au Caissier de saisir l'information (description et prix), A35.3/F30.3&nbsp;\faBook.
  Dans ce cas, il faut bien gérer les exceptions.
  - Utilisation de *Procuration (Proxy) de redirection \[GoF\]* pour basculer sur un service local en cas de panne (écriture d'information), A35.4/F30.4&nbsp;\faBook

> Faire une conception pour la fiabilité nécessite de l'expérience (ou l'utilisation des patterns). Un bon livre est Hanmer R. *Patterns for Fault Tolerant Software.* 1 edition. Chichester, England ; Hoboken, NJ : Wiley, 2007. 308 p.ISBN : 9780470319796.


> L'utilisation de services dans le nuage (infonuagique) amène une redondance de serveurs. 
> Cependant, même un service web a besoin de [redondance dans les zones géographiques](https://aws.amazon.com/about-aws/global-infrastructure/), car une erreur de configuration ou une crise régionale (ouragan, tremblement de terre) pourrait affecter toute une grappe de serveurs.




# Dette technique {#DetteTechnique}

Ce chapitre contient des informations sur le concept de la [dette technique\faWikipediaW](https://fr.wikipedia.org/wiki/Dette_technique), qui n'est pas un sujet du livre du cours.

Pour rajouter une nouvelle fonctionnalité à un système, les développeurs ont souvent un choix entre deux façons de procéder. La première est facile à mettre en place (le "Hacking cowboy" sur \nameref{SpectreDeLaConception}), mais elle est souvent désordonnée et rendra sûrement plus difficiles des changements au système dans le futur. L'autre est une solution élégante et donc plus difficile à rendre opérationnelle, mais elle facilitera des modifications à venir. Comment prendre la décision? La *dette technique* est une métaphore pour aider à comprendre des conséquences à long terme pour des choix de conception permettant de livrer une fonctionnalité à court terme. 

La dette est une forme de risque qui peut apporter des bénéfices ou des pertes. Tout dépend de la quantité d'intérêt à payer. L'inventeur du wiki, Ward Cunningham (réf), a utilisé la métaphore de la dette dans un projet de développement de logiciel de gestion de portefeuille réalisé dans une variante du langage Smalltalk:

> Un autre piège plus sérieux est l'échec à consolider [un design]. 
> Bien que le code non raffiné puisse fonctionner correctement et être totalement acceptable pour le client, des quantités excessives de ce genre de code rendront le programme impossible à maîtriser, ce qui entraînera une sur-spécialisation des programmeurs et, finalement, un produit inflexible. 
> Livrer du code non raffiné est comme s'endetter. 
> Une petite dette accélère le développement tant qu'elle est remboursée rapidement avec une réécriture. 
> [Le paradigme des] objets rendent le coût de cette transaction tolérable. 
> Le danger survient lorsque la dette n'est pas remboursée. 
> Chaque minute passée sur un code qui n'est pas tout à fait correct compte comme un intérêt sur cette dette. 
> Des organisations entières peuvent être paralysées par l'endettement d'une implémentation non consolidée, orientée objet ou autre.

Comme c'est une métaphore puissante, beaucoup de développeurs l'utilisent et c'est un terme avec une certaine popularité, comme on peut voir à la figure&nbsp;\ref{TechnicalDebtGoogleTrends}. Dans une [vidéo](https://www.youtube.com/watch?v=pqeJFYwnkjE) plus récente, Cunningham a rappelé que la notion originale de la métaphore s'inspire du code qui est incohérent par rapport à un problème complexe plutôt que du code simplement "mal écrit":

> L'explication que j'ai donnée à mon patron, et c'était un logiciel financier, était une analogie financière que j'ai appelée "la métaphore de la dette". Et cela dit que si nous ne parvenions pas à aligner notre programme sur ce que nous considérions alors comme la bonne façon de penser à nos objets financiers, alors nous allions continuellement trébucher sur ce désaccord et cela nous ralentirait, ce qui était comme payer des intérêts sur un prêt.  
> &nbsp;  
> [...]  
> &nbsp;  
> Beaucoup de gens (au moins des blogueurs) ont expliqué la métaphore de la dette et l'ont confondue, je pense, avec l'idée que vous pourriez écrire mal le code avec l'intention de faire du bon travail plus tard et de penser que c'était la principale source de dette. Je ne suis jamais favorable à l'écriture médiocre du code, mais je suis en faveur de l'écriture de code pour refléter votre compréhension actuelle d'un problème, même si cette compréhension est partielle.

Fowler a également [abordé le sujet de la dette](https://martinfowler.com/bliki/TechnicalDebtQuadrant.html), notamment à propos de la distinction entre du code "mal écrit" et les compromis de conception faits avec une intention d'accélérer le développement:

> Je pense que la métaphore de la dette fonctionne bien dans les deux cas - la différence est dans la nature de la dette. Le code mal écrit est une dette imprudente qui se traduit par des paiements d'intérêts paralysants ou une longue période de remboursement du principal. Il y a quelques projets où nous avons pris en charge une base de code avec une dette élevée et avons trouvé la métaphore très utile pour discuter avec la direction de notre client de comment l'aborder.  
> &nbsp;  
> La métaphore de la dette nous rappelle les choix que nous pouvons faire avec les anomalies de conception. La dette prudente qui a permis de compléter une version du logiciel ne vaut peut-être pas la peine d'être remboursée si les paiements d'intérêts sont suffisamment faibles, par exemple si les anomalies sont dans une partie rarement touchée de la base de code.  
> &nbsp;  
> La distinction utile n'est donc pas entre dette ou non-dette, mais entre **dette prudente et imprudente**.  
> &nbsp;  
> [...] Il y a aussi une différence entre la **dette délibérée et involontaire**. L'exemple de la dette prudente est délibéré parce que l'équipe sait qu'elle s'endette et réfléchit donc à la question de savoir si le bénéfice de livrer plus tôt une version du logiciel est supérieur au coût de son remboursement. Une équipe ignorante des pratiques de conception prend sa dette imprudente sans même se rendre compte à quel point elle s'endette.  
> &nbsp;  
> La dette imprudente pourrait aussi être délibérée. Une équipe peut connaître les bonnes pratiques de conception, voire être capable de les mettre en pratique, mais décide finalement d'aller "à la va-vite" parce qu'elle pense qu'elle ne peut pas se permettre le temps nécessaire pour écrire du code propre.

![Tendances Google (trends.google.com) pour le terme "dette technique" (anglais *technical debt*)](images/TechnicalDebtGoogleTrends.pdf){#TechnicalDebtGoogleTrends}

La dette peut être classifiée dans un quadrant comme dans le tableau&nbsp;\ref{tab:DetteQuadrant} proposé par Fowler. Selon lui, la dette dont Ward Cunningham a parlé dans sa vidéo peut être classifiée comme "prudente et involontaire". Fowler remarque que selon son expérience, la dette "imprudente et délibérée" est rarement rentable. 

: Classification de la dette selon Fowler (2009)\label{tab:DetteQuadrant}

Dette | Imprudente | Prudente
:--|:--------|:--------
Délibérée | *On n'a pas le temps pour la conception!* \newline Cette forme de dette est rarement rentable.  |  *Il faut livrer maintenant puis en assumer les conséquences.* \newline Exemple: La dette est due à une partie limitée du code.
Involontaire | *C'est quoi la séparation en couches?* \newline Il s'agit de l'ignorance de bonnes pratiques. | *Maintenant on sait comment on aurait dû le faire.* \newline C'est tenter une solution malgré une compréhension limitée du problème.


# Conception de packages

Le chapitre A36/F29\ \faBook\ contient des directives pour la conception de packages. 
Notez que la notion de package n'existe pas en TypeScript (et Javascript), mais le principe de *namespace* existe.
La section \ref{NamespaceTypeScript} explique quelques pratiques pour la gestion des namespaces en TypeScript.

Les points importants sont les suivants (les détails se trouvent dans le livre):

- La notation UML des diagrammes de package
- Organiser les packages par **cohésion**
- Organiser les packages une **famille d'interface** (convention Java)
- Créer un package par **tâche** et par **groupe de classes instables** (Branches)
- Les packages les plus responsables sont les plus stables
- Factoriser les types indépendants
- Utiliser **fabrique** (factory) pour limiter la dépendance aux packages concrets
- Comment rompre les cycles dans les packages

La figure\ \ref{DiagrammePackage} est un exemple d'un diagramme de package.

```{.plantuml caption="Diagramme de packages (tiré de la figure F12.6\ \faBook). [(PlantUML)](http://www.plantuml.com/plantuml/uml/XPDHRzGm3CVVA-qxM9FGjeT9yC0BcgOXRaE3IKoqZ0V4WqbyhTNKEPoKku7sWVOvziLmji4Ac-wgo4tZN-A_xVGePTGy3g5AFSi25GT8-JAGMMLNF5iJrpTqVQjn5EzYY0fPKPAvIF9MjGEvumGs43eKlrJEcGJcKJAmm6SM7vV9m8S3FSrn3BaWWWF1U-LKzfmsRunhEae4CNUa2KACFRHAU7jOVV4MTWViJUYeP97fSiVUB9PG2EGjgiBhipFuL1z_h2VXuSNplMbA_oj8s1OZwtMUIW_lugY2OIstwfs7sYalybhkdAnKcgR2fYNCEb9bUSNbm2kMjbfO8uhGxPhq1pjAq93hXB-FbBO14zGD71oSnE193m_XLmNs_DbqRf6ip2YE7aDN_w3rpRKRJSJDzIRolXgSC7EKf-YhlwfdSK0MAZfdQsH-g3VAoz7rQHFLu8hIqugg6UpxBnrxJ_9rtwfMsJL-w46WbiINBYN-IV3Id7TBuEpAazht2GSgBNm5p-RtqzqzMo_G7LjLHsRjJ_eD)" #DiagrammePackage }
@startuml
!include ../forme.pumlinclude
allowmixing
package "Services Techniques" as ST <<Folder>> {
    package Persistance <<Folder>> {
    }
    package Sécurité <<Folder>> {
    }
    package Journalisation <<Folder>> {
    }
}
package Domaine as D <<Folder>> {
    package POS <<Folder>> {
    }
    package Stocks <<Folder>> {
    }
    package Taxes <<Folder>> {
    }
}

D -d[hidden]- ST

' skinparam legendfontsize 5
' legend center
' Filename: %filename()
' end legend

@enduml
```

## TypeScript n'a pas de packages {#NamespaceTypeScript}

En effet TypeScript n'a pas de packages comme dans C$\sharp$ ou Java.
Cependant, il y a des pratiques pour organiser logiquement le code et pour éviter les conflits (les collisions) de noms.
La notion de package existe dans Java pour:

  1. **Organiser logiquement le code**: `java.util.List` est un type interface disponible dans la bibliothèque `java.util`)
  2. **Éviter les conflits de nom**: `java.util.List` et `ca.etsmtl.log121.fuhrman.projet2.List` sont dans deux packages différents et peuvent être utilisés dans le même programme.

En TypeScript, on peut atteindre les mêmes objectifs.

### Organisation de code

L'organisation peut être réalisée grâce aux modules avec les mots-clés `export` et `import`. Par exemple:

```javascript
export interface StringValidator {
  isAcceptable(s: string): boolean;
}
```


```typescript
// maClasse.ts
export class MaClasse {
  // définition
}
```

```typescript
// client.ts
import { MaClasse } from 'maClasse'
```


# Local file inclusion

## Exploitation 
Sur l'argument page :

```url
http://192.168.122.55/index.php?page=../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../etc/passwd%00
```

## Resolution

La solution la plus efficace pour éliminer les vulnérabilités d'inclusion de fichiers est d'éviter de transmettre des entrées soumises par l'utilisateur à n'importe quel système de fichiers / API de framework. Si cela n'est pas possible, l'application peut maintenir une liste blanche de fichiers, qui peut être incluse dans la page, puis utiliser un identifiant (par exemple le numéro d'index) pour accéder au fichier sélectionné. Toute demande contenant un identifiant invalide doit être rejetée, de cette façon, il n'y a pas de surface d'attaque pour les utilisateurs malveillants pour manipuler le chemin.

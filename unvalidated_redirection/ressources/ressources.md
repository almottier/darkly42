# Unvalidated redirection

## Exploitation

Sur le bas de page on peux voir les redirections vers twitter - facebook - instagram.
On peux changer ces redirections n inspectant le code de la page ou directement dans l'url puisque la redirection est une requete GET 

Un exemple de redirection vers http://phishing.com :

```url
	http://192.168.122.55/index.php?page=redirect&site=http://phishing.com
```

## Resolution 

Le moyen le plus simple et le plus efficace d'empêcher les redirections vulnérables serait de ne pas laisser l'utilisateur contrôler où votre page les redirige. Si vous devez rediriger l'utilisateur en fonction des URL, au lieu d'utiliser des entrées non fiables, vous devez toujours utiliser un ID qui est résolu en interne vers l'URL respective. Si vous souhaitez que l'utilisateur puisse émettre des redirections, vous devez utiliser une page de redirection qui oblige l'utilisateur à cliquer sur le lien au lieu de simplement les rediriger. Vous devez également vérifier que l'URL commence par http: // ou https: // et également invalider toutes les autres URL pour empêcher l'utilisation d'URI malveillants tels que javascript.

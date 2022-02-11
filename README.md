# My [Oh My Posh](https://ohmyposh.dev/) Themes 
[Oh My Posh](https://ohmyposh.dev/) es un motor de "prompt" personalizado para cualquier shell que tiene la capacidad de ajustar la cadena de "prompt" con una función o variable.

Con las facilidades que brinda el motor de [Oh My Posh](https://ohmyposh.dev/) podemos poner uno de los temas que ellos nos ofrecen o, por el contrario, personalizar nuestro propio tema.

Ahora les enseñaré los pasos para poder instalar un tema personalizado.
## 1. tener instalado [Oh My Posh](https://ohmyposh.dev/)
Para instalar [Oh My Posh](https://ohmyposh.dev/) desde la consola de windows haremos lo especificado en su [documentación oficial](https://ohmyposh.dev/docs/windows)

## 2. Crear Nuestro profile
En este archivo guardaremos las configuraciones que nosotros elijamos. Para esto primero tendremos descargado nuestro tema. En el formato: `mytheme.omp.json`
Una vez tengamos descargado nuestro tema personalizado procederemos a crear el archivo profile:
- Abrir la terminal de windows:
- Ejecutar el siguiente comando:
```shell
> notepad $PROFILE
```
- Una vez abierto el programa procederemos a escribir en él:
```plain
Import-Module oh-my-posh
oh-my-posh --init --shell pwsh --config "~/<ruta del archivo>/mytheme.omp.json" | Invoke-Expression
```
Recuerda que el archivo `$PROFILE` se guarda en la carpeta raíz del usuario, es decir: `C:\Users\<tu usuario>`. Esto quiere decir que, si tu archivo `mytheme.omp.json` se encuentra en `C:\Users\<tu usuario>\Desktop` la ruta para invocar seria: `~/Dsktop/mytheme.omp.json`.
### Si todo a salido bien tu consola deberia tener configurado el tema de tu preferencia.

# Aqui les dejo una imagen y un link directo a mis temas ♥
## [BlackHack Theme](https://github.com/Bryan-Herrera-DEV/My-OhMyPush-Themes/tree/main/themes/BlackHack-Theme)
<img src="https://raw.githubusercontent.com/Bryan-Herrera-DEV/My-OhMyPush-Themes/main/themes/BlackHack-Theme/mytheme.png" width="500">

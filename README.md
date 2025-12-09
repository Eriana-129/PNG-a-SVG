# PNG-a-SVG (sin vectorización)
Este script pretende convertir archivos de extensión PNG a extensión SVG, **pero NO realiza una vectorización real.** Este script solo incrusta la imagen PNG en formato base64 dentro de un archivo SVG, dejando la imagen como un raster, es decir, el resultado es solo un archivo SVG que contiene una imagen PNG.

## Pre-requisitos

1.  Instalar R y RStudio
2.  Instalar las paqueterías:

```{r}
install.packages("rsvg")
install.packages("png")
```

3.  Tener una carpeta con las imágenes .png o .PNG, tomar en cuenta que estas imágenes no llevan fondo, así que antes de ejecutar este script, es mejor quitarles el fondo.
4.  Tener una carpeta donde estarán las imágenes de salida (ya convertidas a .svg)
5.  Descargar o copiar el contenido del script png_a_sbg.R y ejecutar su contenido
6.  El script asume que la carpeta de entrada puede tener varias imágenes, así que no hay un número máximo o mínimo para su ejecución. 

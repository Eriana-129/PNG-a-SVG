# Se deben de instalar los siguientes paquetes:
# install.packages("rsvg")
# install.packages("png")

library(png)
library(rsvg)

# Configuración. El uso de "./" es porque asumó que estas ejecutando el código en un proyecto de R. Si no, usar file.choose() y anotar la ruta de entrada y de salida

entrada <- ""  # Escribir el directorio de entrada, ejemplo: ./img_entrada/
salida <- ""  # Escribir el directorio de salida ejemplo: ./img_salida/

# Listar archivos png/PNG
png_files <- list.files(entrada, pattern = "\\.png$", full.names = TRUE, ignore.case = TRUE)

# Función para convertir png/PNG a SVG. Se deja por default 32 x 32 pixeles, pero se puede modificar
convert_png_to_svg <- function(png_file, salida, size = 32) {
  
  base_name <- tools::file_path_sans_ext(basename(png_file))
  archivo_salida <- file.path(salida, paste0(base_name, ".svg"))
  
  img <- readPNG(png_file)
  
  height <- dim(img)[1]
  width <- dim(img)[2]
  
  # Crear SVG simple con la imagen como base64
  svg_content <- sprintf(
    '<svg xmlns="http://www.w3.org/2000/svg" width="%d" height="%d" viewBox="0 0 %d %d">
      <image width="%d" height="%d" href="data:image/png;base64,%s"/>
    </svg>',
    size, size, width, height, width, height, 
    base64enc::base64encode(png_file)
  )
  
  # Guardar SVG
  writeLines(svg_content, archivo_salida)
  
  return(archivo_salida)
}

# Ciclo for para convertir cada imagen png/PNG a svg
for (png_file in png_files) {
  tryCatch({
    archivo_salida <- convert_png_to_svg(png_file, salida)
  }, error = function(e) {
    stop("Error procesando ", basename(png_file), ": ", e$message)
  })
}

# Hasta este paso todo debió de ejecutarse sin problemas, me ocurrió que un archivo no se convirtió pero mi error fue tener la extensión .PNG, aunque ya con ignore.case = TRUE se solucionó. Aquí dejo un mensaje de apoyo en caso de no saber dónde se guardaron los archivos svg

message("SVGs guardados en: ", salida)

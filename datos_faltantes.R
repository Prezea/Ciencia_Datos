
#----------------------------------------------------
#   BUSQUEDA DE DATOS PERDIDOS CON EL PAQUETE "MICE"
#----------------------------------------------------

#a) Instalacion de paquete con dependencias.
install.packages("mice", dependencies = TRUE)

#b) Se abre libreria
library(mice)

#c) Usamos la funcion md.pattern()
md.pattern(iris)

# d) exportamos el gráfico (azul) y se guarda en la carpeta de R
# que se encuentra en el escritorio.


#-------------------------------------------
# I. Librerias
#-------------------------------------------

library(ggplot2)
library(gridExtra)

#-------------------------------------------
# II. Exportacion de datos
#------------------------------------------

#1.- Se exporta la matriz de datos obtenida del análisis de
#K-vecinos, los datos se encuentran tratados 
#Descarga desde classroom

#2.- Se visualizan los nombres de las columnas.
colnames(BD_penguins)

#3.- Se crea una nueva matriz de datos donde se seleccionan
# de la columnas 2 a la 9.
BD<-BD_penguins[,2:9]


#------------------------------------------
# III. Graficos
#------------------------------------------

# 1.- Grafico de barras____________________


#a) Se crea un vector de colores previo.
color=c("lavenderblush3","darkseagreen")

#b) Se construye la secuencia de comando para generar
#el gráfico dentro del objeto GB.
GB<-ggplot(BD, aes(x=sex))+
    geom_bar(colour= "black", fill=color)+
    ggtitle("Gráfico de barras")+
    xlab("Sexo")+
    ylab("Frecuencias")    
    theme_minimal()

#c) Se visualiza el objeto GB
GB

# 2.- Histograma_________________________________

#a) Se construye la secuencia de comando para generar
#el gráfico dentro del objeto HG.
HG<-ggplot(BD, aes(x=body_mass_g))+
    geom_histogram(col="black", fill="green")+
    ggtitle("Histograma")+
    xlab("Peso del pingüino (gr)")+
    ylab("Frecuencias")+
    theme_classic()

#b) Se visualiza el objeto HG
HG

#3.- Diagrama de dispersión__________________________ 

#a) Se construye la secuencia de comando para generar
#el gráfico dentro del objeto DD.

DD<-ggplot(BD, aes(body_mass_g, flipper_length_mm))+
    geom_point(aes(color=sex))+
    ggtitle("Gráfico de dispersión")+
    xlab("Peso")+
    ylab("Largo de la aleta (mm)")+
    theme_dark()

#b) Se visualiza el objeto DD
DD

#c) Agregar subtítulo al grafico
DD<-ggplot(BD, aes(body_mass_g, flipper_length_mm))+
    geom_point(aes(color=sex))+
    labs(title= "Gráfico de dispersión",
        subtitle= "Relación entre el largo de la aleta, el peso
        y el sexo")+
    xlab("Peso")+
    ylab("Largo de la aleta (mm)")+
    theme_light()
    
#d) Se visualiza el objeto DD
DD


#4.- Boxplot______________________________

#a) Se crea un vector de colores previo.
color=c("lavenderblush3","darkseagreen")

#b) Se construye la secuencia de comando para generar
#el gráfico dentro del objeto BX.
BX<-ggplot(BD, aes(x=sex, y=body_mass_g))+
    geom_boxplot(fill=color)+
    ggtitle("Boxplot")+
    xlab("Sexo")+
    ylab("Peso del pingüino (g)")

#c) Se visualiza el objeto BX
BX

#d) Cambio de orientacion del grafico.
BX<-ggplot(BD, aes(x=sex, y=body_mass_g))+
    geom_boxplot()+
    ggtitle("Boxplot")+
    xlab("Sexo")+
    ylab("Peso del pingüino (g)")+
    coord_flip()

#e) Se visualiza el objeto BX
BX


#5.- Gráfico Radial_____________________

#a) Se crea un vector de colores previo.
colores=c("lavenderblush3","darkseagreen", "dodgerblue3")

#b) Se construye la secuencia de comando para generar
#el gráfico dentro del objeto RG.
RG<-ggplot(BD, aes(x=species))+
    geom_bar(fill=colores, color="black")+
    ggtitle("Gráfico Radial")+
    xlab("Especies")+
    ylab("Frecuencias")+
    coord_polar()+
    theme_bw()

#b) Se visualiza el objeto RG
RG

#-----------------------------------------
#   Presentacion de graficos
#-----------------------------------------

# 2 graficos en una fila y una columna 
grid.arrange(DD, BX, nrow= 1, ncol=2)

# 3 graficos en dos filas y dos columnas
grid.arrange(DD, BX, HG, nrow= 2, ncol=2)

# 4 graficos en dos filas y dos columnas
grid.arrange(GB, HG, DD, BX, nrow= 2, ncol=2)

# 5 graficos en tres filas y dos columnas
grid.arrange( GB, HG, DD, BX, RG, nrow= 3, ncol=2)

# 5 graficos en dos filas y tres columnas
grid.arrange( GB, HG, DD, BX, RG, nrow= 2, ncol=3)


#_____________ RECODIFICACIÓN DE VARIABLES ___________

#---------------------------------------------
# Importación de matriz
#---------------------------------------------

#1.- Lectura de la matriz
BD<-read.csv("BD_penguins.csv")

#2.- Seleccionar las columnas 2 a la 9.
BD1<-BD[,2:9]

#3.- Se obtiene una copia de la matriz
BD2<-BD1


#---------------------------------------------
#  Renombrar variables
#---------------------------------------------

#1.- Visualizacion del nombre de las variables
colnames(BD1)

#2.- Renombrar las variables en orden de las columnas.
names(BD2)= c("Especies","Isla","Largo_pico_mm", "Ancho_pico_mm", 
              "Largo_aleta_mm", "Masa_corporal_g","Sexo", "Año")

#3.- Se vuelven a visualizar Los nombre de las variables
colnames(BD2)

#----------------------------------------------
#   Tratamiento de variables cualitativas
#----------------------------------------------

# 1.- Factor____________________

#) verificar el orden de la variable
str(BD2$Especies)
BD2$Especies

# a) Variable Especie: originalmente está como caracter, pero 
#    se requiere convertido a un factor de 3 niveles. 
BD2$Especies<-factor(BD2$Especies,
                        levels=c("Adelie","Gentoo","Chinstrap"))
                        
# Se verifica que la variable sea un factor.
str(BD2$Especies)


# b) Variable Isla

str(BD2$Isla)
BD2$Isla
BD2$Isla<-factor(BD2$Isla,
                 levels= c("Torgersen","Dream","Biscoe"))

str(BD2$Isla)


# Variable sexo
BD2$Sexo
BD2$Sexo<-factor(BD2$Sexo,
                     levels=c("male","female"),
                     labels=c("Masculino","Femenino"))

str(BD2$Sexo)


# Variable año
BD2$Año
BD2$Año<-factor(BD2$Año,
                 levels=c("2007","2008","2009"))
                 
str(BD2$Año)

summary(BD2)

#Guardar matriz de datos final
BD3<-as.data.frame(BD2)


library(ggplot2)

# Gráfico boxplot de exploración
color=c("lavenderblush3","darkseagreen")
BX<-ggplot(BD3, aes(x=Sexo, y=Ancho_pico_mm))+
    geom_boxplot(fill=color)+
    ggtitle("Boxplot")+
    xlab("Sexo")+
    ylab("Ancho del pico (mm)")
BX

#Gráfico de dispersión
DD<-ggplot(BD3, aes(Masa_corporal_g, Ancho_pico_mm))+
    geom_point(aes(color=Isla))+
    labs(title= "Gráfico de dispersión")+
    xlab("Peso")+
    ylab("Largo de la aleta (mm)")+
    theme_light()
DD

#Guardar la matriz de datos
write.csv(BD3, "BD3_penguins.csv")

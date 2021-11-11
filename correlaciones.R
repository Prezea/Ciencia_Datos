
#_____________ COEFICIENTES DE CORRELACION _______________

#La correlación es la dependencia o relación estadística que 
#guardan las variables entre sí de forma lineal.

# Los valores de correlación van de 0 a 1.

#Interpretación:

# 0 : Las variables no guardan correlación.
# 0.10 - 0.49: Las variables guardan baja correlación
# 0.50 - 0.60: Las variables guardan intermedia correlación.
# 0.70 - 0.80: Las variables guardan buena correlación.
# 0.80 - 0.90: Las variables guardan alta correlación.
# 1: Correlación perfecta, la variable está sobre estimada.

#---------------------------------------------------------
#             LIBRERIAS
#---------------------------------------------------------

library(stats)

#---------------------------------------------------------
#           LECTURA DE LA MATRIZ
#---------------------------------------------------------

#1.- Exportar la matriz.

#2.- Sacar copia de la matriz.
BD3<-BD3_penguins
    

#---------------------------------------------------------
#            PREPARACIÓN DE MATRIZ
#---------------------------------------------------------
# 1.- Seleccionamos las filas de la especie Gentoo
BD3$Especies
gentoo<-BD3[153:276,]

# -----------------------------------------------------
#                   PRUEBA DE NORMALIDAD
# -------------------------------------------------------
#2.- Realizamos la prueba de normalidad de Kolmogorov-Smirnov
lillie.test(gentoo$Largo_pico_mm)

#
# INTERPRETACIÓN

# Ho: La variable tiene distribución normal.
# Ha: La variable tiene una distribución diferente a la normal.

# p-valor >0.05 NO rechazo Ho.
#         <0.05 rechazo Ho.

# El p-valor fue de 0.2989, esto es mayor a 0.05. Por lo tanto, los datos tienen una distribución
# normal.

#---------------------------------------------------------
#            PEARSON PARA 2 VARIABLES
#---------------------------------------------------------
#Se implementa para datos cuantitativos con distribución normal.

# Se parte de la hipótesis: 

# Ho: (p=0) Las variables NO guardan una relación lineal entre ellas.
# Ha: (p=/0) Las variables guardan una relación lineal entre ellas.


# 1) Prueba de hipótesis.
pearson<-cor.test(gentoo$Largo_pico_mm, gentoo$Ancho_pico_mm)
pearson

# 2) Interpretación de resultados

#p-valor >0.05 No rechazar Ho.
#p-valor <0.05 Rechazar Ho.

# El p-valor es de 5.26e-16, 

# Revisar el valor de la correlación


#-------------------------------------------------------
#            PEARSON PARA MUCHAS VARIABLES
#-------------------------------------------------------

library(corrplot)

# 1.- Preparación de la matriz.
# Se seleccionan sólo las variables numéricas.

gentoo2<-gentoo[,4:7]

#2.- Cálculo de la matriz de correlaciones.
cor_group<-round(cor(gentoo2),2)

#3.- Visualización de los resultados.
head(cor_group)

# 4.- Generación del gráfico de forma completa.
corrplot(cor_group, method = c("number"), type="full")

#4.1.- Generación del gráfico del cuadrante inferior
corrplot(cor_group, method = c("number"), type="lower")

#4.2.- Generación del gráfico del cuadrante superior
corrplot(cor_group, method = c("number"), type="upper")

# 5.- Cálculo del p-valor con nivel del confianza de 0.95,
# y alfa=0.05
cor.mtest(gentoo2, conf.level=0.95)

# 6.- Generación del gráfico con diagrama de dispersión, coeficiente
# de correlación, nivel de significancia e histograma.
library(PerformanceAnalytics)

chart.Correlation(gentoo2, histogram = T, method= "pearson", pch=18)
chart.Correlation(gentoo2, histogram = F, method= "pearson", pch=18)


#------------------------------------------------------
#              Rho - Spearman
#------------------------------------------------------

# Se implementa cuando los datos tiene una distribución DIFERENTE
# a la Normal.

# Se parte de la hipótesis:

# Ho: (p=0) Las variables NO guardan una relación lineal entre ellas.
# Ha: (p=/0) Las variables guardan una relación lineal entre ellas.

#-----------------------------------------------------
#                Matriz de datos.
#-----------------------------------------------------

# 1.- Creación de la matriz.

# 1.1.- Generación de calificaciones ficticias para las asignaturas
# de matemáticas, español, historia y geografía.
set.seed(5)
mate<-sample(5:10, size= 45, replace=TRUE)
espa<-sample(5:10, size= 45, replace = TRUE)
hist<-sample(5:10, size= 45, replace= TRUE)
geogr<-sample(5:10, size= 45, replace= TRUE)

# 1.2.- Unir la matriz con las diferentes asignaturas
calif_2<-data.frame(mate, espa, hist, geogr)

# 1.3.- Explorar la matriz calif_2
View(calif_2)
str(calif_2)

# 1.4.- Sacar una copia de la matriz generada.
calif_3<-calif_2


#1.5.- Codificar la matriz de integer a numeric

calif_3$mate<-as.numeric(calif_3$mate)
calif_3$espa<-as.numeric(calif_3$espa)
calif_3$hist<-as.numeric(calif_3$hist)
calif_3$geogr<-as.numeric(calif_3$geogr)

# 1.6.- Verificación de los cambios 
View(calif_3)
str(calif_3)

#----------------------------------------------------
#           Prueba de Normalidad
#----------------------------------------------------
shapiro.test(calif_3$mate)
shapiro.test(calif_3$espa)


#----------------------------------------------------
#            Rho de Spearman para 2 variables
#----------------------------------------------------

#1.- Realizar el cálculo de Rho.
spearman<-cor.test(calif_3$mate,calif_3$espa, method = "spearman")

#2.- Visualizar el resultado
spearman

#3.- Interpretación de los resultados (Anota la interpretación)
#Se obtuvo una Rho de 0.1884, lo que significa que las variables no guardan
#correlación lineal.


#----------------------------------------------------
#            Rho de Spearman para muchas variables
#----------------------------------------------------



# 2.- Generación del gráfico de dispersión, histograma, correlaciones 
# y significancia. 

chart.Correlation(calif_3, histogram = T, method= "spearman", pch=18)





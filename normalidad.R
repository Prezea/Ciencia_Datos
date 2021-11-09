
#_____________ PRUEBAS DE NORMALIDAD_______________

library(stats)
install.packages("nortest")
library(nortest)

#--------------------------------------------------
#             Importación de matriz
#-------------------------------------------------

#1.- Lectura de la matriz
BD3<-read.csv("BD3_penguins.csv")

#2.- Determinar el número de observaciones.
length(BD3$Largo_pico_mm)

# 3.- Visualización de la distribución de la variable
hist(BD3$Largo_pico_mm)

#-------------------------------------------------
#           Creación de matriz <50
#-------------------------------------------------
# Variable: Masa_corporal_g

#1.- visualizamos el nombre de las variables para identificar
# el número de la columna.
colnames(BD3)

#2.- Se seleccionan de las filas 4 a la 36 y la columna 6.
peso<-BD3[4:36,6]

#3.- Se visualiza la variable
peso

#--------------------------------------------------
#               KOLMOGOROV-SMIRNOV 
#--------------------------------------------------

# NOTA: Se aplica sí tenemos MÁS de 50 observaciones.

# Ho: La variable tiene distribución normal.
# Ha: La variable tiene una distribución diferente a la normal.

# Interpretación: 
# p-valor >0.05 NO rechazo Ho.
#         <0.05 rechazo Ho.

#1.- Exploración de la variable
hist(BD3$Largo_pico_mm)

# 2.- Aplicación de la prueba de hipótesis
lillie.test(BD3$Largo_pico_mm)

# 3.- Intepretación:
#p-valo= 0.0002714, es menor a 0.05. Por lo tanto, RECHAZO Ho.
# Los datos siguen una distribución diferente a la normal.

#--------------------------------------------------
#                  SHAPIRO WILKS
#--------------------------------------------------

# NOTA: Se aplica sí tenemos MENOS de 50 observaciones.

# Ho: La variable tiene distribución normal.
# Ha: La variable tiene una distribución diferente a la normal.

# Interpretación: 
# p-valor >0.05 NO rechazo Ho.
#         <0.05 rechazo Ho.

# 1.- Exploración de la variable
hist(peso)

# 2.- Prueba de hipótesis
shapiro.test(peso)

#3.- Interpretación:
#p-valor: 0.4668, es mayor que 0.05. Por lo tanto, NO se rechaza Ho, 
#eso quiere decir que los datos siguen una distribución normal.

#-----------------------------------------------
#                EJERCICIO
#-----------------------------------------------

#1.- Lectura de datos
datos<-datasets::rivers

#Si requieres información adicional sobre la matriz,
#utiliza el comando de ayuda.
?rivers


#2.- Anota el comando y responder las preguntas

#a) Genera el histograma.

#b) ¿Cuántas observaciones tiene la matriz de datos "rivers"?

#c) ¿Qué prueba de normalidad vas a emplear?

#d) Realiza la prueba de normalidad.

#e) Anota la interpretación.



lillie.test(BD3$Largo_aleta_mm)



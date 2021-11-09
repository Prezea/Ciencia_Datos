
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
#            PREPARACIÓN DE MATRIZ
#---------------------------------------------------------
# 1.- Seleccionamos las filas de la especie Gentoo
BD3$Especies
gentoo<-BD3[153:276,]

#2.- Realizamos la prueba de normalidad de Kolmogorov-Smirnov
lillie.test(gentoo$Largo_pico_mm)

#3.- Interpretación:

# Ho: La variable tiene distribución normal.
# Ha: La variable tiene una distribución diferente a la normal.

# p-valor >0.05 NO rechazo Ho.
#         <0.05 rechazo Ho.

# El p-valor fue de 0.2989, esto es mayor a 0.05. Por lo tanto, los datos tienen una distribución
# normal.

#---------------------------------------------------------
#            PEARSON
#---------------------------------------------------------
#Se implementa para datos cuantitativos con distribución normal.

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



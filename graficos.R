#-------------------------------------------
# I. Librerias
#-------------------------------------------

library(ggplot2)


#--------------------------------------
# II. Graficos
#------------------------------------------

# 1.- Grafico de barras
color=c("lavenderblush3","darkseagreen")

ggplot(BD1, aes(x=sex))+
    geom_bar(colour= "black", fill=color)+
    labs(x="Sexo", y="Frecuencia")+
    theme_minimal()

# 2.- Histograma
ggplot(data=BD1)+
    geom_bar(mapping = aes(x=body_mass_g, fill=body_mass_g))+
    ggtitle("Histograma")+
    xlab("Peso del pingüino (gr)")+
    ylab("número de pingüinos")

#3.- Diagrama de dispersión 
DD<-ggplot(BD1, aes(body_mass_g, flipper_length_mm))+
    geom_point()+
    ggtitle("Gráfico de dispersión")+
    xlab("Peso")+
    ylab("Largo de la aleta (mm)")

DD

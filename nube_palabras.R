
#_________ NUBE DE PALABRAS _______________

library(NLP)
library(tm)
library(ggplot2)
library(ggwordcloud)

#------------------------------------------------
#    Preparación del texto
#------------------------------------------------

# 1.- lectura del archivo de texto
texto<-readLines(file.choose(),encoding = "UTF-8")
texto<-inconv(texto,from="UTF-8", to="latin1")

# 2.- Creacion del corpus
corpus<-Corpus(VectorSource(texto))

# 3.- Convertir todo a minusculas
mi_corpus<-tm_map(corpus, tolower)

# 4.- Eliminar espacios en blanco (saltos de linea)
mi_corpus<-tm_map(mi_corpus, stripWhitespace)

# 5.- Eliminar signos de puntuacion
mi_corpus<-tm_map(mi_corpus, removePunctuation)

# 6.- Eliminar numeros
mi_corpus<-tm_map(mi_corpus, removeNumbers)

# 7.- Eliminar palabras genericas
mi_corpus<-tm_map(mi_corpus, removeWords, stopwords("spanish"))

# 7.1.- Eliminar palabras genericas de forma personal (opcional)
mi_corpus<-tm_map(mi_corpus, removeWords, c("hola", "adios"))

#----------------------------------------------------------
#   Preparación del texto para el gráfico de nube
#----------------------------------------------------------

# 1.- Conversión del texto
palabras<-TermDocumentMatrix(mi_corpus)

# Nota: Si se quieres visualizar la matriz
palabras<-as.matrix(palabras)
View(palabra)

#2.- Frecuencia de palabras
rowSums(palabra)
View(rowSums(palabra))

#2.1.- Ordenar las palabras de mayor a menor
sort(rowSums(palabra), decreasing = TRUE)

# Nota: Visualizacion en tabla de las palabras mas frecuentes
View(sort(rowSums(palabra), decreasing = TRUE))

#3.- Creacion del objeto "palabras" con la tabla de frecuencias
palabras<-sort(rowSums(palabra), decreasing = TRUE)

# 4.- Creacion de un data frame con la variable frecuencia
df<-data.frame(palabras=names(palabras), freq=palabras)

#-------------------------------------------------------
#         Creacion de graficos
#-------------------------------------------------------

# 1.- BARPLOT 
# Grafica las primeras 10 palabras de la variable frecuencias
# la funcion "names.arg" toma el nombre de la columna el nombre de la palabra
barplot(df[1:10,]$freq, 
        names.arg=df$palabras,
        col="lightblue",
        main="palabras más frecuentes",
        ylab="Frecuencias")

# Filtrado de palabras con frecuencia mayor a 3
sub_df<-df[df$freq>=3,]



# 2.- NUBE DE PALABRAS------------------------------

#2.1.- Muestra los intervalos para colorear palabras
sort(unique(sub_df$freq))

#2.3.- Identificacion de intervalos
c(0, sort(unique(sub_df$freq)))

#2.4.- asignacion de intervalo y su color correspondiente
sub_df$colores<-cut(sub_df$freq,
                    breaks=c(0, sort(unique(sub_df$freq))),
                    labels=unique(sub_df$freq))

# Visualizacion del data frame
View(sub_df)

#2.5.- Orientacion de las palabras
# Elige numeros aleatorios entre 0, 60, 90 (angulo de la palabra) 
# tantas veces como el numero de filas con reemplazo
set.seed(2021)
sub_df$angulo<-sample(c(0,60,90),nrow(sub_df), replace=TRUE)

# Nota: si la primera palabra se le asignan 90o de forma aleatoria, 
# se recomienda cambiar la orientacion a horizontal de forma manual, para
# mejor distribucion del grafico
sub_df$angulo[1]<-0
View(sub_df)

# 2.6.- Creacion del grafico
names(sub_df)

set.seed(2021)
ggplot(sub_df, aes(label= palabra, 
                   size= freq,
                   color= colores,
                   angle= angulo))+
  geom_text_wordcloud()

#2.7.- Mejorar la estetica
set.seed(2021)
ggplot(sub_df, aes(label= palabra, 
                   size= freq,
                   color= colores,
                   angle= angulo))+
  geom_text_wordcloud()+
  scale_size_area(max_size = 15)+
  theme_minimal()


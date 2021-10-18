
install.packages("VIM", dependencies = TRUE)
library(VIM)

install.packages("palmerpenguins")
library(palmerpenguins)

BD<-penguins
summary(BD)

BD1<-kNN(BD)
summary(BD1)
str(BD1)

write.csv(BD1, file = "BD1.csv")


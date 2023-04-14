## Instala un paquete llamado “datos” y carga el dataframe “millas”.
#install.packages("datos")
library(datos)
library(ggplot2)

### Sobre el dataset de millas...
millas <- datos::millas
millas
head(millas)
colnames(millas)
str(millas)
summary(millas)
summary(millas$cilindrada)

# Vemos el número de vehículos por cilindrada
ggplot(millas, aes(x=cilindrada)) +
  geom_bar()

# Vemos el número de vehículos por transmisión
ggplot(millas, aes(x=millas$transmision)) +
  geom_bar()

# Vemos el reparto de cilindrada por transmisión
ggplot(millas, aes(x=millas$transmision, y=millas$cilindrada)) +
  geom_point()

sd(millas$transmision)
ggplot(millas, aes(x=millas$transmision, y=millas$cilindrada)) +
  geom_boxplot()

### Sobre el dataset de flores...
iris <- datos::flores
head(iris)
summary(iris)

####################
## General
####################
# Facetas
# Distribución del largo y ancho de los sépalos de las flores por especies
ggplot(iris, aes(x=iris$Largo.Sepalo, y=iris$Ancho.Sepalo)) + 
  geom_point() + geom_smooth() +
  facet_grid(~ iris$Especie)

ggplot(iris, aes(x=iris$Largo.Sepalo, y=iris$Ancho.Sepalo)) + 
  geom_point() + geom_smooth() +
  facet_grid(iris$Especie ~.)

# Temas
p <- ggplot(iris, aes(x=iris$Largo.Sepalo, y=iris$Ancho.Sepalo, colour=iris$Especie))
p + geom_point() + geom_smooth() + facet_grid(iris$Especie ~.)

# Comando theme
p <- ggplot(iris, aes(x=iris$Largo.Sepalo, y=iris$Ancho.Sepalo, colour=iris$Especie))
p + geom_point() + geom_smooth() + facet_grid(iris$Especie ~.) + 
  theme_bw() + theme(
    panel.background = element_rect(fill="lightblue"),
    panel.grid.minor = element_line(linetype = "dotted")
  )

# Guardar imágenes
ggsave(filename = "./Graficas/graphic_r.png", plot = p)

# Nubes de puntos
p <- ggplot(iris, aes(x=iris$Largo.Sepalo, y=iris$Ancho.Sepalo, colour=iris$Especie)) 
p + geom_point()

# Curvas suavizadas
p <- ggplot(iris, aes(x=iris$Largo.Sepalo, y=iris$Ancho.Sepalo, colour=iris$Especie))
p + geom_smooth() + geom_point()

# Diagrama de cajas 1
p <- ggplot(iris, aes(x=iris$Largo.Sepalo, y=iris$Ancho.Sepalo, colour=iris$Especie))
p + geom_boxplot()

# Diagrama de cajas 2
p <- ggplot(iris, aes(x=iris$Largo.Sepalo, y=iris$Ancho.Sepalo, colour=iris$Especie))
p + geom_violin()

# Diagrama de barras
p <- ggplot(iris, aes(x=iris$Largo.Sepalo, colour=iris$Especie))
p + geom_bar()

# Densidades 1
p <- ggplot(iris, aes(x=iris$Largo.Sepalo, colour=iris$Especie))
p + geom_density() + facet_grid(iris$Especie ~.)

# Densidades 2
p <- ggplot(iris, aes(x=iris$Largo.Sepalo, fill=iris$Especie))
p + geom_density(alpha=0.4)

# Series temporales
df <- data.frame(dose=c("D0.5", "D1", "D2"), len=c(4.2, 10, 29.5))
p <- ggplot(df, aes(x=dose, y=len, group=1))
p + geom_line() + geom_point()

#########################
## Geom_point
#########################
# Tipos de puntos 1
p <- ggplot(iris, aes(x=iris$Largo.Sepalo, y=iris$Ancho.Sepalo))
p + geom_point()

# Tipos de puntos 2
p <- ggplot(iris, aes(x=iris$Largo.Sepalo, y=iris$Ancho.Sepalo))
p + geom_point(shape=23, fill="blue", color="darkred", size=3)

# Diferencias de estilos por variable
p <- ggplot(iris, aes(x=iris$Largo.Sepalo, y=iris$Ancho.Sepalo, group=iris$Especie))
p + geom_point(aes(shape=iris$Especie))

# Diferencias de estilos por variable con color
p <- ggplot(iris, aes(x=iris$Largo.Sepalo, y=iris$Ancho.Sepalo, group=iris$Especie))
p + geom_point(aes(shape=iris$Especie, colour=iris$Especie))

# Ajustar estilos manualmente
p <- ggplot(iris, aes(x=iris$Largo.Sepalo, y=iris$Ancho.Sepalo, group=iris$Especie))
p + geom_point(aes(shape=iris$Especie, colour=iris$Especie)) + 
  scale_shape_manual(values=c(3,16,17)) +
  scale_color_manual(values=c('#999999', '#E69F00', '#56B4E9'))+
  scale_size_manual(values=c(4,5,6))+
  theme(legend.position = "top")

######################
## Geom_line
#####################
df <- data.frame(dose=c("D0.5", "D1", "D2"), len=c(4.2, 10, 29.5))
p <- ggplot(df, aes(x=dose, y=len, group=1))
p + geom_line() + geom_point()

# Cambio tipo de línea
df <- data.frame(dose=c("D0.5", "D1", "D2"), len=c(4.2, 10, 29.5))
p <- ggplot(df, aes(x=dose, y=len, group=1))
p + geom_line(linetype="dashed") + geom_point()

# Cambio de color
df <- data.frame(dose=c("D0.5", "D1", "D2"), len=c(4.2, 10, 29.5))
p <- ggplot(df, aes(x=dose, y=len, group=1))
p + geom_line(color="red") + geom_point()

# Añadir puntas a la flecha 1
library(grid)
df <- data.frame(dose=c("D0.5", "D1", "D2"), len=c(4.2, 10, 29.5))
p <- ggplot(df, aes(x=dose, y=len, group=1))
p + geom_line(color="red", arrow=arrow()) + geom_point()

# Añadir puntas a la flecha 2
library(grid)
df <- data.frame(dose=c("D0.5", "D1", "D2"), len=c(4.2, 10, 29.5))
p <- ggplot(df, aes(x=dose, y=len, group=1))
p + geom_line(color="red", arrow=arrow(ends="both", type="closed")) + geom_point()

# Geom_step
df <- data.frame(dose=c("D0.5", "D1", "D2"), len=c(4.2, 10, 29.5))
p <- ggplot(df, aes(x=dose, y=len, group=1))
p + geom_step(color="red", linetype="dashed") + geom_point()

# Geom_path
df <- data.frame(dose=c("D0.5", "D1", "D2"), len=c(4.2, 10, 29.5))
p <- ggplot(df, aes(x=dose, y=len, group=1))
p + geom_path(color="red", linetype="dashed") + geom_point()

# Lineas por grupos 1
df2 <- data.frame(supp=rep(c("VC", "OJ"), each=3),
                  dose=rep(c("D0.5", "D1", "D2"), 2),
                  len=c(6.8, 15, 33, 4.2, 10, 29.5))
df2
p <- ggplot(df2, aes(x=dose, y=len, group=supp))
p + geom_line(color="red") + geom_point()

# Lineas por grupos 2
df2 <- data.frame(supp=rep(c("VC", "OJ"), each=3),
                  dose=rep(c("D0.5", "D1", "D2"), 2),
                  len=c(6.8, 15, 33, 4.2, 10, 29.5))
df2
p <- ggplot(df2, aes(x=dose, y=len, group=supp))
p + geom_line(aes(color=supp, linetype=supp)) + geom_point()

# Forma y color de la línea manualmente
df2 <- data.frame(supp=rep(c("VC", "OJ"), each=3),
                  dose=rep(c("D0.5", "D1", "D2"), 2),
                  len=c(6.8, 15, 33, 4.2, 10, 29.5))
df2
p <- ggplot(df2, aes(x=dose, y=len, group=supp))
p + geom_line(aes(linetype=supp)) + 
  geom_point() +
  scale_linetype_manual(values=c("twodash", "dotted"))

# Barras de errores
df2 <- data.frame(supp=rep(c("VC", "OJ"), each=3),
                  dose=rep(c("D0.5", "D1", "D2"), 2),
                  len=c(6.8, 15, 33, 4.2, 10, 29.5))
std <- sd(df2$len)
p <- ggplot(df2, aes(x=dose, y=len, group=supp))
p + geom_errorbar(aes(ymin=len - std, ymax=len + std, color=supp))+
  geom_line(aes(linetype=supp, color=supp)) + 
  geom_point() + 
  scale_linetype_manual(values=c("twodash", "dotted"))

######################
## Geom_bar
#####################
df <- data.frame(dose=c("D0.5", "D1", "D2"), len=c(4.2, 10, 29.5))
p <- ggplot(df, aes(x=dose, y=len))
p + geom_bar(stat='identity')

# Girar gráfico
df <- data.frame(dose=c("D0.5", "D1", "D2"), len=c(4.2, 10, 29.5))
p <- ggplot(df, aes(x=dose, y=len))
p + geom_bar(stat='identity') + coord_flip()

# Modificar estética
df <- data.frame(dose=c("D0.5", "D1", "D2"), len=c(4.2, 10, 29.5))
p <- ggplot(df, aes(x=dose, y=len))
p + geom_bar(stat='identity', color='blue', fill='white', width=0.4)

# Seleccionar columnas a mostrar
df <- data.frame(dose=c("D0.5", "D1", "D2"), len=c(4.2, 10, 29.5))
p <- ggplot(df, aes(x=dose, y=len))
p + geom_bar(stat='identity', color='blue', fill='white', width=0.4) +
  scale_x_discrete(limits=c("D0.5", "D2"))

# Cambiar color de las barras en función de la variable
df <- data.frame(dose=c("D0.5", "D1", "D2"), len=c(4.2, 10, 29.5))
p <- ggplot(df, aes(x=dose, y=len, color=dose))
p + geom_bar(stat='identity', fill='white')

# Cambiar el relleno 1
df <- data.frame(dose=c("D0.5", "D1", "D2"), len=c(4.2, 10, 29.5))
p <- ggplot(df, aes(x=dose, y=len, fill=dose))
p + geom_bar(stat='identity', color='red')

# Cambiar el relleno 2
df <- data.frame(dose=c("D0.5", "D1", "D2"), len=c(4.2, 10, 29.5))
p <- ggplot(df, aes(x=dose, y=len, fill=dose, color=dose))
p + geom_bar(stat='identity')

# Añadir valores en las barras 1
df <- data.frame(dose=c("D0.5", "D1", "D2"), len=c(4.2, 10, 29.5))
p <- ggplot(df, aes(x=dose, y=len, fill=dose, color=dose))
p + geom_bar(stat='identity') + geom_text(aes(label=len), vjust=-0.3, size=3.5)

# Añadir valores en las barras 2
df <- data.frame(dose=c("D0.5", "D1", "D2"), len=c(4.2, 10, 29.5))
p <- ggplot(df, aes(x=dose, y=len, fill=dose, color=dose))
p + geom_bar(stat='identity') + geom_text(aes(label=len), vjust= 2.3, size=3.5, color='white')

# Barras combinadas 1
df2 <- data.frame(supp=rep(c("VC", "OJ"), each=3),
                  dose=rep(c("D0.5", "D1", "D2"), 2),
                  len=c(6.8, 15, 33, 4.2, 10, 29.5))
p <- ggplot(df2, aes(x=dose, y=len, fill=supp))
p + geom_bar(stat='identity') + geom_text(aes(label=len), vjust=-0.3, 
                                          color='white', position=position_dodge(0.9), size=3.5)

# Barras combinadas 2
df2 <- data.frame(supp=rep(c("VC", "OJ"), each=3),
                  dose=rep(c("D0.5", "D1", "D2"), 2),
                  len=c(6.8, 15, 33, 4.2, 10, 29.5))
p <- ggplot(df2, aes(x=dose, y=len, fill=supp))
p + geom_bar(stat='identity', position=position_dodge())

############################
# Geom_boxplot
############################
p <- ggplot(iris, aes(x=iris$Especie, y=iris$Ancho.Sepalo))
p + geom_boxplot()

# Cambiar estética de las cajas
p <- ggplot(iris, aes(x=iris$Especie, y=iris$Ancho.Sepalo, color=iris$Especie, fill=iris$Especie))
p + geom_boxplot()

# Cambiar estética de los outliers
p <- ggplot(iris, aes(x=iris$Especie, y=iris$Ancho.Sepalo))
p + geom_boxplot(outlier.colour = "red", outlier.shape = 8, outlier.size = 4)

# Incluir puntos en la gráfica 1
p <- ggplot(iris, aes(x=iris$Especie, y=iris$Ancho.Sepalo, color=iris$Especie))
p + geom_boxplot() + geom_dotplot(binaxis='y', stackdir = 'center', dotsize=1)

# Incluir puntos en la gráfica 2
p <- ggplot(iris, aes(x=iris$Especie, y=iris$Ancho.Sepalo, color=iris$Especie))
p + geom_boxplot() + geom_jitter(shape=16, position=position_jitter(0.2))


############################
# Geom_density
############################

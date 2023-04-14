# Asignar variables
x <- 10
x

# Tipos de datos
entero <- 4
real <- 4.5
complejos <- 3+2i

booleano1 <- 2<3
booleano2 <- !(3!=2)
booleano3 <- isTRUE(3>2)
booleano3

nombre <- "Ramon"
direccion <- "Calle Alcalá 16"

# Conocer tipo de dato
class(entero)
class(real)
class(complejos)
class(booleano1)
class(nombre)

# Cambiar tipo de dato
x <- 0:3
x
class(x)
as.numeric(x)
as.logical(x)
as.character(x)

##########################################
### Ejercicio 1 - Inicio
##########################################
## Crear dos variables, x e y, y asignarle un valor numérico
x <- 3.5
y <- 2
x
y

## Crear una variable nueva que sea:
# La resta de ambos valores
resta <- x - y
resta

# La suma de ambos valores
suma <- x + y
suma

# El producto de ambos valores
prod <- x*y
prod

# La división entera de ambos valores
div_ent <- x%/%y
div_ent

## Consultar el valor y el tipo de dato de las variables creadas 
class(x)
class(y)
class(resta)
class(suma)
class(prod)
class(div_ent)

## Convertir alguna de las variables anteriormente creadas a:
# Cadena de texto
as.character(div_ent)

# Valor booleano
as.logical(div_ent)
as.logical(0)

## Crear una variable DNI con el número de tu DNI como cadena de texto
dni <- "12345678"

## Convertir la variable DNI a número entero
dni_num <- as.numeric(dni)
dni_num

## Obtener el módulo 23 de la variable DNI como número entero
mod_23_dni <- dni_num %% 23
mod_23_dni # 14 == Z

##########################################
### Ejercicio 1 - Fin
##########################################

# Vectores
x <- 1:20
x
x <- 1:200
x
x <- seq(from=1, to=100, by=2)
x
x <- c(1,2,3,4,5)
x

y <- c("A", "B", "C", "D")
y
y <- c("Alberto", "Daniel", "Rafael")
y

z <- c(TRUE,FALSE,TRUE,FALSE)
z

t <- rep("ESTE", 10)
t

longitud_x <- length(x)
longitud_x

longitud_y <- length(y)
longitud_y

longitud_z <- length(z)
longitud_z

# Operaciones sobre vectores
x <- 10:5
x
x+1
x <- x-3
x == 2
x >= 3

# Acceso a datos del vector
x[20]

# Eliminar datos de un vector
x[-7]

# Acceso a sub-vector
x[2:4]

# Acceso a datos del vector por máscara
x <- c(1,2,3,4,5,77,83,99)
y <- c(T,T,F,T,F,T,T,T)
x[y]

# Reemplazar elementos
x <- 1:10
x[1] <- 25
x

# Ordenar vector
x <- c(25,21,7,42,356,12,9,90,1,5,23)
sort(x)
sort(x, decreasing=TRUE)

# Elementos especiales de un vector
x <- c(1,0/0,NA)
x
is.na(x)
is.nan(x)
bad <- is.nan(x)
x[!bad]
na_val <- is.na(x)
x[!na_val]


##########################################
### Ejercicio 2 - Inicio
##########################################
## Crear un vector con los números del 1 al 10 de tres formas diferentes
forma_1 <- c(1,2,3,4,5,6,7,8,9,10)
forma_2 <- 1:10
forma_3 <- seq(from=1, to=10, by=1)
forma_1
forma_2
forma_3

## Crear un vector llamado PARES con los números pares del 0 al 100 (considerando el 0 como elemento par)
pares <- seq(from=0, to=100, by=2)
pares

## A partir del vector PARES obtener aplicando  la suma el vector de los números impares del 1 al 101 y llámalo IMPARES
impares <- pares+1
impares

## Comprueba que ambos vectores tienen el mismo tamaño
length(pares)
length(impares)
iguales <- length(pares) == length(impares)
iguales

## Comprueba que los dos vectores son disjuntos, esto es, no tienen elementos en común
disjuntos <- intersect(pares, impares)
disjuntos
length(disjuntos)

disjuntos <- intersect(pares, pares)
disjuntos
length(disjuntos)

## Une los vectores PARES e IMPARES en un nuevo vector ENTEROS, ordénalo y genera 
## un nuevo vector MOD_2 con el módulo 2 de los elementos del vector
enteros <- union(pares, impares)
enteros
enteros <- sort(enteros)
enteros
mod_2 <- enteros%%2
mod_2

## Obtén un nuevo vector DIVISION_2 dividiendo el vector ENTEROS con el vector MOD_2.
division_2 <- enteros/mod_2
division_2

## Filtra los valores no nulos de DIVISION_2 y ordénalos de forma decreciente
nulos <- is.na(division_2)
nulos
no_nulos <- division_2[!nulos]
no_nulos
no_nulos <- sort(no_nulos, decreasing = T)
no_nulos

##########################################
### Ejercicio 2 - Fin
##########################################

## Listas y factores
lista <- list(1,"t", T, 1+4i)
lista
class(lista)

## Acceso a elementos de la lista
l <- list(1:3, c("a", "b", "c"))
l[[1]]
l[[2]]
l[[c(1,2)]] # 2, (1,2,3,a,b,c), ayb
l[[c(2,2)]]
l[[c(2,4)]] # No existe

## Acceso a lista con nombres
l <- list("Pos_1"=1:3, "Pos_2"=c("a","b"))
l$Pos_1
l$Pos_2
l$Pos_2[2]

# Convertir lista a vector
l <- list(1:3, 5:8)
l
unlist(l)
l <- list(1:3, c("a", "b"))
unlist(l)
l <- list(matrix(c(1,2,3,4), nrow = 2, ncol = 2), c("a", "b"))
unlist(l)
l <- list(matrix(c(1,2,3,4), nrow = 2, ncol = 2), c("a", "b"), TRUE)
unlist(l)

# Factores
numeros <- c(rep(1,2), rep(2,5), rep(3,5), rep(4,10))
numeros
fnumeros <- factor(numeros)
fnumeros

##########################################
### Ejercicio 3 - Inicio
##########################################
## Crea una lista con elementos de tipo lógico, numérico y carácter.
lista <- list(1,2,T,"listado")
lista

## Crea una lista igual que la anterior pero definiendo un nombre para cada uno de los elementos
lista <- list("Numero_1"=1,"Numero_2"=2,"Logico"=T,"Caracter"="listado")
lista

## Extrae uno de los elementos de la lista por su nombre
lista$Numero_1
lista$Numero_2
lista$Logico
lista$Caracter

## Elimina los nombres de la lista
lista
unname(lista)

## Convierte la lista a un vector
vector <- unlist(lista)
vector
vector <- unlist(unname(lista))
vector

## Con el vector anterior genera un factor
factor <- factor(vector)
factor
##########################################
### Ejercicio 3 - Fin
##########################################

# Dataframes
nombre <- c("Carlos", "Ana", "Lucas", "Maria")
edad <- c(18, 22, 19, 32)
trabajo <- c(T,F,T,F)
curso_actual <- c("Primero", "Primero", "Segundo", "Cuarto")
df <- data.frame(nombre, edad, trabajo, curso_actual)
df

# Información del dataframe
names(df)
row.names(df)

# Acceso a elementos del dataframe
df$nombre
df$nombre[2]
df$nombre[c(1,3)]

df["nombre"]
df[c("nombre", "edad")]
df[c(1,3)]
df[1:3,]
df[1:3,c("nombre", "edad")] # 
df[c(T,T,F,T)] # c(T,T,F,T) ->
df[c(T,T,F,T),]
df[c(T,T,F,T),c(T,F,T,T)]
df[df$edad<20,]
df
df[df$edad<20 & df$curso_actual=="Primero",]

# Crear y borrar columnas del dataframe
df$ciudad <- c("Madrid", "Sevilla", "Madrid", "Barcelona")
df
df$curso_actual <- NULL
df
rm(df)
df

nombre <- c("Carlos", "Ana", "Lucas", "Maria")
edad <- c(18, 22, 19, 32)
trabajo <- c(T,F,T,F)
curso_actual <- c("Primero", "Primero", "Segundo", "Cuarto")
df <- data.frame(nombre, edad, trabajo, curso_actual)
df

df_linea <- data.frame(nombre="Daniel", edad="25", trabajo=FALSE, curso_actual="Cuarto")
df_linea
df <- rbind(df, df_linea)
df

df <- rbind(df_linea, df)
df

df_linea <- data.frame(edad="25", nombre="Daniel", trabajo=FALSE, curso_actual="Cuarto")
df <- rbind(df_linea, df)
df

##########################################
### Ejercicio 4 - Inicio
##########################################
## Crea un dataframe con los siguiente valores:
nombre <- c("Lucía", "Antonio", "Juan", "María", "Pedro")
edad <- c(23,34,56,65,22)
suscrito <- c(T,F,F,T,F)
df <- data.frame(nombre, edad, suscrito)
df
## Añade una nueva columna llamada Antigüedad con los valores 1,5,4,3 y 6
antiguedad <- c(1,5,4,3,6)
df$antiguedad <- antiguedad
df

## Añade una nueva fila con la siguiente información
df_linea <- data.frame(nombre="Lucas", edad=30, suscrito=T, antiguedad=2)
df <- rbind(df, df_linea)
df

## Selecciona aquellos registros cuya edad sea mayor que 25
df[df$edad>25,]

## Selecciona aquellos registros menores de 25 que estén suscritos
df[df$edad<25 & df$suscrito==T,]
##########################################
### Ejercicio 4 - Fin
##########################################

## Exploración de dataframes
variables_datos <- read.csv('./Data/variables_generacion_datos.csv', header=T)
variables_datos

variables_datos$Media <- (variables_datos$Maximo + variables_datos$Minimo)/2
variables_datos

write.csv(variables_datos, './Data/variables_generacion_datos_modificado.csv', row.names=T)
variables_datos <- read.csv('./Data/variables_generacion_datos_modificado.csv', header=T)
variables_datos

## Exploración dataset "airquality"
dim(airquality)
ncol(airquality)
nrow(airquality)
head(airquality)
tail(airquality)
summary(airquality)
str(airquality)
#table(airquality) # Mucha carga computacional...
#table(airquality$Month, airquality$Day) # Mucha carga computacional...

## Agrupar datos dataframe
nombre <- c("Carlos", "Ana", "Lucas", "Maria")
edad <- c(18, 22, 19, 32)
trabajo <- c(T,F,T,F)
curso_actual <- c("Primero", "Primero", "Segundo", "Cuarto")
df <- data.frame(nombre, edad, trabajo, curso_actual)
df

#install.packages("dplyr") # No disponible para esta versión de R
library(dplyr)
agrupacion <- df %>% group_by(trabajo) %>% summarize("media"=mean(edad))
agrupacion

# Para hacer lo de arriba... ¿esto sería una buena aproximación?
edades_trabajo <- df[df$trabajo==T,"edad"]
edades_no_trabajo <- df[df$trabajo==F,"edad"]
edades_trabajo
edades_no_trabajo
media_edad_trabajo <- mean(edades_trabajo)
media_edad_no_trabajo <- mean(edades_no_trabajo)
media_edad_trabajo
media_edad_no_trabajo

trabajo <- data.frame(trabajo=T, media=media_edad_trabajo)
no_trabajo <- data.frame(trabajo=F, media=media_edad_no_trabajo)
agrupacion <- rbind(trabajo, no_trabajo)
agrupacion
##########################################
### Ejercicio 5 - Inicio
##########################################
## Instala un paquete llamado “datos” y carga el dataframe “millas”.
install.packages("datos")
library(datos)
millas <- datos::millas

## Obtén información sobre los datos que están representados en el dataframe.
head(millas)

## Obtén un primer análisis descriptivo de sus datos
summary(millas)

## Muestra las 4 primeras y 4 últimas filas del dataframe
head(millas, 4)
tail(millas, 4)

##Obten la dimensión del dataframe
dim(millas)
ncol(millas)
nrow(millas)
##########################################
### Ejercicio 5 - Fin
##########################################


## Condiciones en R
x <- 3
if (x%%2 == 0) {
  x
} else {
  paste("El valor", x, "no es par")
}


## Bucles en R
x <- 0
for (i in 1:4) {
  x <- x + 2
  x
}

i <- 1
x <- 0
while (i <= 4) {
  x <- x + 2
  print(x)
  i <- i + 1
}

i <- 1
x <- 0
repeat {
  x <- x + 2
  print(x)
  if (i==4) break
  i <- i + 1
}

## Funciones en R
suma_dos <- function(entrada) {
  # Cuerpo de la funcion
  salida <- entrada + 2
  return(salida)
}

x <- 0
y <- suma_dos(x)
y

fmaximo <- function(v, f=max) {
  salida <- f(v)
  return(salida)
}

vector <- 1:100
max_vector <- fmaximo(vector)
max_vector

max_vector <- fmaximo(vector, suma_dos)
max_vector

max_vector <- fmaximo(max_vector)
max_vector


##########################################
### Ejercicio 6 - Inicio
##########################################
## Escribe una función que reciba como cadena de texto un número de DNI y devuelva la letra correspondiente
crear_tabla_letras <- function() {
  letras <- c("T", "R", "W", "A", "G", "M", "Y", "F", "P", "D", "X",
              "B", "N", "J", "Z", "S", "Q", "V", "H", "L", "C", "K", "E")
  resto <- 0:22
  tabla_letras <- data.frame(letras, resto)
  return(tabla_letras)
}

obtener_letra_tabla <- function(tabla, resto) {
  letra_asociada <- tabla[tabla$resto == resto, ]$letras
  return(letra_asociada)
}

letra_DNI <- function(str_numero) {
  tabla_letras <- crear_tabla_letras()
  entero <- as.numeric(str_numero)
  resto <- entero %% 23
  letra <- obtener_letra_tabla(tabla_letras, resto)
  return(letra)
}

dni <- "12345678"
letra <- letra_DNI(dni)
paste(dni, letra)

## Escribe una función que tenga como parámetro de entrada un dataframe y 
## devuelva una lista con la siguiente información: Dimensión y Nombre de las columnas
descripcion_dataframe <- function(dataframe) {
  # Obtención de la dimensión
  dimension <- dim(dataframe)
  char_row <- as.character(dimension[1])
  char_col <- as.character(dimension[2])
  print("Dimension del dataframe")
  #print(paste("Numero de columnas: ", char_col))
  #print(paste("Numero de filas: ", char_row))
  
  # Obtención de las columnas
  nombre_columnas <- names(dataframe)
  #print("Nombre columnas")
  #print(nombre_columnas)
  
  # Creación de la lista
  lista <- list(dimension=dimension, columnas=nombre_columnas)
  return(lista)
}

nombre <- c("Carlos", "Ana", "Lucas", "Maria")
edad <- c(18, 22, 19, 32)
trabajo <- c(T,F,T,F)
curso_actual <- c("Primero", "Primero", "Segundo", "Cuarto")
df <- data.frame(nombre, edad, trabajo, curso_actual)
df

descripcion_dataframe(df)

## Escribe una función que, dado un vector numérico, devuelva la media del vector
media_vector <- function(vector) {
  aux_total <- 0
  tamano_vector <- length(vector)
  
  for (i in 1:tamano_vector) {
    elemento_vector <- vector[i]
    aux_total <- aux_total + elemento_vector
  }
  
  media <- aux_total / tamano_vector
  return(media)
}

vector <- 0:10
media <- media_vector(vector)
media

## Con librerías...
#vector <- 0:10
#media <- mean(vector)
#media

## Escribe una función que tome como valor de entrada un vector y devuelva el 
## valor máximo del mismo sin servirse de funciones auxiliares
maximo_vector <- function(vector) {
  maximo <- 0
  for (elemento in vector) {
    if (elemento > maximo) {
      maximo <- elemento
    }
  }
  return(maximo)
}

vector <- 0:10
maximo <- maximo_vector(vector)
maximo

## Define una función que reciba como valor de entrada un vector de nombres, 
## un vector de edades y un vector de ciudades de residencia y devuelva el dataframe asociado
informacion_usuarios_dataframe <- function(nombres, edades, ciudades) {
  data_usuarios <- data.frame(nombres, edades, ciudades)
  return(data_usuarios)
}

nombres <- c("Fran", "Lucía")
edades <- c(10,22)
ciudades <- c("Madrid", "Portugal")
df <- informacion_usuarios_dataframe(nombres, edades, ciudades)
df

## Sirviéndose de la función print() define una función que tome un dataframe 
## como el del ejercicio 5 y un nombre devuelva por pantalla la información
## relativa a ese nombre en el formato
mostrar_informacion <- function(datos, nombre) {
  datos_usuario <- datos[datos$nombres==nombre,]
  print(paste("Nombre:", datos_usuario$nombres))
  print(paste("Edad:", datos_usuario$edades))
  print(paste("Residencia:", datos_usuario$ciudades))
}

mostrar_informacion(df, "Fran")

##########################################
### Ejercicio 6 - Fin
##########################################



x <- 7*15

while (x > 0) {
  x <- x / 2
  print(x)
}


  print("Guay")











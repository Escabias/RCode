# Teoría
## ¿Entre otros, para qué usamos R?
### a) Sólo estadística e inferencia
### b) Estadística, inferencia
### c) Para procesar grandes cantidades de datos de manera fácil, rápida y sencilla
### d) Son correctas b) y c)

## Definimos un vector en R como...
### a) Un conjunto de elementos encadenados uno detrás de otro
### b) Un conjunto de elementos ordenados encadenados uno detrás de otro
### c) Un conjunto de elementos del mismo tipo
### d) Un conjunto de elementos ordenados del mismo tipo

## Dado el dataframe "df1" compuesto de 4 columnas, "nombre", "edad", "altura" y "fecha_nacimiento",
## ¿cómo obtengo un dataframe ordenado desdencentemente por fecha de nacimiento?
### a) df[order(as.Date(df$fecha_nacimiento, format="%d-%m-%Y"), decreasing=T),]
### b) sort(df, "fecha_nacimiento")
### c) df[order(as.Date(df$fecha_nacimiento, format="%d-%m-%Y")),]
### d) df[order(as.Date(df$fecha_nacimiento, format="%d-%m-%Y"), decreasing=T)]

## Dado el dataframe "df1" compuesto por 4 columnas, "nombre", "edad", "altura" y "fecha_nacimiento"
## se quiere visualizar una agrupación de alturas por rangos de edad. Los rangos son: de 0-12 años,
## 12-18 años, 18-25 años, 25+ años. ¿Qué afirmación es más acertada?
### a) Primero hago agrupo por edad, por ejemplo con df[df$edad < 12] y luego muestro un diagrama de cajas
### b) Sólo con mostrar un diagrama de puntos vale, x=edad, y=altura
### c) Primero, construyo una función que me permita segmentar el dataframe en grupos de edad, por ejemplo
###   grupo_1 <- dame_grupo_edad(df1, c(0,12)). Este dataframe tendrá la forma 
###   "grupo_1" <- data.frame(grupo=c("grupo_1", "grupo_1"), altura=c(127, 180)). Finalmente muestro los datos
###   utilizando un diagrama de cajas.
### d) Primero, df$grupo_edad <- cut(df$edad, c(0, 12, 18, 25, Inf), labels=c("G1", "G2", "G3", "G4")). Finalmente muestro los datos
###   utilizando un diagrama de cajas
    
# Práctica
## Se evaluar la integridad de los datos de un dataframe "df1" que se provee a continuación. 
## Este dataframe se compone de las columnas "nombre", "edad", "altura" y "fecha_nacimiento". 
## Según la OMS los grupos de edad se segmentan para niños y niñas hasta los 18 años. 
## Para simplificar, utilizaremos la referencia de las niñas.

## En formato dataframe, los rangos de edad son:
altura_edad_ninas <- data.frame(Edad = c(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18),
                               Percentil_3 = c(44.2, 47.4, 50.0, 52.5, 54.5, 56.2, 57.7, 59.1, 60.5, 61.8, 63.0, 64.2, 65.3, 66.4, 67.5, 68.6, 69.6, 70.6, 71.6),
                               Percentil_15 = c(46.6, 50.0, 53.1, 55.8, 57.9, 59.6, 61.1, 62.6, 64.0, 65.4, 66.7, 68.0, 69.2, 70.4, 71.5, 72.6, 73.7, 74.7, 75.7),
                               Percentil_50 = c(50.0, 53.4, 56.5, 59.2, 61.3, 63.0, 64.6, 66.2, 67.8, 69.2, 70.6, 71.9, 73.2, 74.4, 75.6, 76.8, 77.9, 79.0, 80.0),
                               Percentil_85 = c(53.4, 57.1, 60.3, 63.1, 65.3, 67.0, 68.7, 70.4, 72.0, 73.5, 74.9, 76.3, 77.7, 79.1, 80.4, 81.7, 82.9, 84.0, 85.2),
                               Percentil_97 = c(55.8, 59.7, 63.3, 66.1, 68.4, 70.2, 71.9, 73.6, 75.3, 76.9, 78.4, 79.9, 81.4, 82.8, 84.2, 85.6, 86.9, 88.2, 89.5))

## Se pide:
### a) Evaluar si la edad marcada en el dataframe coincide con la fecha de nacimiento.
### b) Evaluar si la altura de cada individuo está dentro del rango de edad adecuado
### c) Mostrar los datos correctos vs incorrectos de a) gráficamente.
### d) Mostrar un diagrama de cajas por alturas en franjas de 5 años sólo de los datos correctos.

## El dataframe df1 se provee a continuación:

## BEGIN PRUEBAS
edad <- c(12, 27, 55, 17)
fecha_nacimiento <- as.Date(c("01-01-1999", "01-01-2021", "01-01-2023", "01-01-2022"), format="%d-%m-%Y")
nombre <- c("Anastasia", "Maria", "Juan", "Pedro")
altura <- c(120, 150, 180, 160)

# Ordenar por fecha
df <- data.frame(nombre=nombre, edad=edad, altura=altura, fecha_nacimiento=fecha_nacimiento)
df[order(as.Date(df$fecha_nacimiento, format="%d-%m-%Y"), decreasing=T),]

# Hacer grupos
df$grupo_edad <- cut(df$edad, c(0, 12, 18, 25, Inf), labels=c("G1", "G2", "G3", "G4"))
df
# END PRUEBAS

# install.packages("ggplot2")
library(ggplot2)
ggplot(df, aes(x=grupo_edad, y=altura)) +
  geom_boxplot()

# Crear dataframe ejemplo
# Cargar paquete lubridate para trabajar con fechas

calcular_anios <- function(fecha) { # Probado
  fecha_calculo <- as.POSIXct(as.Date("2023-05-13", format="%Y-%m-%d"), origin = "1980-01-01")
  fecha <- as.POSIXct(fecha, origin = "1980-01-01")
  edad <- as.numeric(fecha_calculo - fecha) / 365.25
  edad <- round(edad)
  return(edad)
}

altura_por_edad <- function(edades) {
  altura <- rep(NA, length(edades))
  df <- altura_edad_ninas
  
  for (i in seq_along(edades)) {
    edad <- edades[i]
    if (edad %in% df$Edad) {
      p3 <- df$Percentil_3[df$Edad == edad]
      p15 <- df$Percentil_15[df$Edad == edad]
      p50 <- df$Percentil_50[df$Edad == edad]
      p85 <- df$Percentil_85[df$Edad == edad]
      p97 <- df$Percentil_97[df$Edad == edad]
      
      # Calcular la desviación estándar para tener una probabilidad de 2/3
      sd <- (p85 - p15) / 2
      
      # Generar una altura aleatoria con una probabilidad de 2/3
      altura[i] <- rnorm(1, p50, sd)
      
      # Si la altura es negativa, se cambia al valor absoluto
      if (altura[i] < 0) {
        altura[i] <- abs(altura[i])
      }
      
      # Ajustar la altura si la edad es mayor de 18 años
      if (edad > 18 && !is.na(p97) && altura[i] > p97) {
        altura[i] <- p97 * 1.25
      }
    }
  }
  
  return(altura)
}


crear_dataframe <- function() { # Probado
  tryCatch(year("2023-05-13"), 
           error = function(e) { install.packages("lubridate") }, 
           warning = function(w) { }, 
           finally = { library(lubridate) })
  
  n_rows <- 100
  # Definir fecha de cálculo de la edad
  fecha_calculo <- year("2023-05-13")
  
  # Generar datos aleatorios para el dataframe
  nombres <- paste0("Nombre", 1:n_rows)
  fechas_nacimiento <- sample(seq(as.Date("2005-01-01", format="%Y-%m-%d"), as.Date("2020-05-13", format="%Y-%m-%d"), by = "day"), n_rows)
  edades <- calcular_anios(fechas_nacimiento)
  alturas <- altura_por_edad(edades)
  alturas <- replace(alturas, is.na(alturas), 155)
  # Asignar fechas de nacimiento que no cuadran con la edad (20% de los datos)
  indices_incorrectos <- sample(1:n_rows, 20)
  fechas_nacimiento[indices_incorrectos] <- as.Date(fecha_calculo, origin="1980-01-01", format="%Y-%m-%d") - years(round(edades[indices_incorrectos])) - sample(1:365, 20)
  fechas_nacimiento[indices_incorrectos] <- as.Date(fechas_nacimiento[indices_incorrectos], origin = "1980-01-01", format="%Y-%m-%d")
  
  # Crear dataframe
  df1 <- data.frame(nombre = nombres, edad = round(edades), altura = round(alturas), fecha_nacimiento = fechas_nacimiento)
  return(df1)
}

df1 <- crear_dataframe()
head(df1)

edad_real <- calcular_anios(df1$fecha_nacimiento)
coincide <- edad_real == df1$edad
length(coincide[coincide]) # Cuantos hay bien

### a) Evaluar si la edad marcada en el dataframe coincide con la fecha de nacimiento.
edad_real <- calcular_anios(df1$fecha_nacimiento)
df1$coincide_fne <- edad_real == df1$edad

### b) Evaluar si la altura de cada individuo está dentro del rango de edad adecuado
summary(altura_edad_ninas)

altura_correcta <- function(edad, altura) {
  correcta <- (altura >= altura_edad_ninas[altura_edad_ninas$Edad == edad, colnames(altura_edad_ninas)[2]]) & (altura <= altura_edad_ninas[altura_edad_ninas$Edad == edad, colnames(altura_edad_ninas)[ncol(altura_edad_ninas)]])
  if (edad > 18) {
    correcta <- altura >= max(altura_edad_ninas$Percentil_97)
  }
  return(correcta)
}

altura_correcta(5,50)

alturas_correctas <- function(edades, alturas) {
  respuestas <- list()
  for (i in 1:length(edades)) {
    edad <- edades[i]
    altura <- alturas[i]
    
    respuestas[i] <- altura_correcta(edad, altura)
  }
  
  return(respuestas)
}

df1$alturas_correctas <- alturas_correctas(df1$edad, df1$altura)

### c) Mostrar los datos correctos vs incorrectos de a) gráficamente.
datos_correctos <- df1[df1$coincide_fne == TRUE & df1$alturas_correctas == TRUE,seq(1:4)]
datos_incorrectos <- df1[df1$coincide_fne == FALSE | df1$alturas_correctas == FALSE,seq(1:4)]
n_datos_correctos <- nrow(datos_correctos)
n_datos_incorrectos <- nrow(datos_incorrectos)
df_correctos_incorrectos <- data.frame(grupos=c("Correctos", "Incorrectos"), n_of=c(n_datos_correctos, n_datos_incorrectos))

ggplot(df_correctos_incorrectos, aes(x=grupos, y=n_of)) +
  geom_bar(stat="identity", fill="steelblue") +
  labs(title="Datos Correctos vs. Incorrectos", x="Grupos", y="Número de datos")

### d) Mostrar un diagrama de cajas por alturas en franjas de 5 años sólo de los datos correctos.
datos_correctos$grupos <- cut(datos_correctos$edad, c(0, 5, 10, 15, 20, 25, 30, 35, Inf), labels=c("G1", "G2", "G3", "G4", "G5", "G6", "G7", "G8"))
ggplot(datos_correctos, aes(x=grupos, y=altura)) +
  geom_boxplot() +
  labs(title="Desviación de alturas cada 5 años de edad", x="Años", y="Altura")

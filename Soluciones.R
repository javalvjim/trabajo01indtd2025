# Soluciones de los problemas

# Teoría de la Decisión bajo Incertidumbre

# En primer lugar cargamos las funciones
source("teoriadecision_funciones_incertidumbre.R")

# Problema 1. Aplicar los criterios de decisión bajo incertidumbre al problema
# cuya matriz de valores numéricos vienen dada en la tabla siguiente:

tb01 = matrix(c(1500, 1500, 1500, 1500, 2000, 1000,
                500, 3000, 3000, 3000,-1000, 1500,
                -500, 2000, 4500, 4500, 3000, 1500,
                -2000, 1000, 3500, 6000,  500, 1500,
                1000, 3000, 2500,-1500, 1500, 1500),nrow=5,ncol=6,byrow=TRUE)

colnames(tb01)=c('e1','e2','e3','e4','e5','e6')
rownames(tb01)=c('d1','d2','d3','d4','d5')

## Apartado 1) Considerar situación favorable

# Aplicamos el criterio de Wald:
criterio.Wald(tb01, favorable=TRUE)
# De acuerdo con el criterio de Wald, la alternativa óptima es la d1.

# Aplicamos el criterio optimista:
criterio.Optimista(tb01, favorable=TRUE)
# De acuerdo con el criterio optimista, la alternativa óptima es la d4.

# Aplicamos el criterio de Hurwicz para alfa=0,4:
criterio.Hurwicz(tb01, alfa=0.4, favorable=TRUE)
# De acuerdo con el criterio de Hurwicz, la alternativa óptima es la d3.

# Veamos cuales son las decisiones óptimas según el criterio de Hurwicz
# para distintos valores de alfa:
dibuja.criterio.Hurwicz(tb01, favorable=TRUE)
dibuja.criterio.Hurwicz_Intervalos(tb01, favorable=TRUE, mostrarGrafico=TRUE)
# Si alfa pertenece al intervalo (0 , 0.375), la alternativa óptima es la d1.
# Si alfa pertenece al intervalo (0.375 , 0.5), la alternativa óptima es la d3.
# Si alfa pertenece al intervalo (0.5 , 1), la alternativa óptima es la d4.

# Aplicamos el criterio de Savage:
criterio.Savage(tb01, favorable=TRUE)
# De acuerdo con el criterio de Savage, la alternativa óptima es la d3.

# Aplicamos el criterio de Laplace:
criterio.Laplace(tb01, favorable=TRUE)
# De acuerdo con el criterio de Laplace, la alternativa óptima es la d3.

# Aplicamos el criterio del Punto Ideal:
criterio.PuntoIdeal(tb01, favorable=TRUE)
# De acuerdo con el criterio del Punto Ideal, la alternativa óptima es la d3.

## Apartado 2) Considerar situación desfavorable

# Aplicamos el criterio de Wald:
criterio.Wald(tb01, favorable=FALSE)
# De acuerdo con el criterio de Wald, la alternativa óptima es la d1.

# Aplicamos el criterio optimista:
criterio.Optimista(tb01, favorable=FALSE)
# De acuerdo con el criterio optimista, la alternativa óptima es la d4.

# Aplicamos el criterio de Hurwicz para alfa=0,4:
criterio.Hurwicz(tb01, alfa=0.4, favorable=FALSE)
# De acuerdo con el criterio de Hurwicz, la alternativa óptima es la d5.

# Veamos cuales son las decisiones óptimas según el criterio de Hurwicz
# para distintos valores de alfa:
dibuja.criterio.Hurwicz(tb01, favorable=FALSE)
dibuja.criterio.Hurwicz_Intervalos(tb01, favorable=FALSE, mostrarGrafico=TRUE)
# Si alfa pertenece al intervalo (0 , 0.286), la alternativa óptima es la d1.
# Si alfa pertenece al intervalo (0.286 , 0.857), la alternativa óptima es la d5.
# Si alfa pertenece al intervalo (0.857 , 1), la alternativa óptima es la d4.

# Aplicamos el criterio de Savage:
criterio.Savage(tb01, favorable=FALSE)
# De acuerdo con el criterio de Savage, la alternativa óptima es la d5.

# Aplicamos el criterio de Laplace:
criterio.Laplace(tb01, favorable=FALSE)
# De acuerdo con el criterio de Laplace, la alternativa óptima es la d5.

# Aplicamos el criterio del Punto Ideal:
criterio.PuntoIdeal(tb01, favorable=FALSE)
# De acuerdo con el criterio del Punto Ideal, la alternativa óptima es la d5.



#################################################################################
#################################################################################


# Problema 2. Una oficina necesita contratar un plan de Internet confiable para sus operaciones
# diarias. Han recibido información de tres proveedores:

## Proveedor A1 — Básico: cuota mensual 30€. La velocidad es limitada y puede tener interrupciones
## frecuentes, lo que puede generar pérdidas operativas estimadas en 1500 € al año.

## Proveedor A2 — Premium: cuota mensual 60€. Garantiza velocidad alta y conexión estable, sin
## pérdidas por interrupciones.

## Proveedor A3 — Intermedio: cuota mensual 40€. Cubre la mayoría de las necesidades, pero si
## hay interrupciones graves, la empresa puede tener pérdidas por 700 €.

# La empresa considera dos estados posibles durante el próximo año:

## E1(Interrupciones graves): hay fallos que provocan pérdidas económicas.
## E2(Sin interrupciones graves): no hay pérdidas adicionales, solo se paga la cuota anual.

# La empresa quiere evaluar el coste total del próximo año y tomar una decisión
# racional bajo incertidumbre. ¿Qué proveedor debería elegir?

# Planteamiento:
# - Un decisor (la empresa)
# - Modelo de costos (desfavorable)
# Alternativas:
# - d1: "Proveedor Básico (A1)"
# - d2: "Proveedor Premium (A2)"
# - d3: "Proveedor Intermedio (A3)"

# Matriz de decisión (coste anual):
# A1: 30*12 + 1500 ; 30*12
# A2: 60*12 ; 60*12
# A3: 40*12 + 700 ; 40*12

(md11 = 30*12 + 1500)  # A1 en caso de interrupción: cuota anual + pérdidas
(md12 = 30*12)         # A1 sin interrupciones: solo cuota
(md21 = 60*12)         # A2 en caso de interrupción: cuota anual (cubre todo)
(md22 = 60*12)         # A2 sin interrupciones: solo cuota
(md31 = 40*12 + 700)   # A3 en caso de interrupción: cuota anual + pérdidas
(md32 = 40*12)         # A3 sin interrupciones: solo cuota

# Introducción de los datos en la tabla
tb02 = crea.tablaX(c(1860, 360,
                     720, 720,
                     1180, 480),
                   numalternativas = 3, numestados = 2,
                   nb_alternativas = c("A1. Básico", "A2. Premium", "A3. Intermedio"),
                   nb_estados = c("E1. InterrupGraves", "E2. SinInterrup"))
tb02

# Aplicamos todos los criterios:
sol02 = criterio.Todos(tb02, alfa=0.5, favorable=FALSE)
sol02

# De acuerdo con el criterio de Wald, la alternativa óptima es la A2.
# De acuerdo con el criterio de Optimista, la alternativa óptima es la A1.
# De acuerdo con el criterio de Hurwicz, la alternativa óptima es la A2.
# De acuerdo con el criterio de Savage, la alternativa óptima es la A2.
# De acuerdo con el criterio de Laplace, la alternativa óptima es la A2.
# De acuerdo con el criterio del Punto Ideal, la alternativa óptima es la A2.

# Veamos cuales son las decisiones óptimas según el criterio de Hurwicz
# para distintos valores de alfa:
dibuja.criterio.Hurwicz(tb02, favorable=FALSE)
dibuja.criterio.Hurwicz_Intervalos(tb02, favorable=FALSE, mostrarGrafico=TRUE)
# Si alfa pertenece al intervalo (0 , 0.657), la alternativa óptima es la d1.
# Si alfa pertenece al intervalo (0.657 , 0.85), la alternativa óptima es la d5.
# Si alfa pertenece al intervalo (0.85 , 1), la alternativa óptima es la d4.
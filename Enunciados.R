# Enunciados de los problemas

# Teoría de la Decisión bajo Incertidumbre

# Problema 1. Aplicar los criterios de decisión bajo incertidumbre al problema 
# cuya matriz de valores numéricos vienen dada en la tabla siguiente:

M = matrix(c(1500, 1500, 1500, 1500, 2000, 1000,
             500, 3000, 3000, 3000,-1000, 1500,
             -500, 2000, 4500, 4500, 3000, 1500,
             -2000, 1000, 3500, 6000,  500, 1500,
             1000, 3000, 2500,-1500, 1500, 1500),nrow=5,ncol=6,byrow=TRUE)

colnames(M)=c('e1','e2','e3','e4','e5','e6')
rownames(M)=c('d1','d2','d3','d4','d5')

## Apartado 1) Considerar situación favorable
## Apartado 2) Considerar situación desfavorable
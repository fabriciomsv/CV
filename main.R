library(vroom)
library(nnet)
library(parallel)
library(here)
library(magrittr)
library(tidytable)

set.seed(1234)

datos_cluster <- vroom::vroom(
  here::here(
    "data",
    "datos_cluster.csv"
  )
) %>% mutate(
        cluster = factor(
            cluster,
            levels = c(
                2,
                1,
                3,
                4
            ),
            labels = c(
                "2",
                "1",
                "3",
                "4"
            )
        )
    )

split_sample <- sample(
  1:nrow(datos_cluster),
  size = nrow(datos_cluster)*2/3,
  replace = FALSE
)

datos_cluster_training <- datos_cluster[split_sample,]

datos_cluster_test <- datos_cluster[-split_sample,]


logical = Sys.getenv("test")

if (
  logical
) {

  message(
    "¡Esta ejecutando la validación cruzada con una cantidad reducida de la muestra! ya que la opción test
    es igual a TRUE. Para cambiarlo haga un docker build -t cv_multinom --build-arg test_arg=FALSE ."
  )

  datos_cluster_training <- datos_cluster_training[1:20000,]
}


set.seed(1)

files <- list.files(
  path = "R/",
)

lapply(
  X = files,
  FUN = function(x) {
    source(
      here::here(
        "R",
        x
      )
    )
  }
)

cv <- cross_validation(
  data = datos_cluster,
  k = 10,
  formula = cluster ~ Tareas + rama + cat + Informal + Horas + Edu + Rentas + Vivienda,
  fit_function = multinom
)

tabla_t <- table(cv$test.cluster, cv$test.pred)

round((sum(diag(tabla_t)) / sum(tabla_t)) * 100, 2)


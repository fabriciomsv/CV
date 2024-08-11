# Validación cruzada + Docker

## Crear imagen


```{dokcer}

docker build -t cv_multinom --build-arg test_arg=TRUE .

```

## Ejecutar contenedor


```{dokcer}
docker run -v ${pwd}/output/:/home/ubuntu/model/output cv_multinom 
```

En la carpeta output/ se va a tener todos los modelos utilizados y una salida con los resultados de la validación cruzada.


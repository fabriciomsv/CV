cross_validation <- function(data,k,...) {
    
    id <- sample(
        1:k,
        nrow(data),
        replace = TRUE
    )

    args = list(...)

    data$id <- id

    

    res = mclapply(
        X = 1:k,
        FUN = function(x) {
            fit_model(
                split = split_data(data,x),
                formula = args$formula,
                fit_function =  args$fit_function
            )
        },
        mc.set.seed = TRUE
    )

    return(
        as.data.frame(
            do.call(
                rbind,
                res
            )
        )
    )






}


split_data <- function(data,i) {

    s = (i == data$id)

    test <- data[
        s,
    ]

    training <- data[
        -s,
    ]


    return(
        list(
            test = test,
            training = training,
            fold = i
        )
    )
}


fit_model <- function(
    split,
    formula,
    fit_function
) {
    


    train = split$training
    test = split$test
    i = split$fold


    extra_args = list(
        formula = formula,
        data = train,
        trace = FALSE
    )

    model = do.call(
        fit_function,
        args = extra_args
    )

    saveRDS(
        model,
        file = here::here(
            "output",
            paste(
                "model_",
                as.integer(runif(1,1,10000)),
                ".rds",
                sep = ""
            )
        )
    )

    test$pred = predict(
        model,
        newdata = test,
        type = "class"
    )

    return(
        data.frame(
            test$cluster,
            test$pred,
            i
        )
    )


}
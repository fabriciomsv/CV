prf <- function(predAct) {
    preds <- predAct[, 1]
    trues <- predAct[, 2]
    xTab <- table(preds, trues)
    clss <- as.character(sort(unique(preds)))
    r <- matrix(NA,
        ncol = 5, nrow = 1,
        dimnames = list(c(), c(
            "Accuracy", paste("Precision", clss[1], sep = "_"),
            paste("Recall", clss[1], sep = ""), paste("Precision", clss[2], sep = ""),
            paste("Recall", clss[2], sep = "_")
        ))
    )
    r[1, 1] <- sum(xTab[1, 1], xTab[2, 2]) / sum(xTab)
    r[1, 2] <- xTab[1, 1] / sum(xTab[, 1])
    r[1, 3] <- xTab[1, 1] / sum(xTab[1, ])
    r[1, 4] <- xTab[2, 2] / sum(xTab[, 2])
    r[1, 5] <- xTab[2, 2] / sum(xTab[2, ])
    return(data.frame(r))
}
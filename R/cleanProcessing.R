NumbersToLabels <- function(m, labels = CifarLabelnames()) {
  mapply(m, labels, SIMPLIFY = FALSE, FUN = function(labelsCol, labelnames) {
    labelsVector = unlist(labelnames, use.names = FALSE)
    
    if (any(labelsCol >= length(labelsVector))) {
      warning("Plus one or overflow error")
    }
    
    clamp = (labelsCol %% length(labelsVector)) + 1L
    labelsVector[clamp]
  })
}

BindData <- function(data, labels, name) {
  NumbersToLabels(labels, name) %>%
    data.frame(labels = .) %>%
      cbind(., data)
}

hhead <- function(x) {
  x[1:6, 1:6]
}

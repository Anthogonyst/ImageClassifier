
CifarTrain <- function(path = "data/cifar-10-binary/cifar-10-batches-bin/", pattern = "data_batch.*") {
  list.files(normalizePath(path), pattern, full.names = TRUE)
}

CifarTest <- function(path = "data/cifar-10-binary/cifar-10-batches-bin/", pattern = "test_batch.*") {
  list.files(normalizePath(path), pattern, full.names = TRUE)
}

CifarLabelnames <- function(path = "data/cifar-10-binary/cifar-10-batches-bin/", file = "batches.meta.txt") {
  read.table(normalizePath(paste0(path, "/", file)))
}

ReadCifarData <- function(path = CifarTrain(), simplify = TRUE) {
  cifar = sapply(
    path, ScanBinary, Image, imagePixels = 1024L, imageChannels = 3L, 
    imageCount = 10000L, imageLabels = 1L
  )
  
  if (simplify) {
    invisible(ThreeToTwoDims(UnlistDims(cifar)))
  } else {
    invisible(UnlistDims(cifar))
  }
}

ReadCifarLabels <- function(path = CifarTrain()) {
  invisible(sapply(path, ScanBinary, Label))
}

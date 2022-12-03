
#' The CIFAR-10 dataset
#'
#' The CIFAR-10 dataset consists of 60000 32x32 colour images in 10 classes, with 6000 images per class. 
#' There are 50000 training images and 10000 test images.
#' 
#' The dataset is divided into five training batches and one test batch, each with 10000 images. 
#' The test batch contains exactly 1000 randomly-selected images from each class. 
#' The training batches contain the remaining images in random order, but some training batches may contain more images from one class than another. 
#' Between them, the training batches contain exactly 5000 images from each class.
#' 
#' The classes are completely mutually exclusive. 
#' There is no overlap between automobiles and trucks. 
#' "Automobile" includes sedans, SUVs, things of that sort. 
#' "Truck" includes only big trucks. 
#' Neither includes pickup trucks.
#' \url{https://www.cs.toronto.edu/~kriz/cifar.html}.
#'
#' @format A matrix with 1024x3xM dimensions, representing pixels, channel, and count:
#' \describe{
#'   \item{x}{imagePixels, the value 0 to 255 of one pixel, top to bottom, left to right}
#'   \item{y}{imageChannels, three columns correspond to the rgb channels in an image}
#'   \item{z}{imageCount, separates each image to a layer}
#' }
#' @source Alex Krizhevsky, 2009 \url{https://www.cs.toronto.edu/~kriz/learning-features-2009-TR.pdf}.
"raw_cifar10"


#' The CIFAR-10 dataset
#'
#' The CIFAR-10 dataset consists of 60000 32x32 colour images in 10 classes, with 6000 images per class. 
#' There are 50000 training images and 10000 test images.
#' 
#' The dataset is divided into five training batches and one test batch, each with 10000 images. 
#' The test batch contains exactly 1000 randomly-selected images from each class. 
#' The training batches contain the remaining images in random order, but some training batches may contain more images from one class than another. 
#' Between them, the training batches contain exactly 5000 images from each class.
#' 
#' The classes are completely mutually exclusive. 
#' There is no overlap between automobiles and trucks. 
#' "Automobile" includes sedans, SUVs, things of that sort. 
#' "Truck" includes only big trucks. 
#' Neither includes pickup trucks.
#' \url{https://www.cs.toronto.edu/~kriz/cifar.html}.
#'
#' @format A matrix with Mx3072 dimensions, representing pixels, channel, and count:
#' \describe{
#'   \item{x}{imageCount, separates each image to a layer}
#'   \item{y}{image, the value 0 to 255 of one pixel, top to bottom, left to right, 1024 red then 1024 green then 1024 blue}
#' }
#' @source Alex Krizhevsky, 2009 \url{https://www.cs.toronto.edu/~kriz/learning-features-2009-TR.pdf}.
"cifar10"


#' The CIFAR-10 dataset
#'
#' The CIFAR-10 dataset consists of 60000 32x32 colour images in 10 classes, with 6000 images per class. 
#' There are 50000 training images and 10000 test images.
#' 
#' The dataset is divided into five training batches and one test batch, each with 10000 images. 
#' The test batch contains exactly 1000 randomly-selected images from each class. 
#' The training batches contain the remaining images in random order, but some training batches may contain more images from one class than another. 
#' Between them, the training batches contain exactly 5000 images from each class.
#' 
#' The classes are completely mutually exclusive. 
#' There is no overlap between automobiles and trucks. 
#' "Automobile" includes sedans, SUVs, things of that sort. 
#' "Truck" includes only big trucks. 
#' Neither includes pickup trucks.
#' \url{https://www.cs.toronto.edu/~kriz/cifar.html}.
#'
#' @format A matrix with Mx1 dimensions, representing index and label:
#' \describe{
#'   \item{x}{index, the corresponding index for the cifar10 data}
#'   \item{y}{label, values 1 through 10 corresponding to the ten classes}
#' }
#' @source Alex Krizhevsky, 2009 \url{https://www.cs.toronto.edu/~kriz/learning-features-2009-TR.pdf}.
"cifar10_labels"

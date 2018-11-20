library(ggplot2)
qplot(1:10, 1:10)
ggsave("plot.png")

#clicking source will do effectively the same as knitting (runs the script from top to bottom)

#if we go in new terminal and navigate to the directory of the file, can put the command Rscript and run the file and functions within the file
#good practice to keep the input unchanged by the functions (will make things less confusing)

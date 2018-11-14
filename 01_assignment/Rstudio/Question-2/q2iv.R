getwd()
setwd("C:/Fourth-Year/Data-Visualisation/ca1/Rstudio/Question-2")
data <- read.csv(file = "q2iv.csv", header = TRUE, sep = ",")
mosaic(xtabs(Cost ~ companyCode + Insurance,data = data), direction = c("v", "h"),gp = gpar(fill = c("blue","red"),alpha = 0.5))


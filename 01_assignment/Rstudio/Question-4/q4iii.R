getwd()
setwd("C:/Fourth-Year/Data-Visualisation/ca1/Rstudio/Question-4")
data <- read.csv(file = "cancer3D.csv", header = TRUE, sep = ",")

ggplot(data, aes(age_group, fill=sex)) + geom_bar() + facet_wrap(~canctype, scales = "free") + theme(axis.text.x = element_text(angle = 50, hjust = 1))

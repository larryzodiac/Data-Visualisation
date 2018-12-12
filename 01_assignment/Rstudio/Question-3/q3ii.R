getwd()
setwd("N:/Data-Visualisation/01_assignment/Rstudio/Question-3")
data <- read.csv(file = "influenza4D.csv", header = TRUE, sep = ",")

box <- ggplot(data, aes(Gender, Age, colour=Patient.Type))
box + theme_minimal() + geom_boxplot() + facet_wrap(~Disease)

violin <- ggplot(data, aes(Gender, Age, fill=Patient.Type, colour=Patient.Type))
violin + theme_minimal() + geom_violin() + facet_wrap(~Disease)

jitter <- ggplot(data, aes(Gender, Age, colour=Patient.Type))
jitter + theme_minimal() + geom_jitter() + facet_wrap(~Disease)

getwd()
setwd("C:/Fourth-Year/Data-Visualisation/ca1/Rstudio/Question-3")
data <- read.csv(file = "influenza4D.csv", header = TRUE, sep = ",")

mosaic(xtabs(Cost ~ companyCode + Insurance,data = data), direction = c("v", "h"),gp = gpar(fill = c("blue","red"),alpha = 0.5))

facet_grid(rows = NULL, cols = NULL, scales = "fixed",
           space = "fixed", shrink = TRUE, labeller = "label_value",
           as.table = TRUE, switch = NULL, drop = TRUE, margins = FALSE,
           facets = NULL)

ggplot(Apprentice2, aes("",Number))+geom_boxplot(fill = "red")+ facet_wrap(~Apprentice,ncol = 6,scales = "free") + theme(axis.text.x=element_text(angle = -90,size =5))+theme(strip.background = element_rect(fill = "grey20",colour = "grey80",size =1),strip.text = element_text(colour = "white"))



x <- ggplot(data, aes(Patient.Type, Age, fill=Gender, colour)) 
x + geom_boxplot() + facet_wrap(~Disease)

y <- ggplot(data, aes(Patient.Type, Age, fill=Gender)) 
y + geom_violin() + facet_wrap(~Disease)

z <- ggplot(data, aes(Patient.Type, Age, colour=Gender)) 
z + geom_jitter() + facet_wrap(~Disease)

xyz <- ggplot(data, aes(Patient.Type, Age, fill=Gender, colour=Gender)) 
xyz + geom_boxplot() + geom_violin() + geom_jitter()
xyz + facet_wrap(~Disease)


a <- ggplot(data, aes(Patient.Type, Age, fill=Gender, colour=Gender)) + geom_boxplot() + facet_wrap(~Disease)
b <- ggplot(data, aes(Patient.Type, Age, fill=Gender, colour=Gender)) + geom_violin() + facet_wrap(~Disease)
c <- ggplot(data, aes(Patient.Type, Age, colour=Gender)) + geom_jitter() + facet_wrap(~Disease)

a + facet_wrap(~Disease)


abc <- ggplot(data, aes(Patient.Type, Age, fill=Gender, colour=Gender) + facet_wrap(~plots))

ggplot(data, aes(Patient.Type, Age, fill = Gender, colour = Gender)) + 
  geom_boxplot() + 
  geom_violin() + 
  geom_jitter()




abc + geom_text(data = subset(mtcars, cyl == 8), aes(label = gear))

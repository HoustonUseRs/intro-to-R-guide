
# comment out installation of packages
# each time source is called
#install.packages("ggplot2")
#install.packages("dplyr")

# BONUS
# load and install libraries in a single function
library(pacman)
p_load(ggplot2)
p_load(dplyr)


# load libraries
library(ggplot2)
library(dplyr)

# read in data
airquality <- read.csv('airquality.csv')

# filter for only complete cases
aircomplete <- airquality[complete.cases(airquality), ]

# create a plot comparing, Ozone levels with Temperature
plt <- ggplot(aircomplete) + geom_point(aes(x=Temp, y=Ozone))
print(plt)

# run a linear model 
# ozone = a + bT + e
ozone_model <- lm(Ozone ~ Temp, data = aircomplete)

# summarize the linear model
print(summary(ozone_model))

# extrating coefficients
coef(ozone_model)

# add a new layer
plt_2 <- plt + geom_abline(intercept = -147.64607 , slope = 2.43911)
print(plt_2)



# END

#' # Analyzing air quality

#' load libraries
library(ggplot2)
library(dplyr)
library(broom)

#' Read in data, on air quality metrics
airquality <- read.csv('airquality.csv')

#' Filter for only complete cases
aircomplete <- airquality %>% filter(complete.cases(airquality))

#' Create a plot comparing, Ozone levels with Temperature
p <- ggplot(airquality) + geom_point(aes(x=Temp, y=Ozone))
print(p)

#' Let's change the colors of solar radiation, and save it in a new variable
p <- p + scale_color_gradient(low = "orange", high = "red")

#' Let's run a linear model 
#' ozone = a + bT + e
ozone_model <- lm(Ozone ~ Temp, data = aircomplete)
ozone_model %>% summary()

#' Are there any other parameters influencing ozone?
two_model <- lm(Ozone ~ Temp + Solar.R, data = aircomplete)
two_model %>% summary()

#' Extract the coefficients
ozone_intercept <- ozone_model %>% tidy %>% filter(term == "(Intercept)") %>% select(estimate) %>% unlist()
ozone_slope <- ozone_model %>% tidy %>% filter(term == "Temp") %>% select(estimate) %>% unlist()

#' Plot the linear model
p2 <- p + geom_abline(intercept = ozone_intercept , slope = ozone_slope)
print(p2)


#' # Boxplot
aircomplete <- aircomplete %>% mutate(Temp2 = ifelse(Temp < 80, "cool", "warm"))
ggplot(aircomplete) + geom_boxplot(aes(x=Temp2, y=Ozone))

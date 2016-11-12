
# comment out installation of packages
# each time source is called
#install.packages("ggplot2")
#install.packages("dplyr")

# BONUS
# load and install libraries in a single function
# p_load function, loads library if it is already installed,
# if not it first installs, and then loads the library.
#library(pacman)
#p_load(ggplot2)
#p_load(dplyr)

# load libraries
library(ggplot2)
library(dplyr)

#' ## Read in data, on air quality metrics
airquality <- read.csv('airquality.csv')

#' ## filter for only complete cases
aircomplete <- airquality[complete.cases(airquality), ]

#' ## create a plot comparing, Ozone levels with Temperature
plt <- ggplot(aircomplete) + geom_point(aes(x=Temp, y=Ozone, color = Solar.R))
print(plt)

# let change the colors of solar radiation, and save it in
# a new variable
plt = plt + scale_color_gradient(low = "orange", high = "red")

#' ## run a linear model
# ozone = a + bT + e
ozone_model <- lm(Ozone ~ Temp, data = aircomplete)

#' ## summarize the linear model
print(summary(ozone_model))

# extrating coefficients
coef(ozone_model)

#' ## add a new layer
plt_2 <- plt + geom_abline(intercept = -147.64607 , slope = 2.43911)
print(plt_2)


#' # Bonus
aircomplete = mutate(aircomplete, temp2 = ifelse(Temp > 80, "high", "low"))
ggplot(aircomplete) + geom_boxplot(aes(x=temp2, y=Ozone))

#' We see that low shows up after high on the x axis, and it is counter intuitive.
#' So we can use factors, as explained in the previous section to switch their position.
aircomplete = mutate(aircomplete, temp_fac = factor(temp2, levels = c("low", "high")))
ggplot(aircomplete) + geom_boxplot(aes(x=temp_fac, y=Ozone))



# END

rm(list=ls())

library(dplyr)

turtleData <- read.csv("~/Projects/popmod/crouse/loggerhead.crouse1987.csv")

str(turtleData)

turtleData <- mutate(turtleData, stage.length = max.age - min.age)

# TODO write a method to produce these
P <- transmute(turtleData, p.surv = ((1 - surv^(stage.length-1))/(1 - surv^stage.length))*surv)
G <- transmute(turtleData, grow = (surv^stage.length*(1 - surv))/(1 - surv^stage.length))

require(tidyverse)
require(ggplot2)
theme_minimal(0)

#read the data
data <- read.csv("slump_test (3).csv")
View(data)

#checking data
str(data)
colSums(is.na(data))
duplicates <- duplicated(data)
data[duplicates, ]

#deleting duplicates
data_unique <- data[!duplicated(data), ]

# Adding colors to boxplot
boxplot(data_unique, 
        col = rainbow(ncol(data_unique)),  # Assigns a different color to each box
        main = "Boxplot of Slump data")


# Calculate correlation matrix for numeric columns
cor_matrix <- cor(data_unique)
print(cor_matrix)

#pair plotting individually for checking linearity based upon correlation

#Pair1

ggplot(data_unique, aes(x = flow, y = slump)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue")+
  labs(title = "Flow vs Slump", x = "Flow", y = "Slump") +
  theme_minimal() +
  theme(
    panel.grid = element_blank(),  
    axis.line = element_line(color = "black")  
  )

#Pair2
ggplot(data_unique, aes(x = flow, y = water)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue")+
  labs(title = "Flow vs Water", x = "Flow", y = "Water") +
  theme_minimal() +
  theme(
    panel.grid = element_blank(),  
    axis.line = element_line(color = "black")  
  )

#Pair3
ggplot(data_unique, aes(x = strength, y = cement)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue")+
  labs(title = "Strength vs Cement", x = "Strength", y = "Cement") +
  theme_minimal() +
  theme(
    panel.grid = element_blank(),  
    axis.line = element_line(color = "black")  
  )

#Pair4
ggplot(data_unique, aes(x = strength, y = fly_ash)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue")+
  labs(title = "Strength vs Fly_Ash", x = "Strength", y = "Fly_Ash") +
  theme_minimal() +
  theme(
    panel.grid = element_blank(),  
    axis.line = element_line(color = "black")  
  )

#pair5
ggplot(data_unique, aes(x = cement, y = fly_ash)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue")+
  labs(title = "Cement vs Fly_Ash", x = "Cement", y = "Fly_Ash") +
  theme_minimal() +
  theme(
    panel.grid = element_blank(),  
    axis.line = element_line(color = "black")  
  )

#pair5
ggplot(data_unique, aes(x = coarse_aggr, y = water)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue")+
  labs(title = "Coarse Agrregate vs Water", x = "Coarse Agrregate", y = "Water") +
  theme_minimal() +
  theme(
    panel.grid = element_blank(),  
    axis.line = element_line(color = "black")  
  )

#descriptive statistics
summary(data_unique)

#regression analysis


#model1
model1 <- lm(flow ~ water+slump,data=data_unique)
summary(model1)
par(mfrow=c(2, 2))
plot(model1)

#model2
model2 <- lm(strength ~ water+cement+fly_ash,data=data_unique)
summary(model2)
par(mfrow=c(2, 2))
plot(model2)

#model3
model3 <- lm(strength ~ cement+fly_ash,data=data_unique)
summary(model3)
par(mfrow=c(2, 2))
plot(model3)

#model4
model4 <- lm(slump ~ flow,data=data_unique)
summary(model4)
par(mfrow=c(2, 2))
plot(model4)


#model5
model5<-lm(strength~slag+water+coarse_aggr+fine_aggr+fly_ash,data=data_unique)
summary(model5)
par(mfrow=c(2, 2))
plot(model5)

#analzying the fit

# is model5 the variable normally distributed?
hist(residuals(model5))
library(lmtest)
bptest(model5)
shapiro.test(model5$residuals)

model_sqrt <- lm(sqrt(strength) ~ slag + water + coarse_aggr + fine_aggr+fly_ash, data = data_unique)
summary(model_sqrt)
par(mfrow=c(2, 2))
plot(model_sqrt)

hist(residuals(model_sqrt))
library(lmtest)
bptest(model_sqrt)
shapiro.test(model_sqrt$residuals)

#model6
model6<-lm(strength~slag+water+coarse_aggr+fine_aggr+fly_ash+cement+slump+flow,data=data_unique)
summary(model6)
par(mfrow=c(2, 2))
plot(model6)

#analzying the fit

# is model6 the variable normally distributed?
hist(residuals(model6))
library(lmtest)
bptest(model6)
shapiro.test(model6$residuals)

model7<-lm(strength~+water+coarse_aggr+fly_ash+cement+slump,data=data_unique)
summary(model7)
par(mfrow=c(2, 2))
plot(model7)

#analzying the fit

# is model7 the variable normally distributed?
hist(residuals(model7))
library(lmtest)
bptest(model7)
shapiro.test(model7$residuals)





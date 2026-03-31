# Regression-Analysis-of-Concrete-Mixture-Efficiency---R-software
Tool: R | Domain: Civil Engineering / Materials Science
What this project does
Analyses a concrete slump test dataset to identify which mixture ingredients (cement, water, fly ash, slag, aggregates) most significantly predict compressive strength. Five regression models are built and compared to find the best fit.
R packages used

tidyverse — data manipulation and ggplot2 visualisation
lmtest — Breusch-Pagan test for heteroscedasticity

Key steps

Data cleaning — duplicate removal, missing value checks via colSums(is.na())
EDA — rainbow boxplots for outlier detection, correlation matrix, 5 pairwise scatter plots with linear trend lines
Modelling — 5 OLS regression models tested with increasing predictor combinations
Assumption testing — residual histograms, Shapiro-Wilk normality test, Breusch-Pagan test
Transformation — square root transform on strength applied to fix non-normality in Model 3
Best model — selected based on R², adjusted R², and assumption satisfaction

Variables
Predictors: cement, water, fly_ash, slag, coarse_aggr, fine_aggr, slump, flow
Target: strength (compressive strength)
Files

analysis.R — full R script
data/slump_test.csv — raw dataset
report/ — full written report

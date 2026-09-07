# Boston Housing Price Regression Analysis
# -----------------------------------------
# This analysis explores how selected neighborhood characteristics
# are associated with median housing values using multiple linear regression.

# Install mlbench if needed:
# install.packages("mlbench")

library(mlbench)

# Load Boston Housing dataset
data("BostonHousing")

# Preview the data
head(BostonHousing)
str(BostonHousing)
summary(BostonHousing)

# Select variables used in the analysis
housing <- BostonHousing[, c("medv", "crim", "zn", "ptratio", "chas")]

# Check for missing values
colSums(is.na(housing))

# Summary statistics
summary(housing)

# --------------------------------------------------
# Exploratory Data Analysis
# --------------------------------------------------

par(mfrow = c(2, 2))

hist(
  housing$medv,
  main = "Distribution of Median Home Value",
  xlab = "Median Home Value ($1000s)"
)

plot(
  housing$crim,
  housing$medv,
  main = "Crime Rate vs Median Home Value",
  xlab = "Crime Rate",
  ylab = "Median Home Value ($1000s)"
)

plot(
  housing$ptratio,
  housing$medv,
  main = "Pupil-Teacher Ratio vs Median Home Value",
  xlab = "Pupil-Teacher Ratio",
  ylab = "Median Home Value ($1000s)"
)

boxplot(
  medv ~ chas,
  data = housing,
  main = "Home Value by Charles River Proximity",
  xlab = "Bounds Charles River",
  ylab = "Median Home Value ($1000s)"
)

par(mfrow = c(1, 1))

# --------------------------------------------------
# Multiple Linear Regression
# --------------------------------------------------

housing_model <- lm(
  medv ~ crim + zn + ptratio + chas,
  data = housing
)

summary(housing_model)

# Model coefficients
coef(housing_model)

# 95% confidence intervals
confint(housing_model)

# --------------------------------------------------
# Model Evaluation
# --------------------------------------------------

model_summary <- summary(housing_model)

model_summary$r.squared
model_summary$adj.r.squared

# Actual vs predicted values
housing$predicted_medv <- predict(housing_model)

plot(
  housing$medv,
  housing$predicted_medv,
  main = "Actual vs Predicted Home Values",
  xlab = "Actual Median Home Value",
  ylab = "Predicted Median Home Value"
)

abline(0, 1)

# Residual analysis
plot(
  housing_model$fitted.values,
  residuals(housing_model),
  main = "Residuals vs Fitted Values",
  xlab = "Fitted Values",
  ylab = "Residuals"
)

abline(h = 0)

# --------------------------------------------------
# Statistical Significance and ANOVA
# --------------------------------------------------

anova(housing_model)

# --------------------------------------------------
# Key Model Results
# --------------------------------------------------

cat("R-squared:", model_summary$r.squared, "\n")
cat("Adjusted R-squared:", model_summary$adj.r.squared, "\n")
cat("Residual Standard Error:", model_summary$sigma, "\n")
# --------------------------------------------------
# Save Visualizations for GitHub Portfolio
# --------------------------------------------------

# Create images directory if it does not exist
if (!dir.exists("images")) {
  dir.create("images")
}

# 1. Crime Rate vs Median Home Value
png("images/crime_vs_home_value.png", width = 1000, height = 700)

plot(
  housing$crim,
  housing$medv,
  main = "Crime Rate vs Median Home Value",
  xlab = "Per-Capita Crime Rate",
  ylab = "Median Home Value ($1000s)",
  pch = 19
)

abline(
  lm(medv ~ crim, data = housing),
  lwd = 2
)

dev.off()


# 2. Pupil-Teacher Ratio vs Median Home Value
png("images/ptratio_vs_home_value.png", width = 1000, height = 700)

plot(
  housing$ptratio,
  housing$medv,
  main = "Pupil-Teacher Ratio vs Median Home Value",
  xlab = "Pupil-Teacher Ratio",
  ylab = "Median Home Value ($1000s)",
  pch = 19
)

abline(
  lm(medv ~ ptratio, data = housing),
  lwd = 2
)

dev.off()


# 3. Actual vs Predicted Home Values
png("images/actual_vs_predicted.png", width = 1000, height = 700)

plot(
  housing$medv,
  housing$predicted_medv,
  main = "Actual vs Predicted Home Values",
  xlab = "Actual Median Home Value ($1000s)",
  ylab = "Predicted Median Home Value ($1000s)",
  pch = 19
)

abline(
  0,
  1,
  lwd = 2
)

dev.off()


# 4. Residuals vs Fitted Values
png("images/residuals_vs_fitted.png", width = 1000, height = 700)

plot(
  housing_model$fitted.values,
  residuals(housing_model),
  main = "Residuals vs Fitted Values",
  xlab = "Fitted Values",
  ylab = "Residuals",
  pch = 19
)

abline(
  h = 0,
  lwd = 2
)

dev.off()

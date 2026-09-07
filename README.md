# Boston Housing Price Regression Analysis

## Project Overview

This project analyzes the relationship between neighborhood characteristics and median housing values using statistical analysis and multiple linear regression in R.

The goal is to understand how factors such as crime rate, residential zoning, pupil-teacher ratio, and proximity to the Charles River are associated with housing values, while evaluating how effectively these variables explain variation in home prices.

## Business Questions

The analysis focuses on several key questions:

- How are neighborhood characteristics associated with median housing values?
- Which selected factors have statistically significant relationships with housing prices?
- How much variation in housing values can be explained by the regression model?
- How should the model coefficients be interpreted in a practical housing context?
- What limitations should be considered when using the model for prediction?

## Dataset

The project uses the **Boston Housing** dataset available through the `mlbench` package in R.

The regression analysis focuses on:

| Variable | Description |
| --- | --- |
| `medv` | Median value of owner-occupied homes in $1,000s |
| `crim` | Per-capita crime rate by town |
| `zn` | Proportion of residential land zoned for large lots |
| `ptratio` | Pupil-teacher ratio by town |
| `chas` | Indicator for whether the tract bounds the Charles River |

## Tools & Technologies

- R
- RStudio
- Multiple Linear Regression
- Exploratory Data Analysis
- Statistical Significance Testing
- ANOVA
- Data Visualization

## Analysis Workflow

### 1. Data Exploration

The dataset is inspected using summary statistics, distribution analysis, missing-value checks, and visualizations to understand the selected variables and their relationships with median housing values.

### 2. Exploratory Data Analysis

The analysis examines:

- Distribution of median home values
- Crime rate versus median home value
- Pupil-teacher ratio versus median home value
- Housing values based on proximity to the Charles River

### 3. Regression Modeling

A multiple linear regression model is fitted using:

```text
medv ~ crim + zn + ptratio + chas
```

where median housing value (`medv`) is the response variable.

### 4. Model Evaluation

Model performance is evaluated using:

- R-squared
- Adjusted R-squared
- Residual standard error
- Coefficient estimates
- P-values
- Confidence intervals
- ANOVA
- Residual diagnostics

## Model Results

The regression model produced:

- **R-squared:** 0.3599
- **Adjusted R-squared:** 0.3547
- **Residual Standard Error:** 7.388
- **Overall model p-value:** < 2.2e-16

The model explains approximately **36% of the variation in median housing values** using the four selected neighborhood characteristics.

Although the overall regression is statistically significant, the R-squared indicates that a substantial amount of variation in housing values is explained by factors not included in this model.

## Key Insights

- Higher crime rates are associated with lower median housing values when the other variables in the model are held constant.
- Higher pupil-teacher ratios are associated with lower median housing values.
- Residential zoning shows a positive relationship with median housing values in the fitted model.
- Properties in tracts bordering the Charles River have higher estimated median values, holding the other predictors constant.
- All four selected predictors are statistically significant at the 0.05 level in this model.

## Model Limitations

The model intentionally uses a limited set of predictors and explains approximately 36% of the observed variation in median housing values.

This suggests that housing prices are influenced by additional characteristics that are not represented in the current model. A stronger predictive model could evaluate additional variables, interaction effects, nonlinear relationships, feature transformations, and alternative modeling approaches.

The Boston Housing dataset is a historical benchmark dataset, so this analysis should be viewed as a statistical modeling exercise rather than a representation of current Boston housing conditions.

## Repository Structure

```text
boston-housing-regression-analysis/
│
├── analysis/
│   └── housing_regression_analysis.R
│
├── .gitignore
└── README.md
```

## How to Run the Analysis

Install the required R package if it is not already available:

```r
install.packages("mlbench")
```

Then run:

```r
library(mlbench)
data("BostonHousing")
```

Execute the script located at:

```text
analysis/housing_regression_analysis.R
```

## Skills Demonstrated

**R Programming • Data Analysis • Exploratory Data Analysis • Multiple Linear Regression • Statistical Analysis • Predictive Modeling • ANOVA • Model Evaluation • Data Visualization**

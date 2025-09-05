###############################################
# Graduate Admission Prediction - R Project
# Author: Your Name
# Tools: R, RStudio
# Dataset: admission_predictor_sample.xlsx
###############################################

# Load libraries
library(readxl)
library(ggplot2)
library(dplyr)
library(corrplot)
library(car)

# -----------------------------
# 1. Import Data
# -----------------------------
data <- read_excel("admission_predictor_sample.xlsx")

# Preview dataset
head(data)
str(data)

# -----------------------------
# 2. Exploratory Data Analysis
# -----------------------------
summary(data)

# Correlation matrix for numeric vars
cor_matrix <- cor(data[, c("GRE_Score","TOEFL_Score","University_Rating",
                           "SOP","LOR","CGPA","Chance_of_Admit")])
corrplot(cor_matrix, method = "color", type = "upper", tl.col = "black")

# Histograms
ggplot(data, aes(x = CGPA)) + geom_histogram(binwidth=0.2, fill="steelblue") +
  labs(title="Distribution of CGPA")

# Scatterplots
ggplot(data, aes(x = GRE_Score, y = Chance_of_Admit)) +
  geom_point(alpha=0.6, color="blue") +
  geom_smooth(method="lm", color="red") +
  labs(title="GRE Score vs Chance of Admit")

# -----------------------------
# 3. Linear Regression Model
# -----------------------------
lm_model <- lm(Chance_of_Admit ~ GRE_Score + TOEFL_Score + University_Rating +
                 SOP + LOR + CGPA + Research, data=data)
summary(lm_model)

# Check multicollinearity
vif(lm_model)

# -----------------------------
# 4. Interaction Models
# -----------------------------
lm_interact <- lm(Chance_of_Admit ~ GRE_Score*CGPA + GRE_Score*SOP +
                    TOEFL_Score + University_Rating + LOR + Research, data=data)
summary(lm_interact)

# Compare Adjusted R-squared
summary(lm_model)$adj.r.squared
summary(lm_interact)$adj.r.squared

# -----------------------------
# 5. Logistic Regression
# Predicting whether student has Research Experience (0/1)
# -----------------------------
log_model <- glm(Research ~ GRE_Score + TOEFL_Score + CGPA + University_Rating,
                 data=data, family="binomial")
summary(log_model)

# -----------------------------
# 6. Model Diagnostics
# -----------------------------
par(mfrow=c(2,2))
plot(lm_interact)  # Residuals, Q-Q plot, Scale-Location, Cook's Distance

# -----------------------------
# 7. Final Notes
# -----------------------------
cat("Adjusted R² (Main Model):", round(summary(lm_model)$adj.r.squared,4), "\n")
cat("Adjusted R² (Interaction Model):", round(summary(lm_interact)$adj.r.squared,4), "\n")

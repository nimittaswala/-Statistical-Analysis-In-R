🎓 Graduate Admissions Prediction using R
📌 Project Overview

This project applies statistical modeling and data analysis in RStudio to predict graduate admission probabilities based on student profile data.
The dataset includes features such as GRE, TOEFL, CGPA, SOP, LOR, University Rating, and Research Experience, which are commonly evaluated in graduate school applications.

The goal was to evaluate the relative importance of these factors, build predictive models, and generate actionable insights that could help both prospective students and admission committees make better decisions.

🛠️ Tools & Technologies

R, RStudio

Libraries: ggplot2, dplyr, corrplot, car

Techniques: Exploratory Data Analysis (EDA), Correlation Analysis, Linear Regression, Logistic Regression, ANOVA, Interaction Modeling, Model Diagnostics

📊 Key Steps & Methods

Data Exploration & Visualization: Generated descriptive statistics, histograms, scatterplots, and correlation matrices to examine data distributions and relationships.

Linear Regression: Built baseline and refined models to predict admission probability, testing predictor significance and handling multicollinearity.

Interaction Terms: Added GRECGPA and GRESOP interactions, which improved model fit and highlighted joint effects of predictors.

Logistic Regression: Modeled the likelihood of research experience (binary outcome) as an additional factor in admissions.

Model Diagnostics: Conducted residual analysis, multicollinearity checks (VIF), and evaluated performance using Adjusted R².

✅ Results & Insights

Final model achieved an Adjusted R² of 82.11%, showing strong predictive accuracy.

CGPA was the most influential predictor of admission probability.

Research experience and University Rating significantly boosted admission chances.

Interaction effects showed that the impact of GRE scores varied depending on CGPA and SOP quality.

🚀 Impact

This project demonstrates how statistical modeling and visualization can be applied to admission datasets to extract valuable insights.
It provides a data-driven framework for applicants to assess their chances and for admission committees to make evidence-based decisions.


# -----------------------------------------------
# CEE 224A HW2 – Transportation Data Analysis
# Tobit Model Estimation (Questions 1–5)
# Author: Ghangshin Lee
# -----------------------------------------------

# 1. Load Required Packages
install.packages("AER")       # Tobit modeling
install.packages("stargazer") # Table formatting

library(AER)
library(stargazer)

# 2. Load Dataset
data_path <- "./data/CEE224As25_HW2.csv"
df <- read.csv(data_path)

# 3. Summary Statistics for Q2
summary_stats <- data.frame(
  Variable = names(df),
  Min = sapply(df, min),
  Q1 = sapply(df, function(x) quantile(x, 0.25)),
  Median = sapply(df, median),
  Q3 = sapply(df, function(x) quantile(x, 0.75)),
  Max = sapply(df, max),
  SD = sapply(df, sd)
)
print(summary_stats)

# 4. Linear Regression Model for Q3
lm_model <- lm(accrt ~ b_medbar + frc_min + IRI_max + rut_max +
               PCR_avg + ramp + shldr_w + trucks_p + bridge_n,
               data = df)
summary(lm_model)

# 5. Residual Diagnostics for Q4
par(mfrow = c(1, 2))
plot(lm_model$fitted.values, lm_model$residuals,
     main = "Residuals vs Fitted",
     xlab = "Fitted values", ylab = "Residuals")
abline(h = 0, col = "red")
qqnorm(lm_model$residuals, main = "Q-Q Plot")
qqline(lm_model$residuals, col = "blue")
par(mfrow = c(1, 1))

# 6. Alias Check Before Tobit (Q5)
print("Unique values per variable:")
print(sapply(df, function(x) length(unique(x))))
print("Alias structure:")
print(alias(lm(accrt ~ ., data = df)))

# 7. Clean Tobit Model (exclude aliased: trucks_p, possibly bridge_n)
tobit_model <- tobit(accrt ~ b_medbar + frc_min + IRI_max +
                     PCR_avg + ramp + shldr_w,
                     data = df, left = 0)

# 8. Tobit Model Output
summary(tobit_model)
# Load necessary package
library(AER)

# FULL MODEL: includes ramp, shldr_w, and bridge_n
full_model <- tobit(accrt ~ b_medbar + frc_min + IRI_max + PCR_avg +
                      ramp + shldr_w + bridge_n,
                    left = 0, data = df)

# REDUCED MODEL: excludes ramp, shldr_w, and bridge_n
reduced_model <- tobit(accrt ~ b_medbar + frc_min + IRI_max + PCR_avg,
                       left = 0, data = df)

# Extract log-likelihoods
ll_full <- logLik(full_model)
ll_reduced <- logLik(reduced_model)

# Compute Likelihood Ratio statistic
LR_stat <- -2 * (as.numeric(ll_reduced) - as.numeric(ll_full))
p_value <- pchisq(LR_stat, df = 3, lower.tail = FALSE)

# Print results
cat("LogLik (Full):", ll_full, "\n")
cat("LogLik (Reduced):", ll_reduced, "\n")
cat("LR Stat:", LR_stat, "\n")
cat("p-value:", p_value, "\n")

if (p_value < 0.05) {
  cat("Conclusion: The variables 'ramp', 'shldr_w', and 'bridge_n' are jointly significant.\n")
} else {
  cat("Conclusion: The variables are NOT jointly significant.\n")
}

# 9. Stargazer Table
stargazer(tobit_model, type = "text",
          title = "Final Tobit Model Estimation Results",
          digits = 3, header = FALSE)

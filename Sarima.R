# Load the required packages
library(quantmod)    # For financial data retrieval
library(forecast)    # For time series forecasting
library(dplyr)       # For data manipulation
library(tseries)     # For time series analysis
library(ggplot2)     # For creating detailed graphs

# Retrieve exchange rate data from Yahoo Finance
getSymbols("AUDJPY=X", src = "yahoo", periodicity = "daily")

# Extract the 'Close' price series from the data
df <- `AUDJPY=X`[, 4]

# Check for missing values
sum(is.na(df))

# Fill missing values using last observation carried forward (LOCF)
df <- na.locf(df, fromLast = TRUE)

# Remove any remaining NA values
df <- na.omit(df)

# Confrim missing values
sum(is.na(df))

# Convert the dataset to a time series object with daily frequency
ts_data <- ts(df, frequency = 365)

# # Perform decomposition of the time series into trend, seasonal, and random components
decomp <- decompose(ts_data, "multiplicative")
# 
# # Plot the decomposed time series to visualize its components
plot(decomp)

# Perform Augmented Dickey-Fuller (ADF) test to check for stationarity
adf_result <- adf.test(ts_data)
print(adf_result)

# Plot the autocorrelation function (ACF) to identify potential autoregressive (AR) terms
acf_result <- Acf(ts_data)

# Plot the partial autocorrelation function (PACF) to identify potential moving average (MA) terms
pacf_result <- pacf(ts_data)

# Fit the SARIMA model using auto.arima
# modelfit <- forecast::auto.arima(ts_data, seasonal = TRUE)
modelfit <- forecast::auto.arima(ts_data, D = 1, lambda = "auto")

# Print the selected model order
print(modelfit)

# Forecast the next 300 periods using the selected SARIMA model
forecast_data <- forecast::forecast(modelfit, h = 300)

# Convert forecasted data to a data frame
forecast_df <- data.frame(Date = seq(as.Date("2023-07-14"), by = "day", length.out = 300),
                          Forecast = as.numeric(forecast_data$mean),
                          Lower = as.numeric(forecast_data$lower[, 1]),
                          Upper = as.numeric(forecast_data$upper[, 1]))

# Plot the forecasted data along with the original series and confidence interval
ggplot() +
  geom_line(data = df, aes(x = index(df), y = df), color = "blue", linetype = "solid") +
  geom_line(data = forecast_df, aes(x = Date, y = Forecast), color = "red", linetype = "dashed") +
  geom_ribbon(data = forecast_df, aes(x = Date, ymin = Lower, ymax = Upper), fill = "lightblue", alpha = 0.5) +
  labs(x = "Date", y = "Exchange Rate", title = "AUD/JPY Exchange Rate Forecast") +
  theme_minimal()

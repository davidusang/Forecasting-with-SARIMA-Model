# SARIMA Time Series Forecasting

This repository contains an R script that demonstrates how to use the SARIMA (Seasonal Autoregressive Integrated Moving Average) model for time series forecasting. SARIMA is a powerful method for modeling and forecasting time series data with seasonal patterns. This Readme file provides an overview of the script and explains the steps involved in the forecasting process.

## Table of Contents

- [Dependencies](#dependencies)
- [Usage](#usage)
- [Results](#results)
- [License](#license)

## Dependencies

To run the script, you need to have the following R packages installed:

- quantmod
- forecast
- tseries
- ggplot2
- dplyr

You can install these packages using the `install.packages()` function in R:

## Usage

  1 Clone the repository or download the script file.

  2 Open the R environment or an R script editor.

  3 Install the required packages if they are not already installed.

  install.packages(c("quantmod", "forecast", "tseries", "ggplot2", "dplyr"))

   
## Results

The script provides the following functionality:

    Fetching historical data for the AUD/JPY exchange rate from Yahoo Finance.
    Preprocessing the data and handling missing values using the last observation carried forward (LOCF) method.
    Decomposing the time series data into trend, seasonal, and random components.
    Checking for stationarity using the Augmented Dickey-Fuller (ADF) test.
    Identifying potential autoregressive (AR) and moving average (MA) terms using autocorrelation and partial autocorrelation functions.
    Fitting a SARIMA model to the data using the auto.arima function.
    Generating forecasts for the next 300 periods (days) using the selected SARIMA model.
    Visualizing the original exchange rate series, forecasted values, and confidence intervals using ggplot2.

Execute the code step by step or run the entire script:

    The script uses the quantmod package to fetch historical data for the AUD/JPY exchange rate from Yahoo Finance.
    The data is preprocessed, and missing values are handled using the na.locf() function.
    Descriptive analysis is performed on the time series data, including decomposition into trend, seasonal, and random components.
    The data is prepared, and an ARIMA model is fitted to the data using the auto.arima() function.
    Forecasts are generated using the forecast() function.
    The model estimates and forecasted values are visualized using ggplot2.
    A histogram of the residuals is plotted to assess the model fit.

The script produces informative plots and outputs to help analyze and understand the time series data and its forecast.

## License

This script is released under the MIT License.

Feel free to copy the entire content and use it as a README file in your GitHub repository.

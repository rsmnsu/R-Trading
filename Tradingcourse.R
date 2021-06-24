if (!exists('.blotter')) .blotter <- new.env()
.blotter <- new.env()
.strategy <- new.env()
library(readxl)
data <- read_excel("C:/Users/sonia/OneDrive - University of Tasmania/DataCamp/CTO.xlsx", col_names = FALSE)
install.packages("FinancialInstrument") #if not installed
install.packages("PerformanceAnalytics") #if not installed
install.packages("remotes")
remotes::install_github("braverock/blotter")
remotes::install_github("braverock/quantstrat")
library(quantstrat)
install.packages("quantmod")
library(quantmod)
getSymbols("SPY",
           from = "2000-01-01",
           to = "2016-06-30",
           src ="yahoo",
           adjust = TRUE)
plot(Cl(SPY))

# It seems there are issues with google and yahoo while we use quantmod pkg.
# I will suggest you to use 'Quandl' instead. Plz goto Quandl website, register for free and create API key, and then copy it in below:
#  # Install Quandl
#  install.packages("Quandl")
# # or from github
# install.packages("devtools")
# library(devtools)
# install_github("quandl/quandl-r")
# 
# # Load the Quandl package
# library(Quandl)
# 
# # use API for full access
# Quandl.api_key("xxxxxx")
# 
# # Download APPLE stock data
# mydata = Quandl::Quandl.datatable("ZACKS/FC", ticker="AAPL")
# For HDFC at BSE, you can use:
#   hdfc = Quandl("BSE/BOM500180")

install.packages("TTR")
library(TTR)
plot(Cl(SPY))
lines(SMA(Cl(SPY), n=200), col="red")

initdate <- "1999-01-01"
from <- "2003-01-01"
to <- "2015-12-31"

# Set the timezone to UTC
Sys.setenv(TZ= "UTC")

# Set the currency to USD 
currency("USD")

getSymbols("SPY", from = from, to = to, src = "yahoo", adjust = TRUE)

# Use stock() to initialize SPY and set currency to USD
stock("SPY", currency = "USD")
remotes::install_github("braverock/blotter")
library(blotter)
tradesize<-100000
initeq<-100000
strategy.st<-"firststrat"
portfolio.st<-"firststrat"
account.st<-"firststrat"
rm.strat(strategy.st)
initPortf(portfolio.st, symbols = "SPY", initDate = initdate, currency = "USD")
initAcct(account.st, portfolio.st, initDate = initdate, currency = "USD", initEq = initeq)
initOrders(portfolio.st, initDate = initdate)
strategy(strategy.st, store = TRUE)
# Create a 200-day SMA
spy_sma <- SMA(x=Cl(SPY), n=200)

# Create an RSI with a 3-day lookback period
spy_rsi <- RSI(price=Cl(SPY), n=3)
# Plot the closing prices of SPY
plot(Cl(SPY))

# Overlay a 200-day SMA
lines(SMA(Cl(SPY), n = 200), col = "red")
print("trend")
# Plot the closing price of SPY
plot(Cl(SPY))

# Plot the RSI 2
plot(RSI(Cl(SPY), n = 2))
print("reversion")
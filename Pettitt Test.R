# Load necessary package

if (!require(trend)) install.packages("trend")
install.packages("trend")   # only if not installed
library(trend)
library(tidyverse)

# Load your AAPL and MSFT datasets

dataAAPL <- read_csv("C:/Users/sumad/OneDrive/Desktop/Research/Dataset12/AAPL-history-3.csv")
dataMSFT<-read_csv("C:/Users/sumad/OneDrive/Desktop/Research/Dataset12/MSFT-history-2.csv")
dataMETA<-read_csv("C:/Users/sumad/OneDrive/Desktop/Research/Dataset12/META-history-2.csv")
dataAMZN<-read_csv("C:/Users/sumad/OneDrive/Desktop/Research/Dataset12/AMZN-history.csv")
dataTSLA<-read_csv("C:/Users/sumad/OneDrive/Desktop/Research/Dataset12/TSLA-history.csv")
dataGOOG<-read_csv("C:/Users/sumad/OneDrive/Desktop/Research/Dataset12/GOOG-history.csv")
dataAVGO<-read_csv("C:/Users/sumad/OneDrive/Desktop/Research/Dataset12/AVGO-history.csv")
dataBRK<-read_csv("C:/Users/sumad/OneDrive/Desktop/Research/Dataset12/BRK.A-history.csv")
dataJPM<-read_csv("C:/Users/sumad/OneDrive/Desktop/Research/Dataset12/JPM-history.csv")
dataNVDA<-read_csv("C:/Users/sumad/OneDrive/Desktop/Research/Dataset12/NVDA-history.csv")
dataTSM<-read_csv("C:/Users/sumad/OneDrive/Desktop/Research/Dataset12/TSM-history.csv")
dataWMT<-read_csv("C:/Users/sumad/OneDrive/Desktop/Research/Dataset12/WMT-history.csv")




# Convert the Date column to Date format
dataAAPL$Date <- as.Date(dataAAPL$Date)
dataMSFT$Date <- as.Date(dataMSFT$Date)

# Sort by date in case it's unordered
dataAAPL <- dataAAPL[order(dataAAPL$Date),]
dataMSFT <- dataMSFT[order(dataMSFT$Date),]

# Run Pettitt test
aapl_result <- pettitt.test(dataAAPL$Close)
msft_result <- pettitt.test(dataMSFT$Close)
print(aapl_result)
print(msft_result)

# Extract change-point dates
aapl_cp_index <- aapl_result$estimate
msft_cp_index <- msft_result$estimate

aapl_cp_date <- dataAAPL$Date[aapl_cp_index]
msft_cp_date <- dataMSFT$Date[msft_cp_index]
print(aapl_cp_date)
print(msft_cp_date)

# Print results
cat("AAPL Change-Point Date:", format(aapl_cp_date, "%B %Y"), "\n")
cat("MSFT Change-Point Date:", format(msft_cp_date, "%B %Y"), "\n")

# === Plot AAPL ===
plot(dataAAPL$Date, dataAAPL$Close, type = "l", col = "blue", lwd = 2,
     main = "AAPL Stock Price with Change-Point (2015–2025)",
     xlab = "Date", ylab = "Closing Price (USD)")
abline(v = aapl_cp_date, col = "red", lty = 2)

# === Plot MSFT ===
plot(dataMSFT$Date, dataMSFT$Close, type = "l", col = "blue", lwd = 2,
     main = "MSFT Stock Price with Change-Point (2015–2025)",
     xlab = "Date", ylab = "Closing Price (USD)")
abline(v = msft_cp_date, col = "red", lty = 2)

######################

# Load necessary packages
if (!require(readr)) install.packages("readr")
if (!require(trend)) install.packages("trend")

library(readr)   # for read_csv()
library(trend)   # for pettitt.test()

# --- Load datasets ---
dataAAPL <- read_csv("C:/Users/sumad/OneDrive/Desktop/Research/Dataset12/AAPL-history-3.csv")
dataMSFT <- read_csv("C:/Users/sumad/OneDrive/Desktop/Research/Dataset12/MSFT-history-2.csv")
dataMETA <- read_csv("C:/Users/sumad/OneDrive/Desktop/Research/Dataset12/META-history-2.csv")
dataAMZN <- read_csv("C:/Users/sumad/OneDrive/Desktop/Research/Dataset12/AMZN-history.csv")
dataTSLA <- read_csv("C:/Users/sumad/OneDrive/Desktop/Research/Dataset12/TSLA-history.csv")
dataGOOG <- read_csv("C:/Users/sumad/OneDrive/Desktop/Research/Dataset12/GOOG-history.csv")
dataAVGO <- read_csv("C:/Users/sumad/OneDrive/Desktop/Research/Dataset12/AVGO-history.csv")
dataBRK  <- read_csv("C:/Users/sumad/OneDrive/Desktop/Research/Dataset12/BRK.A-history.csv")
dataJPM  <- read_csv("C:/Users/sumad/OneDrive/Desktop/Research/Dataset12/JPM-history.csv")
dataNVDA <- read_csv("C:/Users/sumad/OneDrive/Desktop/Research/Dataset12/NVDA-history.csv")
dataTSM  <- read_csv("C:/Users/sumad/OneDrive/Desktop/Research/Dataset12/TSM-history.csv")
dataWMT  <- read_csv("C:/Users/sumad/OneDrive/Desktop/Research/Dataset12/WMT-history.csv")

# --- Convert Date columns and sort ---
dataAAPL$Date <- as.Date(dataAAPL$Date)
dataMSFT$Date <- as.Date(dataMSFT$Date)
dataMETA$Date <- as.Date(dataMETA$Date) 
dataAMZN$Date <- as.Date(dataAMZN$Date) 
dataTSLA$Date <- as.Date(dataTSLA$Date) 
dataGOOG$Date <- as.Date(dataGOOG$Date) 
dataAVGO$Date <- as.Date(dataAVGO$Date) 
dataBRK$Date <- as.Date(dataBRK$Date) 
dataJPM$Date <- as.Date(dataJPM$Date) 
dataNVDA$Date <- as.Date(dataNVDA$Date) 
dataTSM$Date <- as.Date(dataTSM$Date) 
dataWMT$Date <- as.Date(dataWMT$Date) 

dataAAPL <- dataAAPL[order(dataAAPL$Date), ]
dataMSFT <- dataMSFT[order(dataMSFT$Date), ]
dataMETA <- dataMSFT[order(dataMETA$Date), ]
dataAMZN <- dataMSFT[order(dataAMZN$Date), ]
dataTSLA <- dataMSFT[order(dataTSLA$Date), ]
dataGOOG <- dataMSFT[order(dataGOOG$Date), ]
dataAVGO <- dataMSFT[order(dataAVGO$Date), ]
dataBRK <- dataMSFT[order(dataBRK$Date), ]
dataJPM <- dataMSFT[order(dataJPM$Date), ]
dataNVDA <- dataMSFT[order(dataNVDA$Date),]
dataTSM <- dataMSFT[order(dataTSM$Date), ]
dataWMT <- dataMSFT[order(dataWMT$Date), ]

# --- Pettitt Test ---
aapl_result <- pettitt.test(dataAAPL$Close)
msft_result <- pettitt.test(dataMSFT$Close)
meta_result <- pettitt.test(dataMETA$Close)
amzn_result <- pettitt.test(dataAMZN$Close)
tsla_result <- pettitt.test(dataTSLA$Close)
goog_result <- pettitt.test(dataGOOG$Close)
avgo_result <- pettitt.test(dataAVGO$Close)
brk_result <- pettitt.test(dataBRK$Close)
jpm_result <- pettitt.test(dataJPM$Close)
nvda_result <- pettitt.test(dataNVDA$Close)
tsm_result <- pettitt.test(dataTSM$Close)
wmt_result <- pettitt.test(dataWMT$Close)


print(aapl_result)
print(msft_result)
print(meta_result)
print(amzn_result)
print(tsla_result)
print(goog_result)
print(avgo_result)
print(brk_result)
print(jpm_result)
print(nvda_result)
print(tsm_result)
print(wmt_result)

# --- Extract change-point dates ---
aapl_cp_index <- aapl_result$estimate
msft_cp_index <- msft_result$estimate
meta_cp_index <- meta_result$estimate
amzn_cp_index <- amzn_result$estimate
tsla_cp_index <- tsla_result$estimate
goog_cp_index <- aapl_result$estimate
avgo_cp_index <- msft_result$estimate
brk_cp_index <- brk_result$estimate
jpm_cp_index <- jpm_result$estimate
nvda_cp_index <- nvda_result$estimate
tsm_cp_index <- tsm_result$estimate
wmt_cp_index <- wmt_result$estimate

aapl_cp_date <- dataAAPL$Date[aapl_cp_index]
msft_cp_date <- dataMSFT$Date[msft_cp_index]
meta_cp_date <- dataMETA$Date[meta_cp_index]
amzn_cp_date <- dataAMZN$Date[amzn_cp_index]
tsla_cp_date <- dataTSLA$Date[tsla_cp_index]
goog_cp_date <- dataGOOG$Date[goog_cp_index]
avgo_cp_date <- dataAVGO$Date[avgo_cp_index]
brk_cp_date <- dataBRK$Date[brk_cp_index]
jpm_cp_date <- dataJPM$Date[jpm_cp_index]
nvda_cp_date <- dataNVDA$Date[nvda_cp_index]
tsm_cp_date <- dataTSM$Date[tsm_cp_index]
wmt_cp_date <- dataWMT$Date[wmt_cp_index]

cat("AAPL Change-Point Date:", format(aapl_cp_date, "%B %Y"), "\n")
cat("MSFT Change-Point Date:", format(msft_cp_date, "%B %Y"), "\n")
cat("META Change-Point Date:", format(meta_cp_date, "%B %Y"), "\n")
cat("AMZN Change-Point Date:", format(amzn_cp_date, "%B %Y"), "\n")
cat("TSLA Change-Point Date:", format(tsla_cp_date, "%B %Y"), "\n")
cat("GOOG Change-Point Date:", format(goog_cp_date, "%B %Y"), "\n")
cat("AVGO Change-Point Date:", format(avgo_cp_date, "%B %Y"), "\n")
cat("BRK Change-Point Date:", format(brk_cp_date, "%B %Y"), "\n")
cat("JPM Change-Point Date:", format(jpm_cp_date, "%B %Y"), "\n")
cat("NVDA Change-Point Date:", format(nvda_cp_date, "%B %Y"), "\n")
cat("TSM Change-Point Date:", format(tsm_cp_date, "%B %Y"), "\n")
cat("WMT Change-Point Date:", format(wmt_cp_date, "%B %Y"), "\n")

# --- Plots ---
plot(dataAAPL$Date, dataAAPL$Close, type = "l", col = "blue", lwd = 2,
     main = "AAPL Stock Price with Change-Point (2015–2025)",
     xlab = "Date", ylab = "Closing Price (USD)")
abline(v = aapl_cp_date, col = "red", lty = 2)

plot(dataMSFT$Date, dataMSFT$Close, type = "l", col = "blue", lwd = 2,
     main = "MSFT Stock Price with Change-Point (2015–2025)",
     xlab = "Date", ylab = "Closing Price (USD)")
abline(v = msft_cp_date, col = "red", lty = 2)

plot(dataMETA$Date, dataMETA$Close, type = "l", col = "blue", lwd = 2,
     main = "META Stock Price with Change-Point (2015–2025)",
     xlab = "Date", ylab = "Closing Price (USD)")
abline(v = meta_cp_date, col = "red", lty = 2)

plot(dataAMZN$Date, dataAMZN$Close, type = "l", col = "blue", lwd = 2,
     main = "AMZN Stock Price with Change-Point (2015–2025)",
     xlab = "Date", ylab = "Closing Price (USD)")
abline(v = amzn_cp_date, col = "red", lty = 2)

plot(dataTSLA$Date, dataTSLA$Close, type = "l", col = "blue", lwd = 2,
     main = "TSLA Stock Price with Change-Point (2015–2025)",
     xlab = "Date", ylab = "Closing Price (USD)")
abline(v = tsla_cp_date, col = "red", lty = 2)

plot(dataGOOG$Date, dataGOOG$Close, type = "l", col = "blue", lwd = 2,
     main = "GOOG Stock Price with Change-Point (2015–2025)",
     xlab = "Date", ylab = "Closing Price (USD)")
abline(v = goog_cp_date, col = "red", lty = 2)

plot(dataAVGO$Date, dataAVGO$Close, type = "l", col = "blue", lwd = 2,
     main = "AVGO Stock Price with Change-Point (2015–2025)",
     xlab = "Date", ylab = "Closing Price (USD)")
abline(v = avgo_cp_date, col = "red", lty = 2)

plot(dataBRK$Date, dataBRK$Close, type = "l", col = "blue", lwd = 2,
     main = "BRK Stock Price with Change-Point (2015–2025)",
     xlab = "Date", ylab = "Closing Price (USD)")
abline(v = brk_cp_date, col = "red", lty = 2)

plot(dataJPM$Date, dataJPM$Close, type = "l", col = "blue", lwd = 2,
     main = "JPM Stock Price with Change-Point (2015–2025)",
     xlab = "Date", ylab = "Closing Price (USD)")
abline(v = jpm_cp_date, col = "red", lty = 2)

plot(dataNVDA$Date, dataNVDA$Close, type = "l", col = "blue", lwd = 2,
     main = "NVDA Stock Price with Change-Point (2015–2025)",
     xlab = "Date", ylab = "Closing Price (USD)")
abline(v = nvda_cp_date, col = "red", lty = 2)

plot(dataTSM$Date, dataTSM$Close, type = "l", col = "blue", lwd = 2,
     main = "TSM Stock Price with Change-Point (2015–2025)",
     xlab = "Date", ylab = "Closing Price (USD)")
abline(v = tsm_cp_date, col = "red", lty = 2)

plot(dataWMT$Date, dataWMT$Close, type = "l", col = "blue", lwd = 2,
     main = "WMT Stock Price with Change-Point (2015–2025)",
     xlab = "Date", ylab = "Closing Price (USD)")
abline(v = wmt_cp_date, col = "red", lty = 2)


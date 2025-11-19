# --- Load required packages ---
library(readr)
library(strucchange)

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

# --- Create a function for CUSUM Test and Plot ---
run_cusum <- function(data, company_name) {
  # Create time index
  data$Time <- 1:nrow(data)
  
  # Fit linear regression model
  model <- lm(Close ~ Time, data = data)
  
  # Run CUSUM test
  test_result <- sctest(model, type = "Rec-CUSUM")
  print(paste(company_name, "CUSUM Test p-value:", round(test_result$p.value, 4)))
  
  # Plot CUSUM process with confidence bands
  plot(stability(model, type = "Rec-CUSUM"),
       main = paste("CUSUM Test -", company_name))
}

# --- Run test for all 12 datasets ---
run_cusum(dataAAPL, "AAPL")
run_cusum(dataMSFT, "MSFT")
run_cusum(dataMETA, "META")
run_cusum(dataAMZN, "AMZN")
run_cusum(dataTSLA, "TSLA")
run_cusum(dataGOOG, "GOOG")
run_cusum(dataAVGO, "AVGO")
run_cusum(dataBRK,  "BRK.A")
run_cusum(dataJPM,  "JPM")
run_cusum(dataNVDA, "NVDA")
run_cusum(dataTSM,  "TSM")
run_cusum(dataWMT,  "WMT")

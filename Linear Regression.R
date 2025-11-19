# Install required packages
install.packages("tidyverse")  
install.packages("ggplot2")  

# Load libraries  
library(tidyverse)  
library(ggplot2)  

# Load the dataset
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

# View the first few rows
head(dataAAPL)
head(dataMSFT)
head(dataMETA)
head(dataAMZN)
head(dataTSLA)
head(dataGOOG)
head(dataAVGO)
head(dataBRK)
head(dataJPM)
head(dataNVDA)
head(dataTSM)
head(dataWMT)


# Check the structure of the dataset
str(dataAAPL)
str(dataMSFT)
str(dataMETA)
str(dataAMZN)
str(dataTSLA)
str(dataGOOG)
str(dataAVGO)
str(dataBRK)
str(dataJPM)
str(dataNVDA)
str(dataTSM)
str(dataWMT)

# View column names
colnames(dataAAPL)
colnames(dataMSFT)
colnames(dataMETA)
colnames(dataAMZN)
colnames(dataTSLA)
colnames(dataGOOG)
colnames(dataAVGO)
colnames(dataBRK)
colnames(dataJPM)
colnames(dataNVDA)
colnames(dataTSM)
colnames(dataWMT)

# Convert 'Date' column to Date format
dataAAPL$Date <- as.Date(dataAAPL$Date, format="%Y-%m-%d")  # Adjust format if needed
dataMSFT$Date <- as.Date(dataMSFT$Date, format="%Y-%m-%d")
dataMETA$Date <- as.Date(dataMETA$Date, format= "%Y-%m-%d")
dataAMZN$Date <- as.Date(dataAMZN$Date, format= "%Y-%m-%d")
dataTSLA$Date <- as.Date(dataTSLA$Date, format= "%Y-%m-%d")
dataGOOG$Date <- as.Date(dataGOOG$Date, format= "%Y-%m-%d")
dataAVGO$Date <- as.Date(dataAVGO$Date, format= "%Y-%m-%d")
dataBRK$Date <- as.Date(dataBRK$Date, format= "%Y-%m-%d")
dataJPM$Date <- as.Date(dataJPM$Date, format= "%Y-%m-%d")
dataNVDA$Date <- as.Date(dataNVDA$Date, format= "%Y-%m-%d")
dataTSM$Date <- as.Date(dataTSM$Date, format= "%Y-%m-%d")
dataWMT$Date <- as.Date(dataWMT$Date, format= "%Y-%m-%d")

# Select only Date and Close columns
dataAAPL <- dataAAPL %>% select(Date, Close)
dataMSFT <- dataMSFT %>% select(Date, Close)
dataMETA <- dataMETA %>% select(Date, Close)
dataAMZN <- dataAMZN %>% select(Date, Close)
dataTSLA <- dataTSLA %>% select(Date, Close)
dataGOOG <- dataGOOG %>% select(Date, Close)
dataAVGO <- dataAVGO %>% select(Date, Close)
dataBRK <- dataBRK %>% select(Date, Close)
dataJPM <- dataJPM %>% select(Date, Close)
dataNVDA <- dataNVDA %>% select(Date, Close)
dataTSM <- dataTSM %>% select(Date, Close)
dataWMT <- dataWMT %>% select(Date, Close)

# Arrange data by date
dataAAPL <- dataAAPL %>% arrange(Date)
dataMSFT <- dataMSFT %>% arrange(Date)
dataMETA <- dataMETA %>% arrange(Date)
dataAMZN <- dataAMZN %>% arrange(Date)
dataTSLA <- dataTSLA %>% arrange(Date)
dataAVGO <- dataGOOG %>% arrange(Date)
dataGOOG <- dataAVGO %>% arrange(Date)
dataBRK <- dataBRK %>% arrange(Date)
dataJPM <- dataJPM %>% arrange(Date)
dataNVDA <- dataNVDA %>% arrange(Date)
dataTSM <- dataTSM %>% arrange(Date)
dataWMT <- dataWMT %>% arrange(Date)

# View cleaned data
head(dataAAPL)
head(dataMSFT)
head(dataMETA)
head(dataAMZN)
head(dataTSLA)
head(dataGOOG)
head(dataAVGO)
head(dataBRK)
head(dataJPM)
head(dataNVDA)
head(dataTSM)
head(dataWMT)

# Create a new numeric time index
dataAAPL$Time <- 1:nrow(dataAAPL)
dataMSFT$Time <- 1:nrow(dataMSFT)
dataMETA$Time <- 1:nrow(dataMETA)
dataAMZN$Time <- 1:nrow(dataAMZN)
dataTSLA$Time <- 1:nrow(dataTSLA)
dataGOOG$Time <- 1:nrow(dataGOOG)
dataAVGO$Time <- 1:nrow(dataAVGO)
dataBRK$Time <- 1:nrow(dataBRK)
dataJPM$Time <- 1:nrow(dataJPM)
dataNVDA$Time <- 1:nrow(dataNVDA)
dataTSM$Time <- 1:nrow(dataTSM)
dataWMT$Time <- 1:nrow(dataWMT)


# View modified dataset
head(dataAAPL)
head(dataMSFT)
head(dataMETA)
head(dataAMZN)
head(dataTSLA)
head(dataGOOG)
head(dataAVGO)
head(dataBRK)
head(dataJPM)
head(dataNVDA)
head(dataTSM)
head(dataWMT)

#plot the stock price trend to see if it follows a linear pattern.

#For AAPL
ggplot(dataAAPL, aes(x = Date, y = Close)) +
  geom_line(color = "blue") +  
  labs(title = "AAPL Stock Price Trend (2015–2025)",
       x = "Date",
       y = "Closing Price") +
  theme_minimal()

#for MSFT
ggplot(dataMSFT, aes(x = Date, y = Close)) +
  geom_line(color = "blue") +  
  labs(title = "MSFT Stock Price Trend (2015–2025)",
       x = "Date",
       y = "Closing Price") +
  theme_minimal()

#for META
ggplot(dataMETA, aes(x = Date, y = Close)) +
  geom_line(color = "blue") +  
  labs(title = "META Stock Price Trend (2015–2025)",
       x = "Date",
       y = "Closing Price") +
  theme_minimal()

#for AMZN
ggplot(dataAMZN, aes(x = Date, y = Close)) +
  geom_line(color = "blue") +  
  labs(title = "AMZN Stock Price Trend (2015–2025)",
       x = "Date",
       y = "Closing Price") +
  theme_minimal()

#for TSLA
ggplot(dataTSLA, aes(x = Date, y = Close)) +
  geom_line(color = "blue") +  
  labs(title = "TSLA Stock Price Trend (2015–2025)",
       x = "Date",
       y = "Closing Price") +
  theme_minimal()

#for GOOG
ggplot(dataGOOG, aes(x = Date, y = Close)) +
  geom_line(color = "blue") +  
  labs(title = "GOOG Stock Price Trend (2015–2025)",
       x = "Date",
       y = "Closing Price") +
  theme_minimal()

#for AVGO
ggplot(dataAVGO, aes(x = Date, y = Close)) +
  geom_line(color = "blue") +  
  labs(title = "AVGO Stock Price Trend (2015–2025)",
       x = "Date",
       y = "Closing Price") +
  theme_minimal()

#for BRK
ggplot(dataBRK, aes(x = Date, y = Close)) +
  geom_line(color = "blue") +  
  labs(title = "BRK Stock Price Trend (2015–2025)",
       x = "Date",
       y = "Closing Price") +
  theme_minimal()

#for JPM
ggplot(dataJPM, aes(x = Date, y = Close)) +
  geom_line(color = "blue") +  
  labs(title = "JPM Stock Price Trend (2015–2025)",
       x = "Date",
       y = "Closing Price") +
  theme_minimal()

#for NVDA
ggplot(dataNVDA, aes(x = Date, y = Close)) +
  geom_line(color = "blue") +  
  labs(title = "NVDA Stock Price Trend (2015–2025)",
       x = "Date",
       y = "Closing Price") +
  theme_minimal()

#for TSM
ggplot(dataTSM, aes(x = Date, y = Close)) +
  geom_line(color = "blue") +  
  labs(title = "TSM Stock Price Trend (2015–2025)",
       x = "Date",
       y = "Closing Price") +
  theme_minimal()

#for WMT
ggplot(dataWMT, aes(x = Date, y = Close)) +
  geom_line(color = "blue") +  
  labs(title = "WMT Stock Price Trend (2015–2025)",
       x = "Date",
       y = "Closing Price") +
  theme_minimal()


#fit a Linear Regression model to see if there is an increasing or decreasing trend
# Apply Linear Regression (Close Price ~ Time)
modelAAPL <- lm(Close ~ Time, data = dataAAPL)
modelMSFT <- lm(Close ~ Time, data = dataMSFT)
modelMETA <- lm(Close ~ Time, data = dataMETA)
modelAMZN <- lm(Close ~ Time, data = dataAMZN)
modelTSLA <- lm(Close ~ Time, data = dataTSLA)
modelGOOG <- lm(Close ~ Time, data = dataGOOG)
modelAVGO <- lm(Close ~ Time, data = dataAVGO)
modelBRK <- lm(Close ~ Time, data = dataBRK)
modelJPM <- lm(Close ~ Time, data = dataJPM)
modelNVDA <- lm(Close ~ Time, data = dataNVDA)
modelTSM <- lm(Close ~ Time, data = dataTSM)
modelWMT <- lm(Close ~ Time, data = dataWMT)

# View model summary
summary(modelAAPL)
summary(modelMSFT)
summary(modelMETA)
summary(modelAMZN)
summary(modelTSLA)
summary(modelGOOG)
summary(modelAVGO)
summary(modelBRK)
summary(modelJPM)
summary(modelNVDA)
summary(modelTSM)
summary(modelWMT)

# Plot the Regression Line to visualize the trend:

#for AAPL

ggplot(dataAAPL, aes(x = Time, y = Close)) +
  geom_point(color = "blue") +  
  geom_smooth(method = "lm", color = "red") +  
  labs(title = "Linear Regression of AAPL Stock Price (2015–2025)",
       x = "Time (Months)",
       y = "Closing Price") +
  theme_minimal()


#for MSFT
ggplot(dataMSFT, aes(x = Time, y = Close)) +
  geom_point(color = "blue") +  
  geom_smooth(method = "lm", color = "red") +  
  labs(title = "Linear Regression of MSFT Stock Price (2015–2025)",
       x = "Time (Months)",
       y = "Closing Price") +
  theme_minimal()

#for META
ggplot(dataMETA, aes(x = Time, y = Close)) +
  geom_point(color = "blue") +  
  geom_smooth(method = "lm", color = "red") +  
  labs(title = "Linear Regression of META Stock Price (2015–2025)",
       x = "Time (Months)",
       y = "Closing Price") +
  theme_minimal()

#for AMZN
ggplot(dataMSFT, aes(x = Time, y = Close)) +
  geom_point(color = "blue") +  
  geom_smooth(method = "lm", color = "red") +  
  labs(title = "Linear Regression of AMZN Stock Price (2015–2025)",
       x = "Time (Months)",
       y = "Closing Price") +
  theme_minimal()

#for TSLA
ggplot(dataMSFT, aes(x = Time, y = Close)) +
  geom_point(color = "blue") +  
  geom_smooth(method = "lm", color = "red") +  
  labs(title = "Linear Regression of TSLA Stock Price (2015–2025)",
       x = "Time (Months)",
       y = "Closing Price") +
  theme_minimal()

#for GOOG
ggplot(dataMSFT, aes(x = Time, y = Close)) +
  geom_point(color = "blue") +  
  geom_smooth(method = "lm", color = "red") +  
  labs(title = "Linear Regression of GOOG Stock Price (2015–2025)",
       x = "Time (Months)",
       y = "Closing Price") +
  theme_minimal()

#for AVGO
ggplot(dataMSFT, aes(x = Time, y = Close)) +
  geom_point(color = "blue") +  
  geom_smooth(method = "lm", color = "red") +  
  labs(title = "Linear Regression of AVGO Stock Price (2015–2025)",
       x = "Time (Months)",
       y = "Closing Price") +
  theme_minimal()

#for BRK
ggplot(dataMSFT, aes(x = Time, y = Close)) +
  geom_point(color = "blue") +  
  geom_smooth(method = "lm", color = "red") +  
  labs(title = "Linear Regression of BRK Stock Price (2015–2025)",
       x = "Time (Months)",
       y = "Closing Price") +
  theme_minimal()

#for JPM
ggplot(dataJPM, aes(x = Time, y = Close)) +
  geom_point(color = "blue") +  
  geom_smooth(method = "lm", color = "red") +  
  labs(title = "Linear Regression of JPM Stock Price (2015–2025)",
       x = "Time (Months)",
       y = "Closing Price") +
  theme_minimal()

#for NVDA
ggplot(dataMSFT, aes(x = Time, y = Close)) +
  geom_point(color = "blue") +  
  geom_smooth(method = "lm", color = "red") +  
  labs(title = "Linear Regression of NVDA Stock Price (2015–2025)",
       x = "Time (Months)",
       y = "Closing Price") +
  theme_minimal()

#for TSM
ggplot(dataTSM, aes(x = Time, y = Close)) +
  geom_point(color = "blue") +  
  geom_smooth(method = "lm", color = "red") +  
  labs(title = "Linear Regression of TSM Stock Price (2015–2025)",
       x = "Time (Months)",
       y = "Closing Price") +
  theme_minimal()

#for WMT
ggplot(dataMSFT, aes(x = Time, y = Close)) +
  geom_point(color = "blue") +  
  geom_smooth(method = "lm", color = "red") +  
  labs(title = "Linear Regression of WMT Stock Price (2015–2025)",
       x = "Time (Months)",
       y = "Closing Price") +
  theme_minimal()


# Check Residuals for Model Validation
plot(modelAAPL$residuals, main="Residual Plot for AAPL data", col="blue", pch=19)
abline(h=0, col="red")

plot(modelMSFT$residuals, main="Residual Plot for MSFT data", col="blue", pch=19)
abline(h=0, col="red")

plot(modelMETA$residuals, main="Residual Plot for META data", col="blue", pch=19)
abline(h=0, col="red")

plot(modelAMZN$residuals, main="Residual Plot for AMZN data", col="blue", pch=19)
abline(h=0, col="red")

plot(modelTSLA$residuals, main="Residual Plot for TSLA data", col="blue", pch=19)
abline(h=0, col="red")

plot(modelGOOG$residuals, main="Residual Plot for GOOG data", col="blue", pch=19)
abline(h=0, col="red")

plot(modelAVGO$residuals, main="Residual Plot for AVGO data", col="blue", pch=19)
abline(h=0, col="red")

plot(modelBRK$residuals, main="Residual Plot for BRK data", col="blue", pch=19)
abline(h=0, col="red")

plot(modelJPM$residuals, main="Residual Plot for JPM data", col="blue", pch=19)
abline(h=0, col="red")

plot(modelNVDA$residuals, main="Residual Plot for NVDA data", col="blue", pch=19)
abline(h=0, col="red")

plot(modelTSM$residuals, main="Residual Plot for TSM data", col="blue", pch=19)
abline(h=0, col="red")

plot(modelWMT$residuals, main="Residual Plot for WMT data", col="blue", pch=19)
abline(h=0, col="red")
s

#Summary table. 

# helper to extract pieces from a model
get_lr_row <- function(name, data, model) {
  sm <- summary(model)
  slope     <- sm$coefficients["Time", "Estimate"]
  pval      <- sm$coefficients["Time", "Pr(>|t|)"]
  intercept <- sm$coefficients["(Intercept)", "Estimate"]
  r2        <- sm$r.squared
  n         <- nrow(data)
  
  trend <- ifelse(slope > 0, "Increasing",
                  ifelse(slope < 0, "Decreasing", "No trend"))
  sig   <- ifelse(pval < 0.05, "Significant", "Not significant")
  
  data.frame(
    Stock = name,
    N = n,
    Intercept = round(intercept, 2),
    Slope = round(slope, 4),
    `p-value` = signif(pval, 3),
    R2 = round(r2, 3),
    Trend = trend,
    Significance = sig
  )
}

# build the table
lr_table <- rbind(
  get_lr_row("AAPL", dataAAPL, modelAAPL),
  get_lr_row("MSFT", dataMSFT, modelMSFT),
  get_lr_row("META", dataMETA, modelMETA),
  get_lr_row("AMZN", dataAMZN, modelAMZN),
  get_lr_row("TSLA", dataTSLA, modelTSLA),
  get_lr_row("GOOG", dataGOOG, modelGOOG),
  get_lr_row("AVGO", dataAVGO, modelAVGO),
  get_lr_row("BRK",  dataBRK,  modelBRK),
  get_lr_row("JPM",  dataJPM,  modelJPM),
  get_lr_row("NVDA", dataNVDA, modelNVDA),
  get_lr_row("TSM",  dataTSM,  modelTSM),
  get_lr_row("WMT",  dataWMT,  modelWMT)
)

lr_table


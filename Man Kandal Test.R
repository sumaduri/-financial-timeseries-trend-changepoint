# ---- Libraries ----
library(readr)
library(dplyr)
library(lubridate)
library(janitor)
library(trend)
library(ggplot2)

alpha <- 0.05

# ---- File paths ----
files <- c(
  AAPL = "C:/Users/sumad/OneDrive/Desktop/Research/Dataset12/AAPL-history-3.csv",
  MSFT = "C:/Users/sumad/OneDrive/Desktop/Research/Dataset12/MSFT-history-2.csv",
  META = "C:/Users/sumad/OneDrive/Desktop/Research/Dataset12/META-history-2.csv",
  AMZN = "C:/Users/sumad/OneDrive/Desktop/Research/Dataset12/AMZN-history.csv",
  TSLA = "C:/Users/sumad/OneDrive/Desktop/Research/Dataset12/TSLA-history.csv",
  GOOG = "C:/Users/sumad/OneDrive/Desktop/Research/Dataset12/GOOG-history.csv",
  AVGO = "C:/Users/sumad/OneDrive/Desktop/Research/Dataset12/AVGO-history.csv",
  BRK  = "C:/Users/sumad/OneDrive/Desktop/Research/Dataset12/BRK.A-history.csv",
  JPM  = "C:/Users/sumad/OneDrive/Desktop/Research/Dataset12/JPM-history.csv",
  NVDA = "C:/Users/sumad/OneDrive/Desktop/Research/Dataset12/NVDA-history.csv",
  TSM  = "C:/Users/sumad/OneDrive/Desktop/Research/Dataset12/TSM-history.csv",
  WMT  = "C:/Users/sumad/OneDrive/Desktop/Research/Dataset12/WMT-history.csv"
)

# ---- Helper: read -> monthly last close (Adj Close preferred) ----
to_monthly <- function(path) {
  dat <- read_csv(path, show_col_types = FALSE) |>
    clean_names()                                    # "Adj Close" -> adj_close, "Adj.Close" -> adj_close, "Date" -> date
  stopifnot("date" %in% names(dat))
  
  # prefer adjusted close if present, else close
  price <- if ("adj_close" %in% names(dat)) dat$adj_close else dat$close
  stopifnot(!is.null(price))
  
  # parse date robustly
  d <- suppressWarnings(parse_date_time(dat$date, orders = c("Y-m-d","d/m/Y","m/d/Y","Ymd","dmY","mdY")))
  tibble(date = as_date(d), close = as.numeric(price)) |>
    filter(!is.na(date), !is.na(close)) |>
    arrange(date) |>
    mutate(year_month = floor_date(date, "month")) |>
    group_by(year_month) |>
    summarise(close = last(close[!is.na(close)]), .groups = "drop") |>
    filter(year_month >= as_date("2015-04-01"),
           year_month <= as_date("2025-03-31")) |>
    rename(date = year_month)
}

# ---- Results container ----
results <- tibble(
  Stock = character(),
  N = integer(),
  S = double(),
  varS = double(),
  Z = double(),
  p.value = double(),
  tau = double(),
  Trend = character(),
  Significance = character()
)

dir.create("mk_plots", showWarnings = FALSE)

# ---- Loop: MK test per stock + plot ----
for (stock in names(files)) {
  m <- to_monthly(files[[stock]])
  
  if (nrow(m) < 8) {
    results <- add_row(results, Stock = stock, N = nrow(m),
                       S = NA, varS = NA, Z = NA, p.value = NA, tau = NA,
                       Trend = "Too few points", Significance = "—")
    next
  }
  
  mk <- mk.test(m$close)                 # trend::mk.test on monthly close
  
  # mk.test reports Z as the test statistic; S and varS are in 'estimates'
  Zval   <- as.numeric(mk$statistic)
  Sval   <- as.numeric(mk$estimates["S"])
  varSval<- as.numeric(mk$estimates["varS"])
  tauval <- as.numeric(mk$estimates["tau"])
  pval   <- as.numeric(mk$p.value)
  
  trend_txt <- ifelse(tauval > 0, "Increasing",
                      ifelse(tauval < 0, "Decreasing", "No trend"))
  sig_txt   <- ifelse(pval < alpha, "Significant", "Not significant")
  
  results <- add_row(results,
                     Stock = stock, N = nrow(m),
                     S = Sval, varS = varSval, Z = Zval, p.value = pval, tau = tauval,
                     Trend = trend_txt, Significance = sig_txt)
  
  # Plot (monthly series + LOESS smooth)
  p <- ggplot(m, aes(date, close)) +
    geom_line(color = "darkblue", linewidth = 1.05) +
    geom_smooth(method = "loess", se = FALSE, color = "darkred", linewidth = 0.9) +
    labs(
      title = paste(stock, "Stock Price Trend (2015–2025)"),
      subtitle = paste0("Trend: ", trend_txt, "   |   Significance: ", sig_txt,
                        "   |   MK Z = ", sprintf("%.2f", Zval), ", p = ", formatC(pval, format="g", digits=3)),
      x = "Date", y = "Monthly Close (USD)"
    ) +
    theme_minimal(base_size = 12)
  
  ggsave(file.path("mk_plots", paste0(stock, "_trend_plot.png")),
         plot = p, width = 9, height = 5.4, dpi = 300)
}

# ---- Save / print ----
results <- arrange(results, p.value)
print(results, n = Inf)
write.csv(results, "MK_results_2015_2025.csv", row.names = FALSE)
cat("\nSaved: MK_results_2015_2025.csv  and  PNGs in ./mk_plots/\n")


getwd()
list.files()
list.files("mk_plots")


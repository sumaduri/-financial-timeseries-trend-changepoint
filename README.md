

# Financial Time-Series: Trend and Change-Point Analysis

## 📘 Project Overview

This project contains the R and Python code used in my master's thesis, which analysed ten years of monthly stock price data from twelve U.S. companies (2015–2025). The aim of the thesis was to apply and evaluate five different analysing methods to understand long-term trends and structural changes in financial time-series data.

The project includes two trend analysis methods and three change-point detection methods. All methods were applied separately to identify how effective each one is for this type of data. The results were examined using plots and summary tables, following the structure of the thesis.

## 🧠 Methods Used

### **Trend Analysis**
- **Linear Regression (R):** Used to model the overall trend and estimate how strongly the price changes over time.
- **Mann–Kendall Test (R):** A non-parametric test used to detect the presence of a monotonic trend without assuming linearity.

### **Change-Point Detection**
- **Pettitt Test (R):** Detects one major abrupt change in the time-series.
- **CUSUM (Cumulative Sum) Test (R):** Identifies changes in the stability of the time–price relationship.
- **Linear Kernel Change-Point Detection (Python):** Detects multiple mean-level shifts using the ruptures package.

## 📊 Data

- **Data type:** Monthly adjusted closing prices  
- **Companies:** 12 large U.S. stocks  
- **Period:** 2015–2025  
- **Source:** Yahoo Finance (via R packages / CSV files)

## 📁 Repository Contents

- `Linear Regression.R`
- `Man Kandal Test.R`  
- `Pettitt Test.R`
- `CUSUM.R`
- `LinearKernelChangePointDetection.py`


## 🎓 Thesis Contribution

- Applied five analysis methods to real financial time-series data.
- Compared trend and change-point methods to evaluate their effectiveness.
- Identified long-term trends, fluctuation patterns, and structural changes.
- Highlighted the strengths and limitations of each method.

## 📄 Citation

If you use this code, please cite the thesis:

*“Trend Analysis and Change-Point Detection in Financial Time-Series Data” (2025), Tampere University.*



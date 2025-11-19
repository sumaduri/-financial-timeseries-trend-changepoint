"""
Linear Kernel Change-Point Detection for Financial Time Series (Cleaned)
--------------------------------------------------------------
Detects mean-level changes using a linear kernel (KernelCPD) from the
'ruptures' library by Truong, Oudre, & Vayatis (2019).
"""

import os
import pandas as pd
import numpy as np
import ruptures as rpt
import matplotlib.pyplot as plt
import matplotlib.dates as mdates

# -----------------------------------------------
# Settings
# -----------------------------------------------

DATA_PATHS = {
    "AAPL": r"C:\Users\sumad\OneDrive\Desktop\Research\Dataset12\AAPL-history-3.csv",
    "MSFT": r"C:\Users\sumad\OneDrive\Desktop\Research\Dataset12\MSFT-history-2.csv",
    "META": r"C:\Users\sumad\OneDrive\Desktop\Research\Dataset12\META-history-2.csv",
    "AMZN": r"C:\Users\sumad\OneDrive\Desktop\Research\Dataset12\AMZN-history.csv",
    "TSLA": r"C:\Users\sumad\OneDrive\Desktop\Research\Dataset12\TSLA-history.csv",
    "GOOG": r"C:\Users\sumad\OneDrive\Desktop\Research\Dataset12\GOOG-history.csv",
    "AVGO": r"C:\Users\sumad\OneDrive\Desktop\Research\Dataset12\AVGO-history.csv",
    "BRK": r"C:\Users\sumad\OneDrive\Desktop\Research\Dataset12\BRK-history.csv",
    "JPM":  r"C:\Users\sumad\OneDrive\Desktop\Research\Dataset12\JPM-history.csv",
    "NVDA": r"C:\Users\sumad\OneDrive\Desktop\Research\Dataset12\NVDA-history.csv",
    "TSM":  r"C:\Users\sumad\OneDrive\Desktop\Research\Dataset12\TSM-history.csv",
    "WMT":  r"C:\Users\sumad\OneDrive\Desktop\Research\Dataset12\WMT-history.csv"
}

OUTPUT_DIR = r"C:\Users\sumad\OneDrive\Desktop\Research\Dataset12\KernelLinear_Clean_Plots"
os.makedirs(OUTPUT_DIR, exist_ok=True)

N_BKPS = 3  # number of change-points

# -----------------------------------------------
# Helper function
# -----------------------------------------------

def detect_linear_kernel_cpd(file_path, company, output_dir=OUTPUT_DIR):
    """Perform linear kernel change-point detection with data cleaning."""

    # --- Read and clean dataset ---
    df = pd.read_csv(file_path)
    # convert Date column safely
    df["Date"] = pd.to_datetime(df["Date"], errors="coerce")
    df = df.dropna(subset=["Date"])               # drop missing dates
    df = df.sort_values("Date").reset_index(drop=True)
    df = df.drop_duplicates(subset="Date")

    # choose price column
    price_candidates = ["Adj. Close", "Adj Close", "Close", "close"]
    price_col = next((c for c in price_candidates if c in df.columns), None)
    if price_col is None:
        raise ValueError(f"No price column found in {file_path}")

    # drop rows with missing prices
    df = df.dropna(subset=[price_col])
    df = df.reset_index(drop=True)

    # convert to numeric safely
    df[price_col] = pd.to_numeric(df[price_col], errors="coerce")
    df = df.dropna(subset=[price_col]).reset_index(drop=True)

    # --- Extract signal ---
    signal = df[price_col].values

    # --- KernelCPD with linear kernel ---
    model = rpt.KernelCPD(kernel="linear").fit(signal)
    change_points = model.predict(n_bkps=N_BKPS)

    # --- Map detected indices to dates ---
    detected_dates = df.iloc[change_points[:-1]]["Date"].dt.strftime("%Y-%m-%d").tolist()

    # --- Plot Year vs Close Price ---
    plt.figure(figsize=(10, 5))
    plt.plot(df["Date"], signal, color="steelblue", linewidth=1.5, label="Close Price")
    for cp in change_points[:-1]:
        plt.axvline(df.iloc[cp]["Date"], color="red", linestyle="--", linewidth=1, label="Change-Point")
    plt.title(f"{company} — Linear Kernel Change-Point Detection")
    plt.xlabel("Year")
    plt.ylabel(price_col)
    plt.grid(alpha=0.3)

    # format x-axis (one tick per year)
    plt.gca().xaxis.set_major_locator(mdates.YearLocator())
    plt.gca().xaxis.set_major_formatter(mdates.DateFormatter('%Y'))
    plt.xticks(rotation=45)

    plt.legend(loc="upper left", fontsize=8)
    plt.tight_layout()

    # --- Save PDF ---
    pdf_name = f"{company}_LinearKernel_ChangePoints.pdf"
    pdf_path = os.path.join(output_dir, pdf_name)
    plt.savefig(pdf_path, format="pdf", dpi=300)
    plt.close()
    print(f"✅ Saved plot for {company}: {pdf_path}")

    # --- Return summary info ---
    return {
        "Company": company,
        "Price_Column": price_col,
        "ChangePoint_Indices": change_points[:-1],
        "ChangePoint_Dates": detected_dates
    }

# -----------------------------------------------
# Run for all datasets
# -----------------------------------------------

results = []
for company, path in DATA_PATHS.items():
    try:
        res = detect_linear_kernel_cpd(path, company)
        results.append(res)
    except Exception as e:
        print(f"⚠️ Error processing {company}: {e}")

# --- Save summary table ---
summary_df = pd.DataFrame(results)
summary_csv = os.path.join(OUTPUT_DIR, "LinearKernel_ChangePoint_Summary.csv")
summary_df.to_csv(summary_csv, index=False)
print(f"\n✅ All analyses completed.\n📄 Summary saved to: {summary_csv}")

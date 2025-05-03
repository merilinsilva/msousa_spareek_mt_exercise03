####IMPORTS##########
import pandas as pd
import matplotlib.pyplot as plt
import os
#####################

# Get current working directory, again run from mt-exercise-03 folder
cwd = os.getcwd()

# Load the three CSVs
baseline = pd.read_csv(cwd + "/extracted_ppls/baseline_extra.csv")
prenorm = pd.read_csv(cwd + "/extracted_ppls/prenorm_extra.csv")
postnorm_extra = pd.read_csv(cwd + "/extracted_ppls/postnorm_extra.csv")

# Merge_extra based on the Step column
merged = pd.DataFrame({
    "Step": postnorm_extra["Step"],
    "Baseline": baseline["PPL"],
    "Prenorm": prenorm["PPL"],
    "Postnorm_extra": postnorm_extra["PPL"]
})

# Save the merged table
merged.to_csv(cwd + "/extracted_ppls/merged_table_extra.csv", index=False)
print("Merged CSV saved as merged_table.csv!")

# Plot
plt.figure(figsize=(12, 8))
plt.plot(merged["Step"], merged["Baseline"], label="Baseline", marker='o', linestyle='-', linewidth=3, alpha=0.8)
plt.plot(merged["Step"], merged["Prenorm"], label="Prenorm", marker='x', linestyle='--', linewidth=2, alpha=0.8)
plt.plot(merged["Step"], merged["Postnorm_extra"], label="Postnorm_extra", marker='s', linestyle='-.', linewidth=2, alpha=0.8)

plt.xlabel("Training Steps")
plt.ylabel("Validation Perplexity")
plt.title("Validation Perplexities over Training Steps (Extra Steps)")
plt.legend()
plt.grid(True)
plt.savefig("validation_ppl_plot_extra.png")
print("Plot saved as validation_ppl_plot_extra.png!")
plt.show()

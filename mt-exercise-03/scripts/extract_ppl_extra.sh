#!/bin/bash

# Set the output CSV folder (optional)
mkdir -p extracted_ppls

# Extract for baseline
if [ -f logs/baseline.log ]; then
  echo "Step,PPL" > extracted_ppls/baseline_extra.csv
  grep "Evaluation result (greedy)" logs/baseline.log | grep -oE 'ppl:\s+[0-9]+\.[0-9]+' | awk '{ step = NR * 500; if (step >= 30000) print step "," $2 }' >> extracted_ppls/baseline_extra.csv
else
  echo "baseline.log not found. Skipping baseline extraction."
fi

# Extract for deen_transformer_prenorm
if [ -f logs/deen_transformer_prenorm/err ]; then
  echo "Step,PPL" > extracted_ppls/prenorm_extra.csv
  grep "Evaluation result (greedy)" logs/deen_transformer_prenorm/err | grep -oE 'ppl:\s+[0-9]+\.[0-9]+' | awk '{ step = NR * 500; if (step >= 30000) print step "," $2 }' >> extracted_ppls/prenorm_extra.csv
else
  echo "logs/deen_transformer_prenorm/err not found. Skipping prenorm extraction."
fi

# Extract for deen_transformer_postnorm_more_steps
if [ -f logs/deen_transformer_postnorm_more_steps/err ]; then
  echo "Step,PPL" > extracted_ppls/postnorm_extra.csv
  grep "Evaluation result (greedy)" logs/deen_transformer_postnorm_more_steps/err | grep -oE 'ppl:\s+[0-9]+\.[0-9]+' | awk '{ step = NR * 500; if (step >= 30000) print step "," $2 }' >> extracted_ppls/postnorm_extra.csv
else
  echo "logs/deen_transformer_postnorm_more_steps/err not found. Skipping postnorm extraction."
fi


echo "\n Extraction completed. CSVs saved inside ./extracted_ppls/ folder."
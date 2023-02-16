#! /bin/bash

set -ex

python scripts/fact_verification.py \
  --model_name_or_path microsoft/mdeberta-v3-base \
  --tasks_names vitaminc \
  --test_on_best_ckpt \
  --do_train \
  --data_dir data \
  --do_test \
  --max_seq_length 256 \
  --per_device_train_batch_size 16 \
  --per_device_eval_batch_size 128 \
  --overwrite_output_dir \
  --learning_rate 2e-5 \
  --max_steps 50000 \
  --save_step 10000 \
  --overwrite_cache \
  --output_dir results/mdeberta_v3_base \
  --fp16 \
  "$@"

  #--fp16 \
  #--test_tasks vitc_real vitc_synthetic \
  #--do_train \
  #--do_predict \
  #--test_on_best_ckpt \
  #--model_name_or_path albert-base-v2 \
  #--do_eval \
  #--eval_all_checkpoints \

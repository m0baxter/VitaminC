#! /bin/bash

set -ex

python scripts/fact_verification.py \
  --model_name_or_path xlm-roberta-large \
  --tasks_names vitaminc_cleaned \
  --do_train \
  --do_eval \
  --eval_all_checkpoints \
  --data_dir data \
  --test_on_best_ckpt \
  --do_test \
  --max_seq_length 256 \
  --per_device_train_batch_size 8 \
  --per_device_eval_batch_size 128 \
  --learning_rate 2e-5 \
  --max_steps 100000 \
  --save_step 10000 \
  --overwrite_cache \
  --output_dir results/xlm_roberta_large_vitaminc \
  --test_tasks vitaminc_real_cleaned vitaminc_synthetic_cleaned \
  --fp16 \
  --optim adamw_torch \

#python scripts/fact_verification.py \
#  --model_name_or_path microsoft/mdeberta-v3-base \
#  --tasks_names vitaminc mnli\
#  --test_on_best_ckpt \
#  --test_tasks vitc_real vitc_synthetic mnli\
#  --do_train \
#  --data_dir data \
#  --do_eval \
#  --eval_all_checkpoints \
#  --do_test \
#  --max_seq_length 256 \
#  --per_device_train_batch_size 32 \
#  --per_device_eval_batch_size 128 \
#  --overwrite_output_dir \
#  --learning_rate 2e-5 \
#  --max_steps 100000 \
#  --save_step 10000 \
#  --overwrite_cache \
#  --output_dir results/mdeberta_v3_base \
#  --fp16 \
#  "$@"

  #--fp16 \
  #--test_tasks vitc_real vitc_synthetic mnli\
  #--do_train \
  #--do_predict \
  #--test_on_best_ckpt \
  #--model_name_or_path albert-base-v2 \

  #--max_steps 50000 \
  #--save_step 10000 \
#  --model_name_or_path albert-base-v2 \


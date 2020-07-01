fold=5
#for((i=0;i<$fold;i++));
#do
#
#
#python ./run_bert_gru.py \
#--model_type bert \
#--model_name_or_path ../model/biobert  \
#--do_train \
#--do_eval \
#--do_test \
#--data_dir ../data/data_StratifiedKFold_24/data_origin_$i \
#--output_dir ./model/finallmodel/bert_gru_24/bert_gru_24_$i \
#--max_seq_length 110 \
#--split_num 1 \
#--lstm_hidden_size 512 \
#--lstm_layers 1 \
#--lstm_dropout 0.1 \
#--eval_steps 200 \
#--per_gpu_train_batch_size 4 \
#--gradient_accumulation_steps 4 \
#--warmup_steps 0 \
#--per_gpu_eval_batch_size 64 \
#--learning_rate 3e-5 \
#--adam_epsilon 1e-6 \
#--weight_decay 0 \
#--train_steps 30000 \
#--freeze 0 \
#--op RAdam
#done
#
#
#cp ./006bio-gru-24.sh ./model/finallmodel/bert_gru_24
echo "combine result"
python ./combine009.py --model_prefix ./model/finallmodel/bert_gru_24/bert_gru_24_ --out_path ./model/lastmodel/bert_gru_24.csv --fold $fold
echo "done"
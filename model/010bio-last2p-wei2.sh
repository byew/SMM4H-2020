
fold=5
for((i=0;i<$fold;i++));
do


python ./run_bert_last2_p.py \
--model_type bert \
--model_name_or_path ../model/biobert  \
--do_train \
--do_eval \
--do_test \
--data_dir ../data/8223_data_pse/replaced_data_train_pse$i \
--output_dir ./model/finallmodel/bio_last2p_wei2/bio_last2p_wei2_$i \
--max_seq_length 110 \
--split_num 1 \
--lstm_hidden_size 512 \
--lstm_layers 1 \
--lstm_dropout 0.1 \
--eval_steps 200 \
--per_gpu_train_batch_size 4 \
--gradient_accumulation_steps 4 \
--warmup_steps 0 \
--per_gpu_eval_batch_size 48 \
--learning_rate 3e-5 \
--adam_epsilon 1e-6 \
--weight_decay 0 \
--train_steps 30000 \
--freeze 0 \
--op AdamW
done

cp ./002bio-last2p-42.sh.sh ./model/finallmodel/bio_last2p_wei2

echo "combine result"
python ./combine012.py --model_prefix ./model/finallmodel/bio_last2p_wei2/bio_last2p_wei2_ --out_path ./model/finallmodel/bio_last2p_wei2/bio_last2p_wei2.csv --fold $fold
echo "done"


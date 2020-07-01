
fold=5
for((i=0;i<$fold;i++));
do


python /home/baiyang/smm5/model/run_bert_last2_p.py \
--model_type bert \
--model_name_or_path /home/baiyang/smm5/model/biobert  \
--do_train \
--do_eval \
--do_test \
--data_dir /home/baiyang/smm5/data/data_StratifiedKFold_42/data_replacement_$i \
--output_dir /home/baiyang/smm5/model/model/finallmodel/bio_last2p_42_replacement/bio_last2p_42_replacement_$i \
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
--op RAdam
done

cp /home/baiyang/smm5/model/007-last2p-42-replacement.sh /home/baiyang/smm5/model/model/finallmodel/bio_last2p_42_replacement


echo "combine result"
python ./combine010.py --model_prefix ./model/finallmodel/bio_last2p_42_replacement/bio_last2p_42_replacement_ --out_path ./model/finallmodel/bio_last2p_42_replacement/bio_last2p_42_replacement.csv --fold $fold
echo "done"

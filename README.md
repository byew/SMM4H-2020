# SMM4H-2020
SMM4H-SubTask5-Code
data 
1:cd data
2:run process001_42k,002_24k,003preprocess.py

run model
3:cd model
4:run 001,002,003,005,006,007.sh
5:get result1-6

pseudo label
6:cd comnine
7:copy result1-6  to  ./data_8223 
8:cd src and python vote001.py

9:cd ../data 
10:python last001,002.py 

11:cd model
12:run 008,009,0010.sh to get result 7-9

13.cd combine
14:copy result1-9 to  ./data

15:cd src and python vote002.py

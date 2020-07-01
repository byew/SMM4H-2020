##########33czx_001_投票融合

import pandas as pd
import numpy as np
import os
from pprint import pprint
DATA_DIR = '../data_2/'
files = os.listdir(DATA_DIR)
files = [i for i in files if i[0]!='.']
print(len(files))
pprint(files)

sub_exp_df = pd.read_csv('../submit_example.csv')
df_merged = sub_exp_df.drop(['label'], axis=1)
# df_merged = pd.read_csv(DATA_DIR + files[0])
for file in files:
    tmp_df = pd.read_csv(DATA_DIR + file)
    df_merged = df_merged.merge(tmp_df, how='left', on='id')
    print(df_merged.shape)
pprint(df_merged.head(10))

def work(pres):
    count = [0,0,0]
    for i in pres:
        count[i] += 1
    out = count.index(max(count))
    return out

tmp_arr = np.array(df_merged.iloc[:,1:])
label_voted = [work(line) for line in tmp_arr]

df_summit = df_merged[['id']]

df_summit['label'] = label_voted

SUMMIT_DIR = '../submit/'
df_summit[['id','label']].to_csv(SUMMIT_DIR + 'result_2.csv',index=False)
print(df_summit.shape)

###ceshi
def diff_df(fname1, fname2):
    sub_exp_df = pd.read_csv('../submit_example.csv')
    df_3 = sub_exp_df.drop(['label'], axis=1)

    df_1 = pd.read_csv(fname1)
    df_2 = pd.read_csv(fname2)

    df_3 = df_3.merge(df_1, how='left', on='id')
    df_3 = df_3.merge(df_2, how='left', on='id')
    print(df_3.shape)
    df_diff = df_3[df_3['label_x'] != df_3['label_y']]
    print(df_diff.shape)
    return df_diff


# fname1 = SUMMIT_DIR + 'sub_vote12_1115_001_8233.csv'
# fname1 = SUMMIT_DIR + 'result.csv'
#
# fname2 = SUMMIT_DIR + 'sub_复现8233.csv'
# diff_df(fname1, fname2)
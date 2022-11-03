#!/bin/bash
file_name="labelled_newscatcher_dataset.csv"
path=$1
shuffle=$2
train_ratio=$3
save_train=$4
save_val=$5
header=$(head -n  $path/$file_name);
tail -n +2 $path>save_train
if [$shuffle == "yes"]
then
cat file_name | shuf
fi

for state in `cut -d',' $file_name | sort | uniq`
do
    state_data=`grep "$state" $FILE | wc -l`

    trin_num=$(( $state_data * $train_ratio / 100 ))
    val_num=$(( $state_data - $train_num ))

    

    # Train set
    num=$train_num; 
from=1; 
to=$(($from + $num - 1));
    echo Train set: $train_ratio% $num from=$from to=$to
    echo "$state_data" | head -$to >> $save_train


   
    # Validate set
    per=$(( 100 - $train_ratio))
    num=$val_num; from=$(($to + 1)); to=$state_data;
    echo Validate set: $per% $num from=$from to=$to
    echo "$state_data" | tail -$num >> $ave_val

done

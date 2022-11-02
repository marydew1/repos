#!/bin/bash
file_name="C:\Users\Mary\Desktop\labelled_newscatcher_dataset.csv"
echo $file_name
workers=$1
column_links=$2
output_folder=$3
mkdir -p newdir
cat $file_name | awk -v columns=2 -F ";" '{print $columns}' | xargs -n3 -P10 wget;
cd $newdir | cat $output_folder | awk -v columns=$column_links -F ";" '{print $columns}' | xargs -n$workers -P$10 wget;

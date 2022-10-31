!/bin/bash
file_name=$0
workers=$1
column_links=$2
output_folder=$3
threads=10
mkdir -p newdir
cat (file_name) | $awk -v columns= (column_links) -F ";" '{print column_links}' | xargs -n(threads) -P(workers) wget;
cd (newdir) | cat (output_folder) | awk -v columns=(column_links) -F ";" '{print $columns}' | xargs -n(workers) -P(threads) wget;

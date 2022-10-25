!/bin/bash

while read file; do
	wget ${file}
done < $0

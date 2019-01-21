#!/bin/sh

Folder_A=$1 #the path store videos
Folder_B=$2 #the path store output features
#echo $Folder_B
for file_a in `ls ${Folder_A}`;
do
#echo $file_a #WritingOnBoard
file_subvideos=$Folder_A/${file_a}
file_subfeatures=$Folder_B/${file_a}
echo $file_subfeatures
if [ ! -d $file_subfeatures ];then
echo $file_subfeatures
mkdir $file_subfeatures
fi
	for file_video in `ls ${file_subvideos}`/;
	do
		temp_file=`basename $file_video` 
		feature_file=$file_subfeatures/${temp_file%%.} 
		./release/DenseTrackStab $file_a |gzip > $feature_file.features.gz 
	done
done


#!/bin/bash

TRAIN_TAR=ILSVRC2012_img_train.tar
VAL_TAR=ILSVRC2012_img_val.tar
TMP_DIR=tmp
TRAIN_DIR=train
VAL_DIR=val

#create the directories
if [ ! -d $TRAIN_DIR ]; then
	mkdir $TRAIN_DIR
fi

if [ ! -d $TMP_DIR ]; then
	mkdir $TMP_DIR
fi

if [ ! -d $VAL_DIR ]; then
	mkdir $VAL_DIR
fi

	
echo untar $TRAIN_TAR to $TMP_DIR
#tar xvf $TRAIN_TAR -C $TMP_DIR

for filename in ${TMP_DIR}/*.tar; do
	subname=${filename%.*}
	subname=${subname#*/}
#echo $subname
	mkdir ${TRAIN_DIR}/${subname}
	echo untar ${filename} to ${TRAIN_DIR}/${subname}
	tar xvf ${filename} -C ${TRAIN_DIR}/${subname}
	rm ${filename}
done

#untar val
echo untar $VAL_TAR to $VAL_DIR
tar xvf $VAL_TAR -C $VAL_DIR

rm -r $TMP_DIR

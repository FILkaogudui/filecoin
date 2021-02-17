## insturction
SC:=source
BS:=bash
GC:=git clone 

## dir
FILE_ROOT=../filecoin
FILE_SCR=$FILE_ROOT/script
FILE_BIN=$FILE_ROOT/bin
FILE_LOG=$FILE_ROOT/log

GIT_ROOT=https://github.com/FILkaogudui


.PHONY:
## get the lotus && miner bin
bin-lotus:
  $GC $GIT_ROOT/bin-lotus.git  $FILE_BIN
  $GC $GIT_ROOT/bin-miner.git  $FILE_BIN
  
## get the gpu worker bin
bin-worker-gpu:
  $GC $GIT_ROOT/bin-worker-gpu.git  $FILE_BIN
  
## get the amd worker bin 
bin-worker-amd:
  $GC $GIT_ROOT/bin-worker-amd.git  $FILE_BIN
  
## make the snap
snap:
  $SC $FILE_SCR/lotus.env &&\
  lotus chain export --recent-stateroots 900 --skip-old-msgs $FILE_ROOT/snap/new.car

## setup the lotus from snap
lotus-snap:
  $BS $FILE_SCR/snap.sh &&\
  $SC $FILE_SCR/lotus.env &&\
  lotus daemon --import-snapshot=$FILE_ROOT/snap/new.car > $FILE_LOG/lotus.log 2>&1 & 
  
## setup the lotus
lotus:
  $SC $FILE_SCR/lotus.env &&\
  lotus daemon > $FILE_LOG/lotus.log 2>&1 & 
  
## setup the miner
miner:
  $SC $FILE_SCR/miner.env &&\
  $BS $FILE_SCR/setup-miner.sh


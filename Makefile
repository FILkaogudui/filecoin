## insturction
SC:=source
BS:=bash

## dir
FILE_ROOT=../filecoin
FILE_SCR=$FILE_ROOT/script
FILE_BIN=$FILE_ROOT/bin


.PHONY:
## get the lotus && miner bin
lotus-bin:
  wget -c -O 
  
## get the worker bin
worker-bin:
  wget -c -O 
  
## get the lotus snap
snap:
  wget -c -O 
  
## setup the lotus
lotus:
  $SC $FILE_SCR/lotus.env &&\
  lotus daemon
  
## setup the miner
miner:
  $SC $FILE_SCR/miner.env &&\
  $BS $FILE_SCR/setup-miner.sh


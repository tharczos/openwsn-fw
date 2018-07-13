#!/bin/bash

FILE=$(echo $1 | sed "s/.*\/.*\/.*\/.*\/\([0-9]\+\)/\1/")
DIR=$(dirname $1)
#echo -e "Direktirij $DIR"
echo -e "\n\t FLASHING $FILE to nrf52840dk\n"

cd $DIR
arm-none-eabi-objcopy -O ihex $FILE out.ihex
./../../../../bsp/boards/nrf52840dk/tools/nrfjprog/nrfjprog -f nrf52 --program out.ihex --sectorerase
./../../../../bsp/boards/nrf52840dk/tools/nrfjprog/nrfjprog -f nrf52 --reset


cd ../../../..
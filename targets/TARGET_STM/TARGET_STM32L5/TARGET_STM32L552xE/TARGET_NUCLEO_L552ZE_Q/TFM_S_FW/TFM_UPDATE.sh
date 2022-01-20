#!/bin/bash -
#******************************************************************************
#  * @attention
#  *
#  * <h2><center>&copy; Copyright (c) 2019 STMicroelectronics.
#  * All rights reserved.</center></h2>
#  *
#  * This software component is licensed by ST under BSD 3-Clause license,
#  * the "License"; You may not use this file except in compliance with the
#  * License. You may obtain a copy of the License at:
#  *                        opensource.org/licenses/BSD-3-Clause
#  *
#  ******************************************************************************

echo "TFM UPDATE started"
sn_option=""
if [ $# -eq 1 ]; then
sn_option="sn=$1"
fi
# Absolute path to this script
SCRIPT=$(readlink -f $0)
# Absolute path this script
SCRIPTPATH=`dirname $SCRIPT`
BINPATH="$SCRIPTPATH/temp"
PATH="~/STMicroelectronics/STM32Cube/STM32CubeProgrammer/bin/":$PATH
stm32programmercli="STM32_Programmer_CLI"
external_loader="C:\PROGRA~1\STMicroelectronics\STM32Cube\STM32CubeProgrammer\bin\ExternalLoader\MX25LM51245G_STM32L562E-DK.stldr"
connect_no_reset="-c port=SWD "$sn_option" mode=UR -el $external_loader"
connect="-c port=SWD "$sn_option" mode=UR --hardRst -el $external_loader"

echo "Write TFM_Appli Secure"
# part ot be updated according to flash_layout.h
slot0=0xc013000
slot1=0xc04b000
slot2=0xc075000
slot3=0xc0ad000
its=0xc011000
sst=0xc00f000
scratch=0xc00e000
nvcounter=0xc00e000
boot=0xc000000
unused=0xc0d7000

$stm32programmercli $connect -d $BINPATH/tfm_s_signed.bin $slot0 -v
echo "TFM_Appli Secure Written"
echo "Write TFM_Appli NonSecure"
$stm32programmercli $connect -d $BINPATH/tfm_mbed-os-tf-m-regression-tests_signed.bin $slot1 -v
echo "TFM_Appli NonSecure Written"
echo "Write TFM_SBSFU_Boot"
$stm32programmercli $connect -d $BINPATH/bl2.bin $boot -v
echo "TFM_SBSFU_Boot Written"
echo "TFM_UPDATE Done"
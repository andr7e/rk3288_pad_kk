#!/bin/bash
export PATH=$HOME/kernel_build/arm-eabi-4.6/bin/:$PATH
export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=$HOME/kernel_build/arm-eabi-4.6/bin/arm-eabi-
export LOCALVERSION=

#porject="rk3188-tb"
porject="rk3188-pmp5785"

make rockchip_3188_pmp5785_defconfig

make -j2 zImage

make "$porject".dtb

cat arch/arm/boot/zImage arch/arm/boot/dts/"$porject".dtb > arch/arm/boot/zImage-dtb

#./mkkrnlimg ./arch/arm/boot/zImage-dtb kernel.img

#zip -r out ./kernel.img

mv arch/arm/boot/zImage-dtb zImage
zip -r out zImage
mv ./out.zip ../kernel3.10.49.zip



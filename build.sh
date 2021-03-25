#!/bin/bash

mkdir -p /tmp/rom
cd /tmp/rom
repo init -u https://github.com/LineageOS/android -b lineage-17.1 -c --depth=1 --groups=default,-device,-pixel,-coral,-marlin,-wahoo,-qcom_sdm845,-darwin -p linux --no-tags  
repo sync -j16 -c --no-tags --optimized-fetch
git clone https://github.com/mi-msm8937/proprietary_vendor_xiaomi_msm8937-common -b 10 --depth=1 vendor/xiaomi/msm8937-common
git clone https://github.com/mi-msm8937/android_device_xiaomi_msm8937-common -b lineage-17.1 --depth=1 device/xiaomi/msm8937-common
git clone https://github.com/mi-msm8937/android_device_xiaomi_ulysse -b lineage-17.1 --depth=1 device/xiaomi/ulysse
git clone https://github.com/mi-msm8937/proprietary_vendor_xiaomi_ulysse -b lineage-17.1 --depth=1 vendor/xiaomi/ulysse
git clone https://github.com/mi-msm8937/android_kernel_xiaomi_msm8937-4.9 -b 11 --depth=1 kernel/xiaomi/msm8937-4.9
git clone https://github.com/mi-msm8937/android_kernel_xiaomi_msm8937-4.9 -b 11 --depth=1 kernel/xiaomi/ulysse-4.9
brunch ulysse


#!/bin/bash

make -C hello_world \ 
        CROSS_COMPILE="/opt/aarch64-glibc-stable-final/aarch64-buildroot-linux-gnu" \
        TA_DEV_KIT_DIR="/opt/Jetson_LinuxR35.4.1_aarch64/Linux_for_Tegra/sources/tegra/optee-src/nv-optee/optee/build/t234/export-ta_arm64/" \
        OPTEE_CLIENT_EXPORT="/opt/Jetson_LinuxR35.4.1_aarch64/Linux_for_Tegra/sources/tegra/optee-src/nv-optee/optee/install/t234/usr" \
        TEEC_EXPORT="/opt/Jetson_LinuxR35.4.1_aarch64/Linux_for_Tegra/sources/tegra/optee-src/nv-optee/optee/install/t234/usr" \
        -j"$(nproc)"

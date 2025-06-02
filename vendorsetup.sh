#!/usr/bin/env bash

# Copyright (C) 2024-2025 Android Open Source Project
# Copyright (C) 2024-2025 Taher Hakim

# Color code variables
R="\033[1;31m";
B="\033[1;34m";
G="\033[1;32m";
N="\033[0m"; # No Color

# Environment variables
SRC_DIR="${PWD}";
CLANG_VERSION="r547379";
CLANG_DIR="${SRC_DIR}/prebuilts/clang/host/linux-x86/clang-${CLANG_VERSION}";
FW_DIR="${SRC_DIR}/vendor/oneplus/firmware";
KERNEL_DIR="${SRC_DIR}/kernel/oneplus/sm7250";
VENDOR_DIR="${SRC_DIR}/vendor/oneplus/avicii";
APPS_DIR="${SRC_DIR}/vendor/oneplus/apps";
CLANG_TAR="https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/+archive/refs/heads/main/clang-${CLANG_VERSION}.tar.gz";
FW_REPO="https://github.com/TAHERHAKIM/android_firmware_oneplus_avicii";
KERNEL_REPO="https://github.com/TAHERHAKIM/kernel_oneplus_avicii";
VENDOR_REPO="https://github.com/TAHERHAKIM/android_vendor_oneplus_avicii_ooscam";
APPS_REPO="https://github.com/TAHERHAKIM/oplus_camera_avicii";

# Dependencies
DEPENDENCIES=( "FW" "KERNEL" "VENDOR" "APPS" );

# Check if the dependency is available in the correct path
function chk_dependencies() {
echo -e "${B}Checking Dependencies...${N}";
for DEPENDENCY in "${DEPENDENCIES[@]}"
do
	if [ ${DEPENDENCY} = "FW" ];
	then	
		DIR="${FW_DIR}";
		REPO="${FW_REPO}";
		NAME="Firmware Images";
	elif [ ${DEPENDENCY} = "KERNEL" ];
	then	
		DIR="${KERNEL_DIR}";
		REPO="${KERNEL_REPO}";
		NAME="Kernel Source";
	elif [ ${DEPENDENCY} = "VENDOR" ];
	then	
		DIR="${VENDOR_DIR}";
		REPO="${VENDOR_REPO}";
		NAME="Vendor Blobs";
	elif [ ${DEPENDENCY} = "APPS" ];
	then	
		DIR="${APPS_DIR}";
		REPO="${APPS_REPO}";
		NAME="OnePlus Apps";
	else
		echo -e "${R}Invalid Dependency${N}";
	fi
	if [ -d ${DIR} ]; 
	then
		echo -e "${G}${NAME} found${N}";
	else
		echo -e "${R}${NAME} not found${N}";
		echo -e "${B}Cloning ${NAME}...${N}";
		bash -c "git clone ${REPO} --depth=1 ${DIR}";
		echo -e "${G}Sucessfully cloned ${NAME}${N}";
	fi
done;
}

chk_dependencies;


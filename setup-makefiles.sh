#!/bin/bash
#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

set -e

export DEVICE=gts7xllite
export DEVICE_COMMON=sm7225-common
export VENDOR=samsung

"./../../${VENDOR}/${DEVICE_COMMON}/setup-makefiles.sh" "$@"

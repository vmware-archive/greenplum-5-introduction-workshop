#!/usr/bin/env bash
###############################################################################################################
# Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
# This program and the accompanying materials are made available under the terms of the under the Apache
# License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software distributed under the License is
# distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and limitations under the License.
###############################################################################################################

###############################################################################
# Library of parameters and functions that must be sourced by any wkshop script.
###############################################################################

this_script=$BASH_SOURCE
CLOUD_DIR=/opt/pivotal/greenplum

#### Parameters ###############################################################
[[ $(id -un) != root ]] && source /usr/local/greenplum-db/greenplum_path.sh

if [ -r ${CLOUD_DIR}/variables.sh ]; then
    source ${CLOUD_DIR}/variables.sh
else
    # Set reasonable defaults for env variables
    CLUSTER_NAME=$(hostname -s)
    CLOUD="unknown"
fi

DATA_DISK=$(ls -d /data[0-9] | awk 'END {print $NF}')
if [[ -z $DATA_DISK ]]; then
    echo "$this_script: Set DATA_DISK in this script. This directory is used as the"
    echo " repository for the downloaded software and db data for the workshop."
    exit 1
fi

WORKSHOP_USER=gpuser
WORKSHOP_DB=$WORKSHOP_USER

HOST_ALL="${CLOUD_DIR}/all_hosts.txt"
if [[ ! -f $HOST_ALL ]]; then
    echo "$this_script: File '$HOST_ALL' not found. Create this file before continuing"
    exit 1
fi

# Get the GP cluster configuration
GP_MASTER_NODE=$(sudo -i -u gpadmin psql -At -c "select distinct(hostname) from gp_segment_configuration where content = -1 and role = 'p' ")
GP_DATA_NODES=( $(sudo -i -u gpadmin psql -At -c 'select distinct(hostname) from gp_segment_configuration where content > -1 order by 1') )

GP_DATA_NODES_COUNT=${#GP_DATA_NODES[@]}

#### Functions ################################################################
function echo_eval()
{
    echo "$@"
    eval "$@"
}

function check_user()
{
    [[ $(id -un) != $1 ]] && { echo "Must be run as $1."; return 1; } || return 0
}

function add_to_sudoers()
{
    ! id -un $1 2>/dev/null && { echo "Unknown user '$1'"; return 1; }

    # Add gpadmin and gpuser to the sudoers file
    SUDO_FILE='/etc/sudoers.d/91-gp-workshop-users'
    echo "$1 ALL=(ALL)       NOPASSWD: ALL" >> $SUDO_FILE
}

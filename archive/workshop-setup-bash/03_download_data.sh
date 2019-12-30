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

#############################################################################################
# Executed by the root user.
#
# Configure an AWS Greenplum cluster for the Greenplum workshop.
# The following activites are performed in this script:
# - Create a $HOME/.psqlrc file for the gpuser account.
# - Download the FAA fact and dimension data files
# - Download the workshop exercises if necessary
#############################################################################################

set -o nounset

source ./00_common_functions.sh
source /usr/local/greenplum-db/greenplum_path.sh

echo_eval "check_user root"
[[ $? == 1 ]] && exit 1

HOME="/home/${WORKSHOP_USER}"
PSQLRC="/${HOME}/.psqlrc"
echo_eval "touch ${PSQLRC}"
cat << _CMDS_ >> "${PSQLRC}"
-- Added for GP workshop
\pset null NULL
\timing on
\set ECHO all
set search_path = faa, madlib, public;
_CMDS_

echo_eval "chown ${WORKSHOP_USER} ${PSQLRC}"

SRC="https://s3.amazonaws.com/gp-demo-workshop"
WORKSHOP_DATA="/${HOME}/data/faa"
echo_eval "mkdir -p ${WORKSHOP_DATA}"

# Download the data for on time performance table (the "fact" table)
for yr in $(seq 2008 2010)
do
    for mnth in $(seq 1 12)
    do
        FILE=On_Time_On_Time_Performance_${yr}_${mnth}.csv.bz2
        echo_eval "wget --quiet ${SRC}/data/faa/${FILE} -O ${WORKSHOP_DATA}/${FILE}"
    done
done
FACT_FILES="On_Time_On_Time_Performance_2011_1.csv.bz2 On_Time_On_Time_Performance_2011_2.csv.bz2"

# Download the data for the supporting metadata tables (the "dimension" tables)
DIM_FILES_1="L_AIRLINE_ID.csv L_AIRPORTS.csv L_DISTANCE_GROUP_250.csv"
DIM_FILES_2="L_PILOTS.csv L_WORLD_AREA_CODES.csv L_ONTIME_DELAY_GROUPS.csv"
for FILE in ${FACT_FILES} ${DIM_FILES_1} ${DIM_FILES_2}
do
    echo_eval "wget --quiet ${SRC}/data/faa/${FILE} -O ${WORKSHOP_DATA}/${FILE}"
done

# Download and extract the exercises if they are not already there
if [[ ! -d ${HOME}/Workshop ]]; then
    ExercisesTar="GP-Workshop-Exercises.tgz"
    echo_eval "wget ${SRC}/${ExercisesTar} -O /${HOME}/${ExercisesTar}"
    echo_eval "cd /${HOME}; tar xzf ${ExercisesTar}"
fi

echo_eval "chmod -R u+rw $(dirname ${WORKSHOP_DATA})"
echo_eval "chown -R ${WORKSHOP_USER}:users /${HOME}"

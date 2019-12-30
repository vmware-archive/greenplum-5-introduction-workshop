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

#####################################################################################
# Get the latest version of the Greenplum workshop from the github repo and install
# on the GP master server. The intended use of this utility is to:
#  1. Copy it to the master via scp
#  2. Execute it via a remote SSH session:
#     $ ssh -i <PEM> gpadmin@<GP_MASTER> -c 'bash ./install_workshop.sh'
#
# Currently this utility does not download the FAA data files needed. That is
# still handled in the workshop_setup/03_run_as_root.sh script.
#####################################################################################

GIT_WORKSHOP="https://github.com/Pivotal-Data-Engineering/greenplum-workshop/archive/master.zip"
ZIPFILE="/tmp/workshop.zip"
SETUP="greenplum-workshop-master/workshop-setup"
EXERCISES="greenplum-workshop-master/workshop-exercises"

set -o nounset
#trap read debug

wget -O $ZIPFILE $GIT_WORKSHOP
chmod go+rw $ZIPFILE

unzip $ZIPFILE $SETUP/*
mv $SETUP /home/gpadmin
rm -rf /home/gpadmin/greenplum-workshop-master

sudo su - gpuser << EOF
unzip $ZIPFILE $EXERCISES/Workshop/*
unzip $ZIPFILE $EXERCISES/recreate_faa_db.sh
mv $EXERCISES/Workshop /home/gpuser
mv $EXERCISES/recreate_faa_db.sh /home/gpuser
rm -rf /home/gpuser/greenplum-workshop-master
EOF

rm -f $ZIPFILE

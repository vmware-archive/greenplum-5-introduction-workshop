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
# Execute as the gpadmin user
#
# Start Zookeeper and GPText. Add schema to databases.
#############################################################################################

source ./00_common_functions.sh

echo_eval "check_user gpadmin"

GPTEXT_ENV="/usr/local/greenplum-text/greenplum-text_path.sh"
if [[ ! -f $GPTEXT_ENV ]]; then
    echo "$0: Run 02a_gptext_install_1.sh script before proceeding. Exiting."
    exit 1
fi

source $GPTEXT_ENV

# Check if zookeeper is running
echo_eval "zkManager state &> /dev/null"
if [[ $? != 0 ]]; then
    echo "$0: ZooKeeper does not appear to be running. Let's try and start it"
    echo_eval "zkManager start"
    [[ $? != 0 ]] && { echo "$0: Problems starting zkManager" ; exit 1; }
fi

# Installing GPText schema in the gpuser database
# Make sure it has been created first.

echo_eval "psql -At -d $WORKSHOP_USER -c 'select 1' &> /dev/null"
if [[ $? != 0 ]]; then
    echo "$0: $WORKSHOP_USER database not found. Create the db before proceeding"
    echo "Execute as gpadmin >>  createdb $WORKSHOP_USER --owner $WORKSHOP_USER <<"
    exit 1
fi

echo_eval "gptext-installsql gpadmin $WORKSHOP_USER"
echo_eval "gptext-start"

echo "psql -d $WORKSHOP_USER -e "
psql -d $WORKSHOP_USER -e  << _EOF
GRANT USAGE ON SCHEMA gptext TO $WORKSHOP_USER;
GRANT SELECT ON gptext.gptext_envs TO $WORKSHOP_USER;
_EOF

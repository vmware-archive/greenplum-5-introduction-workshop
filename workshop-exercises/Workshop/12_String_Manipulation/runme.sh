if [ $USER != gpuser ]; then
###############################################################################################################
# Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
# This program and the accompanying materials are made available under the terms of the under the Apache
# License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software distributed under the License is
# distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and limitations under the License.
###############################################################################################################
   echo “You are $USER.  This script must be run as gpuser” 2>&1
   exit 1
fi

PSQL_CMD="psql -eE -d ${PGDATABASE:-gpuser} -f"

echo -e \\nCreate the staging and survey tables ...
$PSQL_CMD 01_create_survey_tbls.sql
read -p "Press enter to continue"

echo -e \\nLoad the staging table ...
$PSQL_CMD 02_load_stage_tbl.sql
read -p "Press enter to continue"

echo -e \\nLoad from the staging table to the survey table ...
$PSQL_CMD 03_load_from_staging.sql
read -p "Press enter to continue"

echo -e \\nRun a sample query ...
$PSQL_CMD 04_sample_query.sql

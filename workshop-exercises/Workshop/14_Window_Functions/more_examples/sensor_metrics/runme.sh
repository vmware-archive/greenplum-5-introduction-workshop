clear
###############################################################################################################
# Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
# This program and the accompanying materials are made available under the terms of the under the Apache
# License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software distributed under the License is
# distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and limitations under the License.
###############################################################################################################
psql -f 01_create_tbls.sql
echo
read -p "Hit enter to continue"
echo '--------------------------------------------------------------------------------'
psql -f 02_load_data.sql
echo
read -p "Hit enter to continue"
echo '--------------------------------------------------------------------------------'
psql -f 03_create_date_trunc_udfs.sql
echo
read -p "Hit enter to continue"
echo '--------------------------------------------------------------------------------'
psql -f q_first_cut.sql
echo
read -p "Hit enter to continue"
echo '--------------------------------------------------------------------------------'
psql -f q_5min_increments.sql
echo
read -p "Hit enter to continue"
echo '--------------------------------------------------------------------------------'
psql -f q_5_last_value.sql
echo
read -p "Hit enter to continue"
echo '--------------------------------------------------------------------------------'
psql -f q_5_last_value2.sql
echo
read -p "Hit enter to continue"
echo '--------------------------------------------------------------------------------'
psql -f q_avg.sql
echo
read -p "Hit enter to continue"
echo '--------------------------------------------------------------------------------'
psql -f q_avg2.sql
echo
read -p "Hit enter to continue"
echo '--------------------------------------------------------------------------------'
psql -v incr=10 -f q_xmin_incrs.sql
echo '--------------------------------------------------------------------------------'

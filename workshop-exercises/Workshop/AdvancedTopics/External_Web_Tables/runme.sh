psql -f 01_create_quake_table.sql
###############################################################################################################
# Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
# This program and the accompanying materials are made available under the terms of the under the Apache
# License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software distributed under the License is
# distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and limitations under the License.
###############################################################################################################
read -p "press enter to continue"
sudo su gpadmin -c "source /usr/local/greenplum-db/greenplum_path.sh; PGPORT=6432 psql -d gpuser -f 02_create_ext_web_table.sql "
read -p "press enter to continue"
psql -f 03_insert_data.sql
read -p "press enter to continue"


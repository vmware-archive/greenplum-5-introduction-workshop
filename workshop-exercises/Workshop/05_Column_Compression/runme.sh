psql -f 01_create_fact_table_col.sql
###############################################################################################################
# Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
# This program and the accompanying materials are made available under the terms of the under the Apache
# License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software distributed under the License is
# distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and limitations under the License.
###############################################################################################################
read -p "Press enter to continue"
psql -f 02_create_fact_table_col_compress5.sql
read -p "Press enter to continue"
psql -f 03_create_fact_table_col_quicklz.sql
read -p "Press enter to continue"
psql -f 04_load_column_tables.sql
read -p "Press enter to continue"
psql -f 05_table_size_otp.sql
read -p "Press enter to continue"
psql -f 06_delay_from_Logan_col_all.sql
read -p "Press enter to continue"
psql -f 07_lots_of_cols.sql
read -p "Press enter to continue"
psql -f 08_few_cols.sql

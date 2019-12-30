psql -f 01_create_week_partitioned_table.sql
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
psql -f 02_load_week_partitioned_table.sql
read -p "Press enter to continue"
psql -f 03_show_week_partitions.sql
read -p "Press enter to continue"
psql -f 04_delay_from_Logan_week.sql
read -p "Press enter to continue"
psql -f 05_create_month_partitioned_table.sql
read -p "Press enter to continue"
psql -f 06_load_month_partitioned_table.sql
read -p "Press enter to continue"
psql -f 07_show_month_partitions.sql
read -p "Press enter to continue"
psql -f 08_delay_from_Logan_all.sql


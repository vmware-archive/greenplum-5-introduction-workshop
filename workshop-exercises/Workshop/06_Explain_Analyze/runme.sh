psql -f 01_explain.sql
###############################################################################################################
# Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
# This program and the accompanying materials are made available under the terms of the under the Apache
# License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software distributed under the License is
# distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and limitations under the License.
###############################################################################################################
read -p 'Press enter to continue'
psql -f 02_explain.sql
read -p 'Press enter to continue'
psql -f 03_explain.sql
read -p 'Press enter to continue'
psql -f 04_explain.sql
read -p 'Press enter to continue'
psql -f 05_explain_and_analyze.sql
read -p 'Press enter to continue'
psql -f 06_explain_analyze_query_row_storage.sql
read -p 'Press enter to continue'
psql -f 07_explain_analyze_query_row_partition.sql
read -p 'Press enter to continue'
psql -f 08_explain_analyze_query_column_storage.sql
read -p 'Press enter to continue'
psql -f 09_explain_analyze_query_column_compressed.sql

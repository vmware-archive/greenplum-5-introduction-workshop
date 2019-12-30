/* *******************************************************************************************************
Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
This program and the accompanying materials are made available under the terms of the under the Apache
License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is
distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
******************************************************************************************************* */
set search_path=information_schema, pg_catalog, gp_toolkit;
select * from information_schema.views where table_schema='information_schema'

SELECT table_catalog, table_schema, table_name, table_type FROM information_schema.tables ORDER BY table_name;

SELECT table_catalog, table_schema, table_name, table_type FROM information_schema.tables where table_schema = 'faa' ORDER BY table_name;

SELECT * FROM information_schema.schemata ORDER BY schema_name;

SELECT table_schema, table_name, column_name, column_default, is_nullable FROM information_schema.columns WHERE table_schema = 'faa' AND table_name = 'otp_r' AND  data_type = 'time without time zone';



SELECT ordinal_position, tab_columns.column_name, data_type, character_maximum_length,
numeric_precision, is_nullable, tab_constraints.constraint_type, col_constraints.constraint_name,
col_check_constraints.check_clause
FROM information_schema.columns AS tab_columns
LEFT OUTER JOIN
information_schema.constraint_column_usage AS col_constraints
ON tab_columns.table_name = col_constraints.table_name AND
tab_columns.column_name = col_constraints.column_name
LEFT OUTER JOIN
information_schema.table_constraints AS tab_constraints
ON tab_constraints.constraint_name = col_constraints.constraint_name
LEFT OUTER JOIN
information_schema.check_constraints AS col_check_constraints
ON col_check_constraints.constraint_name = tab_constraints.constraint_name
WHERE tab_columns.table_name = 'otp_r' AND tab_columns.table_schema = 'faa'
 ORDER BY ordinal_position;


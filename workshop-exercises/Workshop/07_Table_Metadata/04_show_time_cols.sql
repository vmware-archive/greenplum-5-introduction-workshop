/* *******************************************************************************************************
Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
This program and the accompanying materials are made available under the terms of the under the Apache
License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is
distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
******************************************************************************************************* */
-- set search_path=information_schema, pg_catalog, gp_toolkit;
SELECT table_schema, table_name, column_name, column_default, is_nullable, data_type
FROM information_schema.columns
WHERE table_schema = 'faa'
  AND table_name = 'otp_r'
  AND data_type like 'time%'
  -- AND data_type = 'time without time zone'
;

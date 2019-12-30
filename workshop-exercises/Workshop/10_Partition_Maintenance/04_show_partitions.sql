/* *******************************************************************************************************
Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
This program and the accompanying materials are made available under the terms of the under the Apache
License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is
distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
******************************************************************************************************* */
SELECT
       schemaname || '.' || tablename as "Schema.Table"
      ,partitiontablename as "PartTblName"
      ,partitiontype as "Type"
      ,split_part(partitionrangestart, '::', 1) as "Start"
      ,split_part(partitionrangeend, '::', 1) as "End"
      ,case relstorage
           when 'h' then 'heap'
           when 'x' then 'external'
           when 'c' then 'column'
           else 'other'
       end as "Storage"
FROM
     pg_partitions p JOIN pg_class c on p.partitiontablename = c.relname
WHERE
      tablename = 'otp_rpm'
  AND schemaname = 'faa'
;

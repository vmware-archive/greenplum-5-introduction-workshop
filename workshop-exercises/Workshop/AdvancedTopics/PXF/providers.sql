/* *******************************************************************************************************
Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
This program and the accompanying materials are made available under the terms of the under the Apache
License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is
distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
******************************************************************************************************* */
DROP EXTERNAL TABLE if exists public.pxf_read_providers_parquet ;

CREATE EXTERNAL TABLE public.pxf_read_providers_parquet
(
  provider_id text,
  provider_name text,
  specialty text,
  address_street text,
  address_city text,
  address_state text,
  address_zip text

)
LOCATION ('pxf://user/hive/warehouse/providers.parquet?PROFILE=hdfs:parquet')
FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');

select count(*) from public.pxf_read_providers_parquet;
select * from public.pxf_read_providers_parquet order by provider_id  limit 10;

drop external table if exists public.providers_csv;
create external table public.providers_csv (
  provider_id text,
  provider_name text,
  specialty text,
  address_street text,
  address_city text,
  address_state text,
  address_zip text
)
LOCATION ('pxf://tmp/data/providers/providers_part1.csv?PROFILE=hdfs:text')
FORMAT 'CSV' (HEADER QUOTE '"' delimiter ',' )
;
select count(*) from public.providers_csv;
select * from public.providers_csv order by provider_id limit 10;

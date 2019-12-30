/* *******************************************************************************************************
Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
This program and the accompanying materials are made available under the terms of the under the Apache
License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is
distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
******************************************************************************************************* */
set client_min_messages to warning;

create or replace function row_count(p_schemaname text) returns text  as
$$
declare
v_tables record;
v_names text;
v_count integer;
v_test text;
begin
  v_names = '';
  for v_tables in SELECT * from pg_stat_user_tables where schemaname = p_schemaname LOOP
     execute 'select count(*) from ' || v_tables.schemaname || '.' || v_tables.relname into v_count;
     v_names = v_names || ' ' ||v_tables.relname || ' ' || v_count||E'\n';
  END LOOP;
  RETURN v_names;
end;
$$
language plpgsql stable ;

drop schema if exists demo;
create schema demo;
create table demo.airlines as select * from faa.d_airlines;
create table demo.airports as select * from faa.d_airports;

select row_count('demo');
drop schema demo cascade;

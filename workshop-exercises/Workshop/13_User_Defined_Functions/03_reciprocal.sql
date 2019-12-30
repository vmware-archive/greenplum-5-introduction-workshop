/* *******************************************************************************************************
Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
This program and the accompanying materials are made available under the terms of the under the Apache
License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is
distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
******************************************************************************************************* */
select (1.0/0.0);

create or replace function reciprocal(p_num float) returns float as
$$
declare
begin
  return (1.0/p_num);
  exception when DIVISION_BY_ZERO   then return ('NaN'::float8);
end;
$$
language plpgsql immutable ;

select reciprocal(2.0);
select reciprocal(-4.0);
select (1.0/0.0);
select reciprocal (0.0);


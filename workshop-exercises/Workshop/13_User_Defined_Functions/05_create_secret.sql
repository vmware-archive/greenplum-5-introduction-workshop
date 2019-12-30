/* *******************************************************************************************************
Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
This program and the accompanying materials are made available under the terms of the under the Apache
License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is
distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
******************************************************************************************************* */
drop table if exists public.secret;
create table public.secret (
  id int,
  value float
)
distributed randomly;

insert into public.secret values (1,1.1), (2,2.2), (3,3.3);

select * from public.secret;

create or replace function public.secret_sum() returns float as
$$
    select sum(value) from public.secret;
$$ 
language sql stable security definer;

grant execute on function public.secret_sum() to gpuser;

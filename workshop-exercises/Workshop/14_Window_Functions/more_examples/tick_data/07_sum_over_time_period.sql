/* *******************************************************************************************************
Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
This program and the accompanying materials are made available under the terms of the under the Apache
License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is
distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
******************************************************************************************************* */
\i ../00_init.sql
\pset null ''

/**********************************************************************
 How do we find the logical value of the counter over an arbitrary
 time period? 
 We need to find the value at the beginning of the period and subtract
 it from the logical sum of counts over the period.
 **********************************************************************/

with t as
( select tick, nb,
       first_value (nb) over ( w ) as first,
       case when lead(nb) over ( w ) < nb
            then nb
            when lead(nb) over ( w ) is null
            then nb
            else null
       end as max
  from measures
  where tick >= 4 and tick < 14   -- our arbitrary time period
  window w as (order by tick)
)
select sum(max) - min(first) as sum from t where max is not null
;

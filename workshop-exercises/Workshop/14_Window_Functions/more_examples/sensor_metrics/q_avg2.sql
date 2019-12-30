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

/***********************************************************************
 * Return the avg value in 5 minutes windows.
 ***********************************************************************/

select measure_ts, avg_value::numeric(6,2) as "Avg_Value"
from (
    select
       date_trunc_5mins (measure_ts) measure_ts,
       AVG(measure_value)
           OVER ( PARTITION BY date_trunc_5mins (measure_ts) ) as avg_value
    from metrics
    where vehicle_id = 1
      and measure_ts between '2010-10-11 09:00:00'::timestamp
                         and '2010-10-11 16:00:00'::timestamp
) as a
group by measure_ts, avg_value
order by measure_ts
limit 10
;

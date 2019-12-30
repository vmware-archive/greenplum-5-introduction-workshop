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
 * Return the last value in X minutes windows.
 ***************
 * First attempt at using a user defined function to truncate the
 * timestamp to the desired resolution in minutes.
 * From a bit of testing, the cost of flexibility is at the expense of
 * performance. This version is ~4x slower than calling date_part() and
 * date_trunc() directly.
 ***********************************************************************/

select measure_ts, lv
from (
    select 
       date_trunc_mins (measure_ts, :incr) measure_ts,
       first_value(measure_value)
           over (partition by date_trunc_mins (measure_ts, :incr)
                 order by measure_ts desc
                ) as lv
    from metrics
    where vehicle_id = 1
      and measure_ts between '2010-10-11 09:00:00'::timestamp
                         and '2010-10-11 16:00:00'::timestamp
) as a
group by measure_ts, lv
order by measure_ts
limit 15
;

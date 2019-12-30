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

/****************************************************************************
 * Perform a date_trunc() using a user specified resolution in minutes.
 * Allows the user to specify the minute designation to 'round down to'.
 *
 * Example usage: select date_trunc_min (now(), 10);
 ****************************************************************************/

create or replace function date_trunc_mins(my_ts timestamp, x_mins int)
  returns timestamp as
$$
declare
     new_time timestamp;
     mod_value int := 0;
begin

    select date_part('minute', my_ts)::int % x_mins into mod_value;
    if mod_value = 0 then
        select date_trunc('minute', my_ts) into new_time;
    else
        execute  'select date_trunc ('
            || quote_literal('hour') || ','
            || quote_literal(my_ts) || '::timestamp' 
            || ') + '
            || 'date_part(' || quote_literal('minute') || ','
            || quote_literal(my_ts) || '::timestamp'
            || ')::int / ' || x_mins
            || ' * interval ' || quote_literal(x_mins || ' min')
            into new_time
        ;
    end if;

    return new_time;
end;
$$ LANGUAGE plpgsql;

/****************************************************************************
 * Perform a date_trunc() using a 5 minute resolution.
 * Less flexible, but faster version, of the date_trunc_min() UDF above.
 *
 * Example usage: select date_trunc_5min (now());
 ****************************************************************************/

create or replace function date_trunc_5mins(timestamp)
  returns timestamp as
$$
   select date_trunc ('hour', $1) +
          date_part('minute', $1)::int / 5 * interval '5 min'
        as result
    ;
$$ LANGUAGE SQL;

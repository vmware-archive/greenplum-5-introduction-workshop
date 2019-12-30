/* *******************************************************************************************************
Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
This program and the accompanying materials are made available under the terms of the under the Apache
License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is
distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
******************************************************************************************************* */
drop type if exists nearby_airports;
create type nearby_airports as (airport_code text, distance float8);

create or replace function find_nearest (code text, top_n integer)
   returns setof nearby_airports as 
$$
   SELECT t2.name AS ap1, ST_Distance(t1.location, t2.location)/1000.0 AS mindist
   FROM d_airports t1, d_airports t2
   WHERE t1.airport_code = $1
     AND t1.airport_code != t2.airport_code
     AND length(t2.airport_code) != 0 
     AND t2.airport_code in (select distinct(dest) from otp_r)
   ORDER BY ST_Distance(t1.location, t2.location)
   LIMIT $2;
$$
language sql;

create or replace function find_nearest(code text, dist float)
   returns setof nearby_airports as
$$
   SELECT t2.name AS ap1, ST_Distance(t1.location, t2.location)/1000.0 AS mindist
   FROM d_airports t1, d_airports t2
   WHERE t1.airport_code = $1
     AND t1.airport_code != t2.airport_code
     AND length(t2.airport_code) != 0
     AND ST_Distance(t1.location, t2.location) <= $2 * 1000.0
     AND t2.airport_code in (select distinct(dest) from otp_r)
     ORDER BY ST_Distance (t1.location, t2.location)
$$
language sql;

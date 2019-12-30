/* *******************************************************************************************************
Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
This program and the accompanying materials are made available under the terms of the under the Apache
License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is
distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
******************************************************************************************************* */
/*********************************************************************************
 State transition function [sfunc] needs to be created before defining aggregate.

 Two components needed to be calculated in the state function: count and sum.
 The function accumulates count and sum as values are passed to it.
*********************************************************************************/

CREATE or REPLACE function float8_sfunc_for_avg(arr float8[], val float8)
RETURNS float8[] AS
$$
BEGIN
   --   create count and sum, place the two values into an array
   if val is null then return ARRAY [arr[1], arr[2]]::float[];
                  else return ARRAY [arr[1]+1, arr[2]+val]::float[];
   end if;
END;
$$
LANGUAGE 'plpgsql' IMMUTABLE;

/*********************************************************************************
 Final function [finalfunc] needs to be created before defining aggregate.

 The final function calculates the mean: sum / count.
*********************************************************************************/

CREATE or REPLACE function float8_avg(val float8[])
RETURNS float8 AS
$$
BEGIN
   return val[2] / val[1];  --  sum / count
END;
$$
LANGUAGE 'plpgsql' IMMUTABLE;

/*********************************************************************************
 Create the aggrate function.
*********************************************************************************/

CREATE AGGREGATE avg_uda (float8)
(
  sfunc = float8_sfunc_for_avg, -- state function calculates count of records (count+=1)
                                -- and running sum (sum+=value)
  stype = float8[],             -- state variable type = float8
  finalfunc = float8_avg,       -- final function to calculate average (sum / count)
  initcond = '{0,0}'            -- initial condition, an array where count, sum are stored
);

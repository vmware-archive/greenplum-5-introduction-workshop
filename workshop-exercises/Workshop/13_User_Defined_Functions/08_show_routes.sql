/* *******************************************************************************************************
Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
This program and the accompanying materials are made available under the terms of the under the Apache
License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is
distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
******************************************************************************************************* */
create or replace function show_routes (int /* limit */ ) returns setof route as 
$$
   SELECT f.origin AS origin_airport, f.dest AS dest_airport, f.carrier AS airline_name
   FROM  otp_r f
   GROUP by 1,2,3
   ORDER BY 1,2,3
   LIMIT $1;
$$
language sql;
select show_routes(20);

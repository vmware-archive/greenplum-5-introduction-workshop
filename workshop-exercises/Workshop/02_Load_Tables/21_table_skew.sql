/* *******************************************************************************************************
Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
This program and the accompanying materials are made available under the terms of the under the Apache
License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is
distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
******************************************************************************************************* */
SELECT  gp_segment_id, count(*)
FROM faa.otp_r
GROUP BY gp_segment_id ORDER BY gp_segment_id;

\echo '\nWhy all this skew?\n'
select count(distinct(airlineid)) from faa.otp_r;
select airlineid, count(*) 
from faa.otp_r group by airlineid order by 2;

select count(distinct(flightnum)) from faa.otp_r;

/* *******************************************************************************************************
Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
This program and the accompanying materials are made available under the terms of the under the Apache
License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is
distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
******************************************************************************************************* */
update demo.unemp 
set mv5 = foo.mv5 
from (
   select month,
          AVG(unrate) OVER(ORDER BY month ROWS BETWEEN 4 PRECEDING AND CURRENT ROW  ) as mv5
   from demo.unemp) foo
where unemp.month = foo.month;

update demo.unemp 
set mv12 = foo.mv12 
from (
   select month,
          AVG(unrate) OVER(ORDER BY month ROWS BETWEEN 11 PRECEDING AND CURRENT ROW) as mv12
   from demo.unemp) foo
where unemp.month = foo.month;

select month, unrate, mv5::numeric(6,2), mv12::numeric(6,2)
from demo.unemp
order by month desc
limit 30;

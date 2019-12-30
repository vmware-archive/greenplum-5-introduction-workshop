/* *******************************************************************************************************
Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
This program and the accompanying materials are made available under the terms of the under the Apache
License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is
distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
******************************************************************************************************* */
SELECT al1.airport_code, al1.name, ST_Distance(al1.location, al2.location)/1000.0 as dist_km  
FROM d_airports al1, d_airports al2 
WHERE al1.airport_code != al2.airport_code  
  AND ST_Distance(al1.location, al2.location) > 0 
  AND al2.airport_code = 'BOS' 
  AND al1.airport_code in (SELECT distinct(dest) from otp_r)
ORDER BY ST_Distance(al1.location, al2.location)
LIMIT 3;

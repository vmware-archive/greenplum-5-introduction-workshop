/* *******************************************************************************************************
Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
This program and the accompanying materials are made available under the terms of the under the Apache
License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is
distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
******************************************************************************************************* */
create or replace function distance_between(text, text) returns float as
$$
SELECT  ST_Distance(loc1, loc2, true)/1000.0 As sphere_dist 
   FROM (SELECT 
           get_loc($1) as loc1,
           get_loc($2) as loc2
	) as a  ;
$$
LANGUAGE SQL;

/* *******************************************************************************************************
Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
This program and the accompanying materials are made available under the terms of the under the Apache
License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is
distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
******************************************************************************************************* */
/***************************************************
 Take some measure as if they came from a counter,
 starting at 0. A reset is indicated when the nb
 value drops from one tick to the next.
 We calculate the total usage by (40 + 60 = 100)
***************************************************/

\i ../00_init.sql
\set tblname measures

drop table if exists :tblname;
create table :tblname
(
    tick int,
    nb   int
)
distributed randomly
;

insert into :tblname
values
   (1, 0), (2, 10), (3, 20), (4, 30), (5, 40),
   (6, 0), (7, 20), (8, 30), (9, 60)
;

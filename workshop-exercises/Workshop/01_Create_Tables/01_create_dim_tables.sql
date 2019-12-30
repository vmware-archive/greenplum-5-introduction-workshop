/* *******************************************************************************************************
Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
This program and the accompanying materials are made available under the terms of the under the Apache
License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is
distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
******************************************************************************************************* */
drop table if exists faa.d_airports;
create table faa.d_airports (
    AirportID      integer, 
    Name           text,
    City           text,
    Country        text,
    airport_code   text,
    ICOA_code      text, 
    Latitude       float8,
    Longitude      float8, 
    Altitude       float8,
    TimeZoneOffset float,
    DST_Flag       text ,
    TZ             text
)
distributed randomly;

drop table if exists faa.d_wac;
create table faa.d_wac (wac smallint, area_desc text)
distributed randomly;

drop table if exists faa.d_airlines;
create table faa.d_airlines (airlineid integer, airline_desc text)
distributed by(airlineid);

drop table if exists faa.d_cancellation_codes;
create table faa.d_cancellation_codes (cancel_code text, cancel_desc text)
distributed randomly;

drop table if exists faa.d_delay_groups;
create table faa.d_delay_groups (delay_group_code text, delay_group_desc text)
distributed randomly;

drop table if exists faa.d_distance_groups;
create table faa.d_distance_groups (distance_group_code text, distance_group_desc text)
distributed randomly;

/* *******************************************************************************************************
Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
This program and the accompanying materials are made available under the terms of the under the Apache
License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is
distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
******************************************************************************************************* */
\i 00_init.sql

drop sequence if exists public.timeseries_x_seq cascade;

drop table if exists :tbl_name;
create table :tbl_name
(
    lot_id varchar,
    ts     timestamp,
    x      serial
)
distributed randomly
;

insert into :tbl_name
values
('lot01', now() + random() * interval '1 second', nextval('timeseries_x_seq')),
('lot01', now() + random() * interval '1 second', nextval('timeseries_x_seq')),
('lot01', now() + random() * interval '1 second', nextval('timeseries_x_seq')),
('lot01', now() + random() * interval '1 second', nextval('timeseries_x_seq')),
('lot01', now() + random() * interval '1 second', nextval('timeseries_x_seq')),
('lot01', now() + random() * interval '1 second', nextval('timeseries_x_seq')),
('lot01', now() + random() * interval '1 second', nextval('timeseries_x_seq')),
('lot01', now() + random() * interval '1 second', nextval('timeseries_x_seq')),
('lot01', now() + random() * interval '1 second', nextval('timeseries_x_seq')),
('lot01', now() + random() * interval '1 second', nextval('timeseries_x_seq')),
('lot01', now() + random() * interval '1 second', nextval('timeseries_x_seq'))
;

insert into :tbl_name
values
('lot02', now() + random() * interval '999 millisecond', nextval('timeseries_x_seq')),
('lot02', now() + random() * interval '999 millisecond', nextval('timeseries_x_seq')),
('lot02', now() + random() * interval '999 millisecond', nextval('timeseries_x_seq')),
('lot02', now() + random() * interval '999 millisecond', nextval('timeseries_x_seq')),
('lot02', now() + random() * interval '999 millisecond', nextval('timeseries_x_seq')),
('lot02', now() + random() * interval '999 millisecond', nextval('timeseries_x_seq')),
('lot02', now() + random() * interval '999 millisecond', nextval('timeseries_x_seq')),
('lot02', now() + random() * interval '999 millisecond', nextval('timeseries_x_seq')),
('lot02', now() + random() * interval '999 millisecond', nextval('timeseries_x_seq')),
('lot02', now() + random() * interval '999 millisecond', nextval('timeseries_x_seq')),
('lot02', now() + random() * interval '999 millisecond', nextval('timeseries_x_seq')),
('lot02', now() + random() * interval '999 millisecond', nextval('timeseries_x_seq')),
('lot02', now() + random() * interval '999 millisecond', nextval('timeseries_x_seq')),
('lot02', now() + random() * interval '999 millisecond', nextval('timeseries_x_seq')),
('lot02', now() + random() * interval '999 millisecond', nextval('timeseries_x_seq')),
('lot02', now() + random() * interval '999 millisecond', nextval('timeseries_x_seq')),
('lot02', now() + random() * interval '999 millisecond', nextval('timeseries_x_seq')),
('lot02', now() + random() * interval '999 millisecond', nextval('timeseries_x_seq')),
('lot02', now() + random() * interval '999 millisecond', nextval('timeseries_x_seq')),
('lot02', now() + random() * interval '999 millisecond', nextval('timeseries_x_seq')),
('lot02', now() + random() * interval '999 millisecond', nextval('timeseries_x_seq')),
('lot02', now() + random() * interval '999 millisecond', nextval('timeseries_x_seq')),
('lot02', now() + random() * interval '999 millisecond', nextval('timeseries_x_seq')),
('lot02', now() + random() * interval '999 millisecond', nextval('timeseries_x_seq')),
('lot02', now() + random() * interval '999 millisecond', nextval('timeseries_x_seq'))
;


insert into :tbl_name
values
('lot03', now() + random() * interval '532 millisecond', nextval('timeseries_x_seq')),
('lot03', now() + random() * interval '532 millisecond', nextval('timeseries_x_seq')),
('lot03', now() + random() * interval '532 millisecond', nextval('timeseries_x_seq')),
('lot03', now() + random() * interval '532 millisecond', nextval('timeseries_x_seq')),
('lot03', now() + random() * interval '532 millisecond', nextval('timeseries_x_seq')),
('lot03', now() + random() * interval '532 millisecond', nextval('timeseries_x_seq')),
('lot03', now() + random() * interval '532 millisecond', nextval('timeseries_x_seq'))
;





/*
SELECT *
FROM generate_series(now()::timestamp,
                     now() + interval '10 seconds',
		     '1 milliseconds')
order by random()
;
*/

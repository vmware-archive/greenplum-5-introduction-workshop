/* *******************************************************************************************************
Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
This program and the accompanying materials are made available under the terms of the under the Apache
License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is
distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
******************************************************************************************************* */
DROP TABLE IF EXISTS public.wwearthquakes_lastwk;
CREATE TABLE public.wwearthquakes_lastwk (
  time TEXT,
  latitude numeric,
  longitude numeric,
  depth numeric,
  mag numeric,
  mag_type varchar (10),
  NST integer,
  gap numeric,
  dmin numeric,
  rms text,
  net text,
  id text,
  updated TEXT,
  place varchar(150),
  type varchar(50),
  horizontalError numeric,
  depthError numeric,
  magError numeric,
  magNst integer,
  status text,
  locationSource text,
  magSource text
)
DISTRIBUTED BY (time);

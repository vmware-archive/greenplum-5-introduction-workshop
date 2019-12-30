/* *******************************************************************************************************
Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
This program and the accompanying materials are made available under the terms of the under the Apache
License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is
distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
******************************************************************************************************* */
drop table if exists faa.otp_r;
CREATE TABLE faa.otp_r  (
   Flt_Year              SMALLINT,
   Flt_Quarter           SMALLINT,
   Flt_Month             SMALLINT,
   Flt_DayofMonth        SMALLINT,
   Flt_DayOfWeek         SMALLINT,
   FlightDate            DATE,
   UniqueCarrier         TEXT,
   AirlineID             INTEGER,  -- FK to d_airlines
   Carrier               TEXT,
   FlightNum             TEXT,
   Origin                TEXT,     -- airport code, FK to d_airports
   OriginCityName        TEXT,
   OriginState           TEXT,
   OriginStateName       TEXT,
   Dest                  TEXT,     -- airport code, FK to d_airports
   DestCityName          TEXT,
   DestState             TEXT,
   DestStateName         TEXT,
   CRSDepTime            time,
   DepTime               time,
   DepDelay              FLOAT8,   -- cast from numeric
   DepDelayMinutes       FLOAT8,   -- cast from numeric
   DepartureDelayGroups  SMALLINT, --FK to d_delay_groups
   TaxiOut               SMALLINT, -- cast from numeric
   WheelsOff             time,
   WheelsOn              time,
   TaxiIn                SMALLINT, -- cast from numeric
   CRSArrTime            time,
   ArrTime               time,
   ArrDelay              FLOAT8,   -- cast from numeric
   ArrDelayMinutes       FLOAT8,   -- cast from numeric
   ArrivalDelayGroups    SMALLINT, -- FK to d_delay_groups
   Cancelled             boolean, -- cast from numeric
   CancellationCode      TEXT,     -- FK to d_cancellation_codes
   Diverted              boolean,
   CRSElapsedTime        INTEGER,  -- cast from numeric
   ActualElapsedTime     FLOAT8,   -- cast from numeric
   AirTime               FLOAT8,   -- cast from numeric
   Flights               SMALLINT, -- cast from numeric, always one
   Distance              FLOAT8,   -- cast from numeric
   DistanceGroup         SMALLINT, -- FK to d_distance_groups
   CarrierDelay          SMALLINT, -- cast from numeric
   WeatherDelay          SMALLINT, -- cast from numeric
   NASDelay              SMALLINT, -- cast from numeric
   SecurityDelay         SMALLINT, -- cast from numeric
   LateAircraftDelay     SMALLINT  -- cast from numeric
) 
DISTRIBUTED BY (AirlineID);


/* *******************************************************************************************************
Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
This program and the accompanying materials are made available under the terms of the under the Apache
License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is
distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
******************************************************************************************************* */
\set tblname faa.otp_rle

drop table if exists :tblname;
CREATE TABLE :tblname  (
   Flt_Year              SMALLINT,
   Flt_Quarter           SMALLINT,
   Flt_Month             SMALLINT,
   Flt_DayofMonth        SMALLINT,
   Flt_DayOfWeek         SMALLINT,
   FlightDate            DATE ENCODING (compresstype=RLE_TYPE),
   UniqueCarrier         TEXT,
   AirlineID             INTEGER ENCODING (compresstype=RLE_TYPE),
   Carrier               TEXT,
   FlightNum             TEXT,
   Origin                TEXT,
   OriginCityName        TEXT,
   OriginState           TEXT,
   OriginStateName       TEXT,
   Dest                  TEXT,
   DestCityName          TEXT,
   DestState             TEXT,
   DestStateName         TEXT,
   CRSDepTime            TEXT,
   DepTime               INTEGER,
   DepDelay              FLOAT8,
   DepDelayMinutes       FLOAT8,
   DepartureDelayGroups  SMALLINT,
   TaxiOut               SMALLINT,
   WheelsOff             TEXT,
   WheelsOn              TEXT,
   TaxiIn                SMALLINT,
   CRSArrTime            TEXT,
   ArrTime               TEXT,
   ArrDelay              FLOAT8,
   ArrDelayMinutes       FLOAT8,
   ArrivalDelayGroups    SMALLINT,
   Cancelled             SMALLINT,
   CancellationCode      TEXT,
   Diverted              SMALLINT,
   CRSElapsedTime        INTEGER,
   ActualElapsedTime     FLOAT8,
   AirTime               FLOAT8,
   Flights               SMALLINT,
   Distance              FLOAT8,
   DistanceGroup         SMALLINT,
   CarrierDelay          SMALLINT,
   WeatherDelay          SMALLINT,
   NASDelay              SMALLINT,
   SecurityDelay         SMALLINT,
   LateAircraftDelay     SMALLINT,
   DEFAULT COLUMN ENCODING (compresstype=zlib,
                            compresslevel=5,
                            blocksize=65536)
)
WITH (APPENDONLY=true, ORIENTATION=column)
DISTRIBUTED BY (AirlineID)
;

insert into :tblname select * from otp_r;

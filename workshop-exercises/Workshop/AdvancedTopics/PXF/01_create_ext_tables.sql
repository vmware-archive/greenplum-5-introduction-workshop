/* *******************************************************************************************************
Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
This program and the accompanying materials are made available under the terms of the under the Apache
License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is
distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
******************************************************************************************************* */
CREATE WRITABLE EXTERNAL TABLE pxf_write_airlines_parquet (airlineid integer, airline_desc text)
    LOCATION ('pxf://data/pxf_examples/pxf_parquet?PROFILE=hdfs:parquet')
  FORMAT 'CUSTOM' (FORMATTER='pxfwritable_export');


CREATE EXTERNAL TABLE pxf_read_airlines_parquet(airlineid integer, airline_desc text)
    LOCATION ('pxf://data/pxf_examples/pxf_parquet?PROFILE=hdfs:parquet')
    FORMAT 'CUSTOM' (FORMATTER='pxfwritable_import');


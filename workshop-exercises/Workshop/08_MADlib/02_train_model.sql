/* *******************************************************************************************************
Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
This program and the accompanying materials are made available under the terms of the under the Apache
License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is
distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
******************************************************************************************************* */
drop table if exists faa.flight_output;
drop table if exists faa.flight_output_summary;

select madlib.linregr_train(
'faa.otp_r',
'faa.flight_output',
'arrdelay',
'array[1,depdelay]');

\x on
select * from faa.flight_output;
select * from faa.flight_output_summary;
\x off

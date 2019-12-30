/* *******************************************************************************************************
Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
This program and the accompanying materials are made available under the terms of the under the Apache
License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is
distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
******************************************************************************************************* */
Drop Table if exists faa.otp_rpm;
CREATE TABLE faa.otp_rpm (LIKE faa.otp_r)

PARTITION BY RANGE(FlightDate) 
(
    PARTITION prior_mnths  START ('1900-01-01'::date),
    PARTITION mnth         START ('2008-01-01'::date)
                           END ('2011-12-31'::date) INCLUSIVE
                           EVERY ('1 month'::interval),
    PARTITION future_mnths START ('2012-01-01'::date),
    DEFAULT PARTITION Out_of_Range
);

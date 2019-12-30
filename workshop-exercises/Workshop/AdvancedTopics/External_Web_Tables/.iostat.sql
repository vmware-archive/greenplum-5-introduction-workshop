/* *******************************************************************************************************
Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
This program and the accompanying materials are made available under the terms of the under the Apache
License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is
distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
******************************************************************************************************* */
-- x_iostat:
--
-- An example external web executable table that reads the current
-- iostat utilization stats.
--

DROP EXTERNAL WEB TABLE IF EXISTS public.x_iostat CASCADE;

CREATE EXTERNAL WEB TABLE public.x_iostat
   (   device               VARCHAR
     , tps                  NUMERIC
     , blk_reads_per_sec    NUMERIC
     , blk_writes_per_sec   NUMERIC
     , blk_read             NUMERIC
     , blk_write            NUMERIC
   )
     EXECUTE 'iostat -p sda 1 5 | grep sda | sed -r "s/ +/,/g"' ON ALL
     FORMAT 'CSV'
;

/* *******************************************************************************************************
Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
This program and the accompanying materials are made available under the terms of the under the Apache
License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is
distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
******************************************************************************************************* */
\set ext_tbl public.ext_fixed_format
drop external table if exists :ext_tbl;
create external table :ext_tbl (
    id        numeric,   -- relative order of var in sequence
    scf_var   varchar,   -- SCF variable name
    mivn      varchar,   -- MR Interview variable name
    var_ind   varchar,   -- numeric/character variable indicator
    var_evr   varchar,   -- flag for extended verbatim response
    var_label text
)
   LOCATION ('gpfdist://gpdb-sandbox:8081/survey*.fixed')
   FORMAT 'CUSTOM' (formatter=fixedwidth_in,
             id=8, scf_var=10, mivn=17, var_ind=2, var_evr=2, var_label=61)
;

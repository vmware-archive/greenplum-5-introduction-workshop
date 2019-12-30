/* *******************************************************************************************************
Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
This program and the accompanying materials are made available under the terms of the under the Apache
License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is
distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
******************************************************************************************************* */
\echo FACTED FIELD SEARCH
\echo Search count grouped by from and to for documents matching 'Phillips Petroleum'
\echo -------------------------------------
SELECT *
FROM gptext.faceted_field_search('gpuser.public.enron', 'content:2w(Phillips Petroleum) AND date:["2000-01-01T00:00:00Z" TO "2001-01-01T00:00:00Z"]', NULL, '{from, to}', 4, 0)
LIMIT 10;

\echo FACTED QUERY SEARCH
\echo Search count grouped by year 2000 and to:"Christine Stokes" for documents matching 'Phillips Petroleum'
\echo -------------------------------------
SELECT *
FROM gptext.faceted_query_search('gpuser.public.enron', 'content:2w(Phillips Petroleum)', NULL, array['date:["2000-01-01T00:00:00Z" TO "2001-01-01T00:00:00Z"]', 'to:"Christine Stokes"'])
LIMIT 10;

\echo FACTED RANGE SEARCH
\echo Search count grouped by each year FROM year 2000 to year 2005 for documents matching 'Phillips Petroleum'
\echo ------------------------------------
SELECT *
FROM gptext.faceted_range_search('gpuser.public.enron', 'content:2w(Phillips Petroleum)', NULL, 'date', '2000-01-01T00:00:00Z', '2005-01-01T00:00:00Z', '+1YEAR')
LIMIT 10;

\echo SEARCH COUNT
\echo -------------------------------------
SELECT gptext.search_count('gpuser.public.enron', 'content:2w(Phillips Petroleum) AND to:"Christine Stokes" AND date:["2000-01-01T00:00:00Z" TO "2001-01-01T00:00:00Z"]');

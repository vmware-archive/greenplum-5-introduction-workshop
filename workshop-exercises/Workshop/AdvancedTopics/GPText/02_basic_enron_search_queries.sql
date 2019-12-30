/* *******************************************************************************************************
Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
This program and the accompanying materials are made available under the terms of the under the Apache
License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is
distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
******************************************************************************************************* */
\echo BASIC SEARCH
\echo -------------------------------------
SELECT *
FROM gptext.search(table(select 1 scatter by 1), 'gpuser.public.enron',
     'content:2w(Phillips Petroleum) AND date:["2000-01-01T00:00:00Z" TO "2001-01-01T00:00:00Z"]', NULL)
LIMIT 10;

\echo SEARCH JOINING WITH ORIGINAL TABLE
\echo -------------------------------------
SELECT l.id, l.score, r."to"
FROM gptext.search(table(select 1 scatter by 1), 'gpuser.public.enron',
     'content:2w(Phillips Petroleum) AND to:"Christine Stokes" AND date:["2000-01-01T00:00:00Z" TO "2001-01-01T00:00:00Z"]', NULL) l,
     enron r
WHERE l.id=r.id::text;

\echo SEARCH WITH MULTIPLE FILTERS 
\echo -------------------------------------
SELECT l.id, l.score, r."to"
FROM gptext.search(table(select 1 scatter by 1), 'gpuser.public.enron',
     'content:2w(Phillips Petroleum)', array['to:"Christine Stokes"', 'date:["2000-01-01T00:00:00Z" TO "2001-01-01T00:00:00Z"]'], NULL) l,
     enron r
WHERE l.id=r.id::text;

\echo SEARCH WITH SOLR OPTIONS 
\echo -------------------------------------
SELECT l.id, l.score, r."to"
FROM gptext.search(table(select 1 scatter by 1), 'gpuser.public.enron',
     'content:2w(Phillips Petroleum)', array['to:"Christine Stokes"', 'date:["2000-01-01T00:00:00Z" TO "2001-01-01T00:00:00Z"]'], 'rows=1') l,
     enron r
WHERE l.id=r.id::text;

\echo SEARCH WITH HIGHLIGHTING 
\echo -------------------------------------
SELECT l.id, l.score, r."to", gptext.highlight(content, 'content', hs)
FROM gptext.search(table(select 1 scatter by 1), 'gpuser.public.enron',
     'content:2w(Phillips Petroleum)', array['to:"Christine Stokes"', 'date:["2000-01-01T00:00:00Z" TO "2001-01-01T00:00:00Z"]'], 'hl=true&hl.fl=content&rows=1') l,
     enron r
WHERE l.id=r.id::text;


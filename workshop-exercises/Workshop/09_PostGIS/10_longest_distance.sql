/* *******************************************************************************************************
Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
This program and the accompanying materials are made available under the terms of the under the Apache
License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is
distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
******************************************************************************************************* */
/*
 For each airport in a given state, show me the destination airport that
 is the furthest in terms of distance.
*/

-- \set this_state '''Louisiana'''
\set this_state '''Texas'''

select c.oc as "Origin",
       c.dc as "Destination",
       round(c.max::numeric, 0) as "Distance (Miles)"
from (
    select b.orig_city as oc, b.destcityname as dc,
           first_value (st_distance(b.orig_loc, d.location) * 0.00062137) -- convert meters to miles
                 over (partition by b.origin
                       order by st_distance(b.orig_loc, d.location) desc
                       ) as max,
           row_number ()
                 over (partition by b.origin
                       order by st_distance(b.orig_loc, d.location) desc
                       ) as rn
    from d_airports d
       join (
            select distinct o.origin, o.dest, a.orig_loc, a.orig_city, o.destcityname
            from otp o,
                 (SELECT a.airport_code as orig_code
                         ,a.location as orig_loc
                         ,a.city as orig_city
                   FROM d_airports a
                         JOIN gis_airports ga ON a.airport_code = ga.locationid
                         JOIN gis_state gs ON ga.statename = gs.state
                   WHERE ST_CONTAINS(gs.geom, ga.geom)
                     AND gs.state = :this_state
                   ORDER BY ga.city, a.airport_code) a
            where o.origin  = a.orig_code
            ) b
          on d.airport_code = b.dest
     ) c
where c.rn = 1
order by c.oc
;


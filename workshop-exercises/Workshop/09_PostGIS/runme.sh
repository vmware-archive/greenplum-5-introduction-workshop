sh -x 00_grant_priv_on_spatial.sh
###############################################################################################################
# Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
# This program and the accompanying materials are made available under the terms of the under the Apache
# License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software distributed under the License is
# distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and limitations under the License.
###############################################################################################################
read -p "Press enter to continue"
psql -f 01_alter_locations_table.sql
read -p "Press enter to continue"
psql -f 02_get_loc.sql
read -p "Press enter to continue"
psql -f 03_distance_between.sql
read -p "Press enter to continue"
psql -f 04_closest_airport.sql
read -p "Press enter to continue"
psql -f 05_closest_BOS1.sql
echo -e "\nThis didn't work.  We have non-airport locations in the table."
echo "Let's change this to only use sites with the fragment 'irport' in the name"
read -p "Press enter to continue"
psql -f 06_closest_BOS2.sql
echo -e "\nBetter.  But these airports are too small for a jetliner."
echo "Let's change this to only use sites in the otp_r table."
read -p "Press enter to continue"
psql -f 07_closest_BOS3.sql
echo -e "\nThat's more like it."
read -p "Press enter to continue"
psql -f 08_closest_LAX.sql
echo -e "\nIf we call find_nearest with an INT, it will find the N closest.\nIf we call it with a FLOAT, it will find those within X kilometers"
psql -f 09_distance_BOS_LAX.sql
echo -e "\nST_Distance can compute spheroid or two dimensional distances.  Which is more accurate?"

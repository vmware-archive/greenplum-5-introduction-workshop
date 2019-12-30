sudo -i -u gpadmin /home/gpuser/Exercises/ExternalWebTables/01_gpadmin_setup.sh
###############################################################################################################
# Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
# This program and the accompanying materials are made available under the terms of the under the Apache
# License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software distributed under the License is
# distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and limitations under the License.
###############################################################################################################
read -p "press enter to continue"
psql -d otherdb -f 02_create_new_table.sql
read -p "press enter to continue"
psql -d otherdb -f 03_copy_into_airports.sql
read -p "press enter to continue"
sudo -i -u gpadmin /home/gpuser/Exercises/ExternalWebTables/04_create_ext_web_table.sh
read -p "press enter to continue"
psql -d otherdb -f 05_show_airlines_table.sql
read -p "press enter to continue"
psql -d gpuser -f 06_delay_from_Logan.sql
read -p "press enter to continue"
psql -d gpuser -f 07_explain_delay_from_Logan.sql
sudo -i -u gpadmin /home/gpuser/Exercises/ExternalWebTables/07_gpadmin_cleanup.sh


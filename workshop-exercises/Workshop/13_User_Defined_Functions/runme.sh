psql -f 01_overload.sql
###############################################################################################################
# Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
# This program and the accompanying materials are made available under the terms of the under the Apache
# License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software distributed under the License is
# distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and limitations under the License.
###############################################################################################################
read -p "Push Enter to Continue"
psql -f 02_dynamic.sql
read -p "Push Enter to Continue"
psql -f 03_reciprocal.sql
read -p "Push Enter to Continue"
psql -f 04_pymax.sql
read -p "Push Enter to Continue"
sudo -i -u gpadmin psql -d gpuser -f /home/gpuser/Exercises/User_Defined_Functions/04_pymax.sql
sudo -i -u gpadmin psql -d gpuser -c "grant execute on function pymax(int,int) to gpuser;"
psql -f  -c "select pymax(1,33);"
sudo -i -u gpadmin psql -d gpuser -f /home/gpuser/Exercises/User_Defined_Functions/05_create_secret.sql
psql -f 06_secret_sum.sql
read -p "Push Enter to Continue"
psql -f 07_define_route_type.sql
read -p "Push Enter to Continue"
psql -f 08_show_routes.sql
read -p "Push Enter to Continue"

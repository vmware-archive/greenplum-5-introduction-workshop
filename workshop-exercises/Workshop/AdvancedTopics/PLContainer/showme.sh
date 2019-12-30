more  01_whoami.py
###############################################################################################################
# Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
# This program and the accompanying materials are made available under the terms of the under the Apache
# License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software distributed under the License is
# distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and limitations under the License.
###############################################################################################################
read -p "Press Enter to Continue"
cat  02_os_cmd_pythonu.sql 
read -p "Press Enter to Continue"
echo "grant execute on function public.os_cmd_pythonu(text) to gpuser;"
read -p "Press Enter to Continue"
echo "select * from public.os_cmd_pythonu('whoami');/
read -p "Press Enter to Continue"
echo "select * from public.os_cmd_pythonu('cat /etc/system-release');"
cat 02_os_cmd_container.sql
read -p "Press Enter to Continue"
echo "select * from public.os_cmd_container('cat /etc/system-release');" 
read -p "Press Enter to Continue"
echo "select * from public.os_cmd_container('whoami');"

cat numpy_01_setup.sql 
read -p "Press Enter to Continue"
cat numpy_02_define_means.sql 
read -p "Press Enter to Continue"
cat numpy_03_calculate_means.sql 

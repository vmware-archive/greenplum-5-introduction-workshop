echo Start GPFDIST on port 8082
###############################################################################################################
# Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
# This program and the accompanying materials are made available under the terms of the under the Apache
# License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software distributed under the License is
# distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and limitations under the License.
###############################################################################################################
gpfdist -d $(pwd) -p 8082 > gpfdist.log 2>&1 &
GPFDistPID=$(echo $!)

read -p 'Create External Tables. Ready? ' answer
psql -f 01_create_ext_tbl.sql

read -p 'Exchange Partitions. Ready? ' answer
psql -f 02_exchange_parts.sql

read -p 'Now see what EXPLAIN has to say about our moved partition. Ready? ' answer
psql -f 03_run_explain.sql

read -p 'Show details on our partitions. Ready? ' answer
psql -f 04_show_partitions.sql

kill $GPFDistPID

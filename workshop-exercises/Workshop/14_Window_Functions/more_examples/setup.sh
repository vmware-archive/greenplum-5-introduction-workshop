#!/bin/bash
###############################################################################################################
# Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
# This program and the accompanying materials are made available under the terms of the under the Apache
# License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software distributed under the License is
# distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and limitations under the License.
###############################################################################################################

PGDATABASE=gpuser
PGSCHEMA=window_demo

# Check if the demo schema is available. It not, create it.

schema=$(psql -At -d $PGDATABASE -c "select nspname from pg_catalog.pg_namespace where nspname = '$PGSCHEMA'")

if [ x$PGSCHEMA != x$schema ] ; then
    psql -d $PGDATABASE -c "create schema $PGSCHEMA" -o /dev/null
fi

echo "set search_path to $PGSCHEMA ;" > 00_init.sql

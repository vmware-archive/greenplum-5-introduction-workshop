/* *******************************************************************************************************
Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
This program and the accompanying materials are made available under the terms of the under the Apache
License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is
distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
******************************************************************************************************* */
-- Be sure to add a runtime first:
-- plcontainer runtime-add -r plc_py -i pivotaldata/plcontainer_python_shared:devel -l python

CREATE OR REPLACE FUNCTION public.os_cmd_container(cmd text) RETURNS text AS $$
# container: plc_python

import commands
status, output = commands.getstatusoutput(cmd)
return output
$$ LANGUAGE plcontainer;

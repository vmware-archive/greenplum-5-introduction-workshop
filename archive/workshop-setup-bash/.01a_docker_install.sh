#!/usr/bin/env bash
###############################################################################################################
# Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
# This program and the accompanying materials are made available under the terms of the under the Apache
# License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software distributed under the License is
# distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and limitations under the License.
###############################################################################################################

#
# Move the /var/lib/docker directory to another location to ease the disk space
# crunch on the root volume.
# NOTE: Jon is working on increasing the root volume space in the AWS AMIs. When this
#       is completed, this relocation will not be necessary. However, we still would
#       want to add a docker group and add the gpadmin and gpuser accounts to that group.
#       This may not be needed for CentOS 7.
#

# This script is no longer used so just exit. Only keeping for documenting how to move
# docker if needed

exit 0

source ./00_common_functions.sh

echo_eval "check_user root"
[[ $? != 0 ]] && exit 1

echo_eval "rpm -iUvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm"
echo_eval "yum -y install docker-io"
echo_eval "chkconfig docker on"

# The current Greenplum CloudFormation version (<= 2.2) on AWS has limited root filespace.
# So we need to move docker off of the root space and to one of the data spaces.
set_cloud_platform

if [[ $PROVIDER == 'aws' ]]; then
    # Move the docker stuff out of the root directory since it has limited space
    # If you have a root filespace > 10GB, you may not need to do this.

    NEWDIR=/$DATA_DISK/var-lib-docker

    echo_eval "mkdir -p $NEWDIR"
    echo_eval "chown root:root $NEWDIR"
    echo_eval "chmod 700 $NEWDIR"

    echo_eval "service docker stop"

    echo_eval "mv /var/lib/docker $NEWDIR"
    [[ $? -ne 0 ]] && { echo "Problems moving docker dir. Exiting."; exit 1; }
    echo_eval "ln -s $NEWDIR/docker /var/lib/docker"
fi

echo_eval "service docker start"

# Add a docker group
echo_eval "groupadd docker"
echo_eval "chgrp docker /var/run/docker.sock"

# Add the gpadmin and gpuser users to the docker group
echo_eval "usermod  -aG docker gpadmin"
echo_eval "usermod  -aG docker gpuser"

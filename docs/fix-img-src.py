#!/usr/bin/env python
"""
Copyright (C) 2019-Present Pivotal Software, Inc. All rights reserved.
This program and the accompanying materials are made available under the terms of the under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License. You may obtain a copy of the License at
http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and
limitations under the License.
"""

"""
Replaces the data-src image name used by Slides.com with the image name we use
for the workshop presentations. It relies on the 'alt' tag for the 'img' element
having the correct name of the actual file.

For example:
    <img alt="logo-docker" data-src="greenplum-pxf/23489askdfj29937.png" ...>
would get replaced with:
    <img alt="logo-docker" data-src="images/logos/logo-docker.png" ...>

"""

import sys, getopt
import re
""" import urllib2"""
import textwrap
from bs4 import BeautifulSoup as bs

in_file = ''

try:
    opts, args = getopt.getopt(sys.argv[1:], "f:")
except getopt.GetoptError:
    print 'get_topics.py -f FILE'
    sys.exit(2)
for opt, arg in opts:
    if opt == '-f':
        in_file = arg

f = open (in_file, 'r')
html_text = f.read()

doc = bs(html_text, 'html.parser')

for v in doc.find_all('img'):
    #print 'ORIG == ', v
    img_alt = v.attrs.get('alt')
    img_src = v.attrs.get('data-src')

    if img_alt:
        if 'logo' in img_alt :
            v['data-src'] = 'images/logos/%s.png' % img_alt
        elif 'icon' in img_alt:
            v['data-src'] = 'images/icons/%s.png' % img_alt
        else:
            v['data-src'] = 'images/%s.png' % img_alt
    #    print 'NEW  == ', v

print (doc.encode(formatter="html"))

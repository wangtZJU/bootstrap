#!/usr/bin/env python3
import os, sys; sys.path.append(os.path.dirname(os.path.dirname(os.path.realpath(__file__))))

from lib.utils import *

log_info('platform is {}'.format(PLATFORM))

output, error = run_command('ls /')
log_success(output)

#!/usr/bin/env python3
import os, sys; sys.path.append(os.path.dirname(os.path.dirname(os.path.realpath(__file__))))

from lib import utils

utils.log_info('hello world')
utils.log_success('hello world')
utils.log_warning('hello world')
utils.log_error('hello world')


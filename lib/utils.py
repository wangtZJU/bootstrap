import os
import platform as py_platform
import subprocess
from enum import Enum

PROJECT_ROOT = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))

class bcolors:
    PURPLE = '\033[95m'
    BLUE = '\033[94m'
    CYAN = '\033[96m'
    GREEN = '\033[92m'
    YELLOW = '\033[93m'
    RED = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

def log_info(s):
    print("{}{}{}".format(bcolors.CYAN, s, bcolors.ENDC))

def log_success(s):
    print("{}{}{}".format(bcolors.GREEN, s, bcolors.ENDC))

def log_warning(s):
    print("{}{}{}".format(bcolors.YELLOW, s, bcolors.ENDC))

def log_error(s):
    print("{}{}{}{}".format(bcolors.RED, bcolors.BOLD, s, bcolors.ENDC))

def exec_recipe(r):
    exec(open("{}/recipes/{}.py".format(PROJECT_ROOT, r)).read())

class Platform(Enum):
    Unknown = 1
    Darwin = 2
    Debian = 3

    @staticmethod
    def detectPlatform():
        if py_platform.system().lower() == 'darwin':
            return Platform.Darwin
        if py_platform.system().lower() == 'linux':
            if py_platform.linux_distribution()[0].lower() == 'debian':
                return Platform.Debian
        return Platform.Unknown;

PLATFORM = Platform.detectPlatform()

def run_command(cmd, **options):
    print_output = True
    ignore_error = False
    if type(cmd) == str:
        cmd = cmd.split()
    process = subprocess.Popen(cmd, stdout=subprocess.PIPE)
    return process.communicate()

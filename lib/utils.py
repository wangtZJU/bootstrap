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
    print(f"{bcolors.CYAN}{s}{bcolors.ENDC}")

def log_success(s):
    print(f"{bcolors.GREEN}{s}{bcolors.ENDC}")

def log_warning(s):
    print(f"{bcolors.YELLOW}{s}{bcolors.ENDC}")

def log_error(s):
    print(f"{bcolors.RED}{bcolors.BOLD}{s}{bcolors.ENDC}")

def exec_recipe(r):
    exec(open(f"recipes/{r}.py").read())



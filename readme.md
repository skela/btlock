btlock
======

btlock automatically locks your computer when you leave it, by checking
if a Bluetooth device is close or not. For example your phone.

> Note: Currently, the check is very simple:
>       The only check is whether the device is in range or not.
>       This might or might not be enough for you.

Example
-------

    $ btlock --device 'A0:B1:C2:D3:E4:F5' --lock-command 'i3lock -n' --unlock-command 'pkill i3'

Usage
-----

    usage: btlock [-h] [-v] [-c CONFIG_FILE] --device DEVICE --lock-command
                  LOCK_COMMAND --unlock-command UNLOCK_COMMAND
                  [--search-duration SEARCH_DURATION]
                  [--search-timeout SEARCH_TIMEOUT]
                  [--search-interval-found SEARCH_INTERVAL_FOUND]
                  [--search-interval-missing SEARCH_INTERVAL_MISSING]
    
    Args that start with '--' (eg. -v) can also be set in a config file
    (/etc/btlock/btlockrc or ~/.config/btlock/btlockrc or specified via -c).
    Config file syntax allows: key=value, flag=true, stuff=[a,b,c] (for details,
    see syntax at https://goo.gl/R74nmi). If an arg is specified in more than one
    place, then commandline values override environment variables which override
    config file values which override defaults.
    
    optional arguments:
      -h, --help            show this help message and exit
      -v, --verbose         [env var: VERBOSE]
      -c CONFIG_FILE, --config-file CONFIG_FILE
                            [env var: BTLOCK_CONFIG_FILE]
      --device DEVICE       [env var: BTLOCK_DEVICE]
      --lock-command LOCK_COMMAND
                            [env var: BTLOCK_COMMAND_LOCK]
      --unlock-command UNLOCK_COMMAND
                            [env var: BTLOCK_COMMAND_UNLOCK]
      --search-duration SEARCH_DURATION
                            [env var: BTLOCK_SEARCH_DURATION]
      --search-timeout SEARCH_TIMEOUT
                            [env var: BTLOCK_SEARCH_TIMEOUT]
      --search-interval-found SEARCH_INTERVAL_FOUND
                            [env var: BTLOCK_SEARCH_INTERVAL_FOUND]
      --search-interval-missing SEARCH_INTERVAL_MISSING
                            [env var: BTLOCK_SEARCH_INTERVAL_MISSING]

Configure
---------

btlock supports several ways of configuration, so you can choose what you prefer:

* Command line arguments:

        $ btlock --device 'A0:B1:C2:D3:E4:F5' --lock-command 'i3lock -n' --unlock-command 'pkill i3'

* Config file:

        $ mkdir -p ~/.config/btlock
        $ cat << _EOF_ >> ~/.config/btlock/config
        device=A0:B1:C2:D3:E4:F5
        lock-command=i3lock -n
        unlock-command=pkill i3
        $ btlock

* Environment variables:

        $ export BTLOCK_DEVICE='A0:B1:C2:D3:E4:F5'
        $ export BTLOCK_COMMAND_LOCK='i3lock -n'
        $ export BTLOCK_COMMAND_UNLOCK='pkill i3'
        $ btlock

Install
-------

    $ pip install -r requirements.txt

Uninstall
---------

    $ pip uninstall -r requirements.txt


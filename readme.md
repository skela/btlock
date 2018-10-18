btlock
======

btlock automatically locks your computer when you leave it, by checking
if a Bluetooth device is close or not. For example your phone.

It works by checking Bluetooth RSSI (signal strength) to your device.
If RSSI is outside a configurable limit, btlock locks your computer.

Examples
--------

    $ btlock --device 'A0:B1:C2:D3:E4:F5' --lock-command 'i3lock -n' --unlock-command 'pkill i3lock'

Usage
-----

    usage: btlock [-h] [-v] [-c CONFIG_FILE] --device DEVICE --lock-command
                  LOCK_COMMAND --unlock-command UNLOCK_COMMAND
                  [--rssi-min RSSI_MIN] [--rssi-max RSSI_MAX]
                  [--search-timeout SEARCH_TIMEOUT]
                  [--search-interval-found SEARCH_INTERVAL_FOUND]
                  [--search-interval-missing SEARCH_INTERVAL_MISSING]
    
    Args that start with '--' (eg. -v) can also be set in a config file
    (/etc/btlock/config or ~/.config/btlock/config or specified via -c). Config
    file syntax allows: key=value, flag=true, stuff=[a,b,c] (for details, see
    syntax at https://goo.gl/R74nmi). If an arg is specified in more than one
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
      --rssi-min RSSI_MIN   [env var: BTLOCK_RSSI_MIN]
      --rssi-max RSSI_MAX   [env var: BTLOCK_RSSI_MIN]
      --search-timeout SEARCH_TIMEOUT
                            [env var: BTLOCK_SEARCH_TIMEOUT]
      --search-interval-found SEARCH_INTERVAL_FOUND
                            [env var: BTLOCK_SEARCH_INTERVAL_FOUND]
      --search-interval-missing SEARCH_INTERVAL_MISSING
                            [env var: BTLOCK_SEARCH_INTERVAL_MISSING]

Install
-------

    $ pip install -r requirements.txt

Uninstall
---------

    $ pip uninstall -r requirements.txt

Configure
---------

btlock supports several ways of configuration, so you can choose what you prefer:

* Command line arguments:

      $ btlock --device 'A0:B1:C2:D3:E4:F5' --lock-command 'i3lock -n' --unlock-command 'pkill i3lock'

* Config file:

      $ mkdir -p ~/.config/btlock
      $ cat << _EOF_ >> ~/.config/btlock/config
      device=A0:B1:C2:D3:E4:F5
      lock-command=i3lock -n
      unlock-command=pkill i3lock
      rssi_min=-10
      rssi_max=10
      search-timeout=20
      _EOF_
      $ btlock

* Environment variables:

      $ export BTLOCK_DEVICE='A0:B1:C2:D3:E4:F5'
      $ export BTLOCK_COMMAND_LOCK='i3lock -n'
      $ export BTLOCK_COMMAND_UNLOCK='pkill i3lock'
      $ export BTLOCK_SEARCH_INTERVAL_FOUND='30'
      $ export BTLOCK_SEARCH_INTERVAL_MISSING='5'
      $ btlock


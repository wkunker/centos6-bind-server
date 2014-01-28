'host' directory contains scripts which will be needed to perform DNS updates.

'install.sh' will install the DNS server onto the current machine. Be sure to customize the settings first (found at the beginning of install.sh, in all caps).

This is how I had to generate the key for now: dnssec-keygen -r /dev/urandom -a HMAC-MD5 -b 512 -n USER wkunker.gmail.com.

install.sh settings:
KEYNAME: The name given to dnssec-keygen, specified as "-n USER <name>"
ZONENAME: Name of the DNS zone to make--the default is named 'testzone.apt'
SECRET: The value of 'Key:' in the dnssec-keygen generate private key. Looks like: YrVW9yP6gNMA7VbcU/r2mSIwYnFj/XkCDd6QuqOHE26/ipnrPy+eXrKrUyaFhB2XWNdVLUX7QCUkfhg4zN5YiA==


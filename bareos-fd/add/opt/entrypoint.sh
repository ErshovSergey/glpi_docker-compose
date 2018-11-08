#!/bin/bash
#set -e

[ ! -f /etc/bareos/bareos-fd.conf ] && cp /opt/bareos-fd.conf /etc/bareos/bareos-fd.conf

service bareos-fd start && echo "  Start bareos-fd"

wait
sleep infinity


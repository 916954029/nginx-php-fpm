#!/bin/bash

# add xdebug.remote_port configuration to support phpstorm debug

XdebugFile='/usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini'
if [[ -f $XdebugFile && -n $XDEBUG_REMOTE_PORT ]] ; then
    sed -i "3a xdebug.remote_port=${XDEBUG_REMOTE_PORT}" $XdebugFile
fi

#!/bin/bash
set -e

cd /work
env >> /etc/environment
exec "$@"

#!/bin/sh

set -e

CONTAINERPILOT_EXEC="docker-entrypoint.sh.orig $@" exec containerpilot

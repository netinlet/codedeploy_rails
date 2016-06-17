#!/bin/bash -ex

echo Application Stop Hook

/usr/local/bin/supervisorctl shutdown

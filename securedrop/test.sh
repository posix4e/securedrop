#!/bin/bash
set -ex

if [ $(which vagrant) ] ; then
    echo ""
    echo "*** You probably want to run tests from vagrant. Run 'vagrant ssh', then 'cd /vagrant/securedrop' and re-run this script***"
    echo ""
fi


# -f makes unittest fail fast, so we can use && to avoid burying test failures

PYTHON="env PYTHONPATH=`pwd`/tests:$PYTHONPATH python"
${PYTHON} -m unittest -fv unit_tests
${PYTHON} -m unittest -fv functional.submit_and_retrieve_message 
${PYTHON} -m unittest -fv functional.submit_and_retrieve_file

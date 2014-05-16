#!/bin/bash
set -ex

if [ $(which vagrant) ] ; then
    echo ""
    echo "*** You probably want to run tests from vagrant. Run 'vagrant ssh', then 'cd /vagrant/securedrop' and re-run this script***"
    echo ""
fi

export PYTHONPATH=./tests

# -f makes unittest fail fast, so we can use && to avoid burying test failures
env PYTHONPATH=`pwd`/tests python -m unittest -v tests.unit_tests && python -m unittest -v tests.functional.submit_and_retrieve_message && python -m unittest -v tests.functional.submit_and_retrieve_file



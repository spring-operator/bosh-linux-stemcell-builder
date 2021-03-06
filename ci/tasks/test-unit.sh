#!/bin/bash -ex

source /etc/profile.d/chruby.sh
chruby 2.3.1

set +e
#create user for ShelloutTypes::File tests
useradd -G nogroup shellout
set -e

pushd bosh-linux-stemcell-builder
  bundle install --local

  pushd bosh-stemcell
    bundle exec rspec spec/
    bundle exec rspec spec/ --tag shellout_types
  popd
popd

#!/bin/bash

curl -sSL https://get.rvm.io | bash -s stable --ruby
rvm install 2.1
rvm use 2.1 --default

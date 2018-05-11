#!/bin/sh
# Used to create a sandbox for automating screenshots 

set -e

rm -rf ./sandbox
bundle exec rails new sandbox --database="sqlite3" \
  --skip-bundle \
  --skip-git \
  --skip-keeps \
  --skip-rc \
  --skip-spring \
  --skip-test \
  --skip-yarn

if [ ! -d "sandbox" ]; then
  echo 'sandbox rails application failed'
  exit 1
fi

cd ./sandbox
echo "gem 'solidus', github: 'solidusio/solidus', branch: 'master'" >> Gemfile
echo "gem 'solidus_auth_devise', '>= 2.1.0'" >> Gemfile
echo "gem 'rails-i18n'" >> Gemfile
echo "gem 'solidus_i18n'" >> Gemfile

bundle install --gemfile Gemfile
bundle exec rake db:drop db:create
bundle exec rails g spree:install --auto-accept --user_class=Spree::User --enforce_available_locales=true
bundle exec rails g solidus:auth:install

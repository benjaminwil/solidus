#!/bin/sh

set -e

rm -rf ./_sandbox
bundle exec rails new _sandbox --database="sqlite3" \
  --skip-bundle \
  --skip-git \
  --skip-keeps \
  --skip-rc \
  --skip-spring \
  --skip-test \
  --skip-yarn

if [ ! -d "_sandbox" ]; then
  echo 'sandbox rails application failed'
  exit 1
fi

cd ./_sandbox
cat <<RUBY >> Gemfile

gem 'solidus', path: '../..'
gem 'solidus_auth_devise', '>= 2.1.0'
gem 'rails-i18n'
gem 'solidus_i18n'

gem 'rspec'
gem 'rspec-activemodel-mocks'
gem 'rspec-rails'

gem 'rails-controller-testing'
gem 'with_model'
gem 'database_cleaner'

gem 'factory_bot'

gem 'capybara'
gem 'capybara-screenshot'
gem 'selenium-webdriver'

RUBY

bundle install --gemfile Gemfile
bundle exec rake db:drop db:create
bundle exec rails g spree:install --auto-accept --user_class=Spree::User --enforce_available_locales=true
bundle exec rails g solidus:auth:install

ln -s ../spec spec

cd ..

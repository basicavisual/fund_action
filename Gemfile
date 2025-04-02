source "https://rubygems.org"
DECIDIM_VERSION = "0.25.2"
ruby RUBY_VERSION
# gem "rails"
#gem "decidim", path: '../decidim'
gem "decidim", DECIDIM_VERSION
# gem "decidim-calendar", git: 'https://github.com/alabs/decidim-module-calendar'

gem "decidim-consultations", DECIDIM_VERSION

gem 'decidim-members', git: 'https://github.com/basicavisual/decidim-members'

gem 'uglifier', "~> 4.1"
gem "faker", "~> 2.14"
gem "wicked_pdf", "~> 2.1"

#gem 'rack-attack'

gem 'country_select', "~> 3.1", require: 'country_select_without_sort_alphabetical'
gem 'language_list'
#gem 'therubyracer'
#gem 'execjs'
#gem 'graphql', '~> 1.12.13'
#gem 'sprockets', '< 4.0'

#gem 'rack', '>= 2.0.8'
# Remove this nokogiri forces version at any time but make sure that no __truncato_root__ text appears in the cards in general.
# More exactly in comments in the homepage and in processes cards in the processes listing
#gem 'nokogiri' #, "1.13.4"

# GHSA-p4x4-rw2p-8j8m
#gem "sanitize", ">= 5.2.1"

#gem 'kaminari', '~> 1.2.1'

gem 'figaro'

# GHSA-g6wq-qcwm-j5g2
#gem "websocket-extensions", ">= 0.1.5"

group :development, :test do
  gem 'byebug', platform: :mri
  #gem "decidim-dev", DECIDIM_VERSION
end

#gem "puma", ">= 5.0.0"
gem "puma", ">= 5.5.1"
gem "bootsnap", "~> 1.4"

gem "decidim-decidim_awesome"
#  CVE-2021-32740
gem "addressable", ">= 2.8.0"

group :development do
  gem "spring", "~> 2.0"
  gem "spring-watcher-listen", "~> 2.0"
  gem 'web-console'
  gem 'listen', '~> 3.1'
  gem 'letter_opener_web', '~> 1.3'
  gem 'capistrano', '~> 3.10.0'
  gem 'capistrano-rails', require: false
  gem 'capistrano-chruby', require: false
  gem 'rbnacl', '< 5.0', '>= 3.2.0'
  gem 'rbnacl-libsodium'
  gem 'bcrypt_pbkdf', '>= 1.0', '< 2.0'
  gem 'ed25519', '>= 1.2', '< 2.0'
  gem "decidim-dev", DECIDIM_VERSION
end

group :production do
  gem 'passenger'
  #gem 'puma-plugin-systemd'
  #gem 'puma_worker_killer'
  gem 'connection_pool'
  gem 'delayed_job_active_record'
  gem 'daemons'
  gem 'dalli'
end
source "https://rubygems.org"
DECIDIM_VERSION = "0.26.9"
ruby RUBY_VERSION
gem "decidim", DECIDIM_VERSION
gem "decidim-consultations", DECIDIM_VERSION
gem "decidim-templates", DECIDIM_VERSION
# concurrent-ruby 1.3.5 dropped its implicit `require "logger"`, which Rails 6.x
# relied on -> "uninitialized constant ActiveSupport::LoggerThreadSafeLevel::Logger".
# Pin to the last version that still requires logger. Remove on Rails >= 7.1.
gem "concurrent-ruby", "1.3.4"

gem 'decidim-members', git: 'https://github.com/basicavisual/decidim-members'

gem 'uglifier', "~> 4.1"
gem "faker", "~> 2.14"
gem "wicked_pdf", "~> 2.1"

#gem 'rack-attack'

gem 'country_select', "~> 3.1", require: 'country_select_without_sort_alphabetical'
gem 'language_list'

# Remove this nokogiri forces version at any time but make sure that no __truncato_root__ text appears in the cards in general.
# More exactly in comments in the homepage and in processes cards in the processes listing
#gem 'nokogiri' #, "1.13.4"
gem 'truncato', '0.7.12'
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

gem "decidim-decidim_awesome", "~> 0.10.2"
gem "decidim-admin_invited_users", path: "decidim-module-admin_invited_users"
#  CVE-2021-32740
gem "addressable", ">= 2.8.0"

group :development do
  gem "spring", "~> 2.0"
  gem "spring-watcher-listen", "~> 2.0"
  gem 'web-console'
  gem 'listen', '~> 3.1'
  gem 'letter_opener_web', '~> 1.3'
  gem 'rbnacl', '< 5.0', '>= 3.2.0'
  gem 'rbnacl-libsodium'
  gem 'bcrypt_pbkdf', '>= 1.0', '< 2.0'
  gem 'ed25519', '>= 1.2', '< 2.0'
  gem "decidim-dev", DECIDIM_VERSION
end

group :production do
  gem 'passenger'
  gem 'connection_pool'
  gem 'delayed_job_active_record'
  gem 'daemons'
  gem 'dalli'
end

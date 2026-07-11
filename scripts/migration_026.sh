#!/usr/bin/env bash
set -euo pipefail
export RAILS_ENV=development

# --- gems + schema ---
bundle install
bundle exec rails decidim:upgrade      # installs migrations + webpacker:upgrade (package.json)
bundle exec rails db:migrate

# --- assets (webpacker is the 0.26 headline change) ---
bundle exec rails decidim_decidim_awesome:webpacker:upgrade
npm install
bundle exec rails assets:precompile

# --- data migration tasks ---
bundle exec rails runner "Decidim::User.find_each(&:try_update_index_for_search_resource)"
bundle exec rails decidim_comments:update_participatory_process_in_comments
bundle exec rails "decidim:active_storage_migrations:migrate_inline_images_to_active_storage[ali@basicavisual.io]"
bundle exec rails decidim:upgrade:moderation:remove_from_search
bundle exec rails decidim:proposals:upgrade:remove_valuator_orphan_records
bundle exec rails decidim:upgrade:fix_duplicate_endorsements
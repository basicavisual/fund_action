# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

require "decidim/admin_invited_users/version"

Gem::Specification.new do |s|
  s.name = "decidim-admin_invited_users"
  s.summary = "A module to invite users from the admin panel"
  s.description = "Allows administrators to invite new users via email from the admin panel."
  s.version = Decidim::AdminInvitedUsers::VERSION
  s.authors = ["FundAction"]
  s.email = ["admin@fundaction.eu"]

  s.files = Dir["{app,config,lib}/**/*", "README.md"]

  s.add_dependency "decidim-admin", Decidim::AdminInvitedUsers::COMPATIBLE_DECIDIM_VERSION
  s.add_dependency "decidim-core", Decidim::AdminInvitedUsers::COMPATIBLE_DECIDIM_VERSION
  s.add_dependency "deface", ">= 1.5"
end

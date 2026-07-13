# frozen_string_literal: true

module Decidim
  module AdminInvitedUsers
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::AdminInvitedUsers

      initializer "decidim_admin_invited_users.webpacker.assets_path" do
        Decidim.register_assets_path File.expand_path("app/packs", root)
      end
    end
  end
end

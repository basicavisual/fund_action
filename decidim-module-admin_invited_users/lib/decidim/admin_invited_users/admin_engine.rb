# frozen_string_literal: true

module Decidim
  module AdminInvitedUsers
    class AdminEngine < ::Rails::Engine
      isolate_namespace Decidim::AdminInvitedUsers::Admin

      paths["db/migrate"] = nil
      paths["lib/tasks"] = nil

      routes do
        resources :invited_users, only: [:new, :create] do
          member do
            post :resend_invitation
          end
        end
      end

      initializer "decidim_admin_invited_users.admin_mount_routes" do
        Decidim::Admin::Engine.routes do
          mount Decidim::AdminInvitedUsers::AdminEngine, at: "/", as: "decidim_admin_invited_users"
        end
      end

      initializer "decidim_admin_invited_users.add_cells_view_paths" do
        Cell::ViewModel.view_paths << File.expand_path("#{Decidim::AdminInvitedUsers::AdminEngine.root}/app/cells")
        Cell::ViewModel.view_paths << File.expand_path("#{Decidim::AdminInvitedUsers::AdminEngine.root}/app/views")
      end

      initializer "decidim_admin_invited_users.permissions" do
        Decidim.permissions_registry.register_permissions(
          "Decidim::AdminInvitedUsers::Admin::InvitedUsersController",
          ::Decidim::AdminInvitedUsers::Admin::Permissions
        )
      end

      initializer "decidim_admin_invited_users.helper" do
        ActiveSupport.on_load(:action_controller) do
          helper Decidim::AdminInvitedUsers::Admin::OfficializationsHelper if respond_to?(:helper)
        end
      end
    end
  end
end

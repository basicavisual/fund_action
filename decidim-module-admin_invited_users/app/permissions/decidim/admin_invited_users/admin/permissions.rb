# frozen_string_literal: true

module Decidim
  module AdminInvitedUsers
    module Admin
      class Permissions < Decidim::DefaultPermissions
        def permissions
          return permission_action unless user
          return permission_action unless user.admin?

          allow! if permission_action.subject == :user && permission_action.action == :invite

          permission_action
        end
      end
    end
  end
end

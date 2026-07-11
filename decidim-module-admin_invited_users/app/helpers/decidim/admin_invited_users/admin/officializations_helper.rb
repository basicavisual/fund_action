# frozen_string_literal: true

module Decidim
  module AdminInvitedUsers
    module Admin
      module OfficializationsHelper
        def resend_invitation_action(user)
          return unless user.invited_to_sign_up? && !user.invitation_accepted?

          icon_link_to(
            "reload",
            decidim_admin_invited_users.resend_invitation_invited_user_path(user),
            t("decidim.admin_invited_users.admin.actions.resend_invitation"),
            method: :post,
            class: "action-icon--resend-invitation"
          )
        end
      end
    end
  end
end

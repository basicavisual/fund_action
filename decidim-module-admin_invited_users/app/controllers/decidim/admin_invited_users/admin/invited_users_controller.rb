# frozen_string_literal: true

module Decidim
  module AdminInvitedUsers
    module Admin
      class InvitedUsersController < Decidim::Admin::ApplicationController
        layout "decidim/admin/users"

        def new
          enforce_permission_to :invite, :user
          @form = form(InviteParticipantForm).instance
        end

        def create
          enforce_permission_to :invite, :user

          default_params = {
            invitation_instructions: "invitation_instructions",
            organization: current_organization,
            invited_by: current_user
          }
          @form = form(InviteParticipantForm).from_params(params.merge(default_params))

          InviteParticipant.call(@form) do
            on(:ok) do
              flash[:notice] = I18n.t("invited_users.create.success", scope: "decidim.admin_invited_users.admin")
              redirect_to decidim_admin.officializations_path
            end

            on(:invalid) do
              flash.now[:alert] = I18n.t("invited_users.create.error", scope: "decidim.admin_invited_users.admin")
              render :new
            end
          end
        end

        def resend_invitation
          enforce_permission_to :invite, :user

          user = current_organization.users.find(params[:id])

          Decidim::InviteUserAgain.call(user, "invitation_instructions") do
            on(:ok) do
              flash[:notice] = I18n.t("invited_users.resend_invitation.success", scope: "decidim.admin_invited_users.admin")
            end

            on(:invalid) do
              flash[:alert] = I18n.t("invited_users.resend_invitation.error", scope: "decidim.admin_invited_users.admin")
            end
          end

          redirect_to decidim_admin.officializations_path
        end
      end
    end
  end
end

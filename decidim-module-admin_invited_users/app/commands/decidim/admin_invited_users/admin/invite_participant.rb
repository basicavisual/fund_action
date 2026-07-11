# frozen_string_literal: true

module Decidim
  module AdminInvitedUsers
    module Admin
      class InviteParticipant < Rectify::Command
        # Public: Initializes the command.
        #
        # form - A form object with the params.
        # invited_by - The user performing the invitation.
        def initialize(form)
          @form = form
        end

        # Executes the command. Broadcasts these events:
        #
        # - :ok when everything is valid.
        # - :invalid if the form wasn't valid and we couldn't proceed.
        #
        # Returns nothing.
        def call
          return broadcast(:invalid) if form.invalid?

          invite_user

          broadcast(:ok, user: @user)
        end

        private

        attr_reader :form

        def invite_user
          @user = Decidim::User.new(
            name: form.name,
            email: form.email.downcase,
            nickname: UserBaseEntity.nicknamize(form.name, organization: form.organization),
            organization: form.organization,
            admin: false
          )
          @user.invite!(form.invited_by, invitation_instructions: form.invitation_instructions)
        end
      end
    end
  end
end

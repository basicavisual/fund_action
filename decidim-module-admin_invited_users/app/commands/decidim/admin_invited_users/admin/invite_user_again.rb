# frozen_string_literal: true

module Decidim
  module AdminInvitedUsers
    module Admin
      class InviteUserAgain < Rectify::Command
        # Public: Initializes the command.
        #
        # user - The user to re-invite.
        # instructions - The invitation instructions key.
        def initialize(user, instructions)
          @user = user
          @instructions = instructions
        end

        # Executes the command. Broadcasts these events:
        #
        # - :ok when everything is valid.
        # - :invalid if the user has already accepted the invitation.
        #
        # Returns nothing.
        def call
          return broadcast(:invalid) if user.invitation_accepted?

          user.invite!(nil, nil, invitation_instructions: instructions)

          broadcast(:ok)
        end

        private

        attr_reader :user, :instructions
      end
    end
  end
end

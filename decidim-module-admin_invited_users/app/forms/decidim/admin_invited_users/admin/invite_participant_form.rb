# frozen_string_literal: true

module Decidim
  module AdminInvitedUsers
    module Admin
      class InviteParticipantForm < Decidim::Form
        mimic :user

        attribute :name, String
        attribute :email, String
        attribute :invitation_instructions, String
        attribute :organization, Decidim::Organization
        attribute :invited_by, Decidim::User

        validates :email, :name, :organization, :invitation_instructions, presence: true
        validates :email, 'valid_email_2/email': { disposable: true }
        validates :name, format: { with: /\A(?!.*[<>?%&\^*#@()\[\]=+:;"{}\\|])/ }

        # validates :name, presence: true
        # validates :email, presence: true, 'valid_email_2/email': { disposable: true }
        # validates :name, format: { with: /\A(?!.*[<>?%&\^*#@()\[\]=+:;"{}\\|])/ }

        validate :email_is_unique

        def email
          super&.downcase
        end

        def organization
          super || current_organization
        end

        def invited_by
          super || current_user
        end

        def available_user_roles_for_select
          []
        end

        private

        def email_is_unique
          return if email.blank?
          return unless user_exists?

          errors.add(:email, I18n.t("errors.email_already_exists", scope: "decidim.admin_invited_users.admin"))
        end

        def user_exists?
          Decidim::User
            .where(organization: organization)
            .where("LOWER(email) = LOWER(?)", email)
            .exists?
        end
      end
    end
  end
end

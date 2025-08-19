module NewsletterRecipientsPatch
  def self.apply
    Decidim::Admin::NewsletterRecipients.prepend self unless Decidim::Admin::NewsletterRecipients < self
  end

  def query
    recipients = recipients_base_query

    recipients = recipients.interested_in_scopes(@form.scope_ids) if @form.scope_ids.present?

    followers = recipients.where(id: user_id_of_followers) if @form.send_to_followers

    participants = recipients.where(id: participant_ids) if @form.send_to_participants

    recipients = participants if @form.send_to_participants
    recipients = followers if @form.send_to_followers
    recipients = (followers + participants).uniq if @form.send_to_followers && @form.send_to_participants

    recipients
  end

  private

  def recipients_base_query
    Decidim::User.where(
                  organization: @form.current_organization,
                 deleted_at: nil, 
                 blocked: false, 
                 managed: false)
                 .where.not(newsletter_notifications_at: nil)
                 .where.not(email: nil)
                 .confirmed
  end
end
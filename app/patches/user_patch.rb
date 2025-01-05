module UserPatch
  def self.apply
    Decidim::User.prepend self unless Decidim::User < self
  end

  def decrement_invitation_limit!
    if invitation_limit
      self.update_attribute(:invitation_limit, invitation_limit - 1)
    end
  end

  def increment_invitation_limit!
    if invitation_limit
      self.update_attribute(:invitation_limit, invitation_limit + 1)
    end
  end

  def has_invitations_left?
    if invitation_limit
      invitation_limit > 0
    else
      true
    end
  end

  def after_confirmation
    # create authorization record after confirmation
    unless Decidim::Authorization.where(decidim_user_id: u.id).any?
      Decidim::Authorization.create(
        name: "anybody_authorization_handler",
        decidim_user_id: id,
        granted_at: Time.now,
        metadata: {}
      )
    end

    super
  end
end

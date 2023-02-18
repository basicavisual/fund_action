module UpdateAccountPatch

  def self.apply
    Decidim::UpdateAccount.prepend self unless Decidim::UpdateAccount < self
  end

  def update_personal_data
    super
    @user.profile = {
      can_contribute: @form.can_contribute,
      country: @form.country,
      gender: @form.gender,
      languages: @form.languages.reject(&:blank?),
      about_me: @form.about_me,
      areas_of_interest: @form.areas_of_interest.reject(&:blank?),
      other_area_of_interest: @form.other_area_of_interest,
      value_statement: @form.value_statement,
      cultural_background: @form.cultural_background,
      public_email: @form.public_email,
      working_groups: @form.working_groups.reject(&:blank?),
      pronouns: @form.pronouns,
      p2p: @form.p2p,
      induction: @form.induction,
      funder: @form.funder,
      birthdate: @form.birthdate
    }
  end
end


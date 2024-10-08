module UserPresenterPatch
  def self.apply
    Decidim::UserPresenter.prepend self unless Decidim::UserPresenter < self
  end

  def public_email?
    profile_attr('public_email') == '1'
  end

  def email
    user.email
  end

  def languages
    if codes = profile_attr('languages')
      codes.map{ |l| LanguageList::LanguageInfo.find(l)&.name }.compact
    end
  end

  def areas_of_interest
    if areas = profile_attr('areas_of_interest')
      areas = areas.map{ |name| AreaOfInterest.for(name) }.compact
      if other = other_area_of_interest
        areas << other
      end
      areas
    end
  end

  def other_area_of_interest
    profile_attr('other_area_of_interest').presence
  end

  def working_groups
    if working = profile_attr('working_groups')
      
      working_groups = working.map{ |name| WorkingGroup.groups[name.to_sym] }.compact
      return working_groups
    end
  end

  def country
    if country_code = profile_attr('country') and
       country = ISO3166::Country[country_code]

      country.translations[I18n.locale.to_s] || country.name
    end
  end

  def about_me
    profile_attr 'about_me'
  end

  def gender
    profile_attr 'gender'
  end

  def can_contribute
    profile_attr 'can_contribute'
  end

  def cultural_background
    profile_attr 'cultural_background'
  end

  def pronouns
    pronouns = profile_attr 'pronouns'
    pronouns = pronouns.reject { | item | item == "" } unless pronouns == nil
    pronouns
  end



  private

  def profile_attr(name)
    user.profile[name] if user.profile
  end

  def user
    __getobj__
  end

end

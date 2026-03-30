# frozen_string_literal: true

module HomepageVisibilityPatch
  def self.apply
    # Prepend into the main Decidim controller so our
    # allow_unauthorized_path? runs before the concern's version.
    Decidim::ApplicationController.prepend(self) unless Decidim::ApplicationController < self
  end

  # Allow the homepage to be accessed without authentication
  # Overrides the method from Decidim::ForceAuthentication concern
  def allow_unauthorized_path?
    return true if homepage_controller?

    super
  end

  private

  def homepage_controller?
    params[:controller] == "decidim/homepage" && action_name == "show"
  end
end
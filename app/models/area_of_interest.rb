# frozen_string_literal: true

class AreaOfInterest

  # Do not change the keys of this hash, they are referenced by
  # user.profile.areas_of_interest.
  ALL = {
    'alt_economies' => 'Alternative economies (commons, circular economy, transition town etc.)',
    'democratic_innovation' => 'Democratic innovation & civic education',
    'digital_activism' => 'Digital activism',
    'public_space' => 'Public space, housing & right to the city',
    'feminism' => 'Feminism and oppressed genders',
    'civil_rights' => 'Civil, political & social rights',
    'alt_media' => 'Media, arts & culture',
    'anti-dicrimination' => 'Anti-discrimination',
    'migration' => 'Migration',
    'climate_justice' => 'Climate justice, environment, right to food',
    'public_health' => 'Public health, care and welfare'
  }.freeze

  def self.to_a
    ALL.to_a
  end

  def self.for(name)
    ALL[name]
  end

end

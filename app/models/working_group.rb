class WorkingGroup
  # This is a class that allows us to track existing working groups and have users volunteer for them. This is an MVP of the class. The project can be followed here.

  ALL = {
    process_design: 'Process Design',
    fundraising: 'Fundraising',
    community_building: 'Community Building',
    communication_and_storytelling: 'Communication and Storytelling',
    facilitation_group: 'Facilitation Group',
    systemic_change: 'Systemic Change',
    legal: 'Legal'
  }

  def self.to_a
    ALL.to_a
  end

  def self.for(name)
    ALL[name]
  end

end
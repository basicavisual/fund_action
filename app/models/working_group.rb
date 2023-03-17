class WorkingGroup
  # This is a class that allows us to track existing working groups and have users volunteer for them. This is an MVP of the class. The project can be followed here.

  ALL = {
    grantmaking: 'Grantmaking',
    community_building: 'Community Building',
    fundraising: 'Fundraising',
    communications: 'Communications',
    none: 'None',
  }

  def self.to_a
    ALL.to_a
  end

  def self.for(name)
    ALL[name]
  end

  def self.groups
    ALL
  end  

end
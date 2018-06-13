class Stat < ApplicationRecord
  scope :short_name, ->{where('lenght(name) < 10')}

  def explicit_name
      "stat '#{name}'"
  end
  
end
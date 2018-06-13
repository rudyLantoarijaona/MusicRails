class User < ApplicationRecord
  has_one :stats
  scope :short_name, ->{where('lenght(name) < 10')}
  

  def explicit_name
      "user '#{name}'"
  end
  
end
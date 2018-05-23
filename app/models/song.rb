class Song < ApplicationRecord
  scope :short_name, ->{where('lenght(name) < 10')}

  def explicit_name
      "song '#{name}'"
  end
  
end
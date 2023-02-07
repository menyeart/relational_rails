class Trail < ApplicationRecord
  belongs_to :national_park

  def self.only_true
    Trail.where("water_source = true")
  end
end
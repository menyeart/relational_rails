class Trail < ApplicationRecord
  belongs_to :national_park

  def self.only_true
    Trail.where("water_source = true")
  end

  def self.sort_by_name
    Trail.order(:name)
  end

  def self.sort_by_length(miles)
    where("length_miles > #{miles}")
  end

end
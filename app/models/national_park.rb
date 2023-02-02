class NationalPark < ApplicationRecord
  has_many :trails

  validates_presence_of :name
end
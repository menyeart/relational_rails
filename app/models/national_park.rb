class NationalPark < ApplicationRecord
  has_many :trails

  validates_presence_of :name

  def self.order_by_most_recent
    NationalPark.order(created_at: :desc)
  end

end
class NationalPark < ApplicationRecord
  has_many :trails, :dependent => :delete_all
  validates_presence_of :name

  def self.order_by_most_recent
    NationalPark.order(created_at: :desc)
  end

  def count_children
    self.trails.count
  end
end
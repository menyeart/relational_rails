require 'rails_helper'

describe NationalPark, type: :model do 
  describe "validations" do
    it { should validate_presence_of :name}
  end

  describe "relationships" do
    it { should have_many :trails }
  end
end
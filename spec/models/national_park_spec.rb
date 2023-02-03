require 'rails_helper'

describe NationalPark, type: :model do 
  describe "validations" do
    it { should validate_presence_of :name}
  end

  describe "relationships" do
    it { should have_many :trails }
  end

  describe 'instance methods' do
    before :each do
      @national_park1 = NationalPark.create!(name: "Rocky Mountain", state: "Colorado", total_acres: 265807, charges_fee: true, created_at: Time.now - 3)
      @national_park2 = NationalPark.create!(name: "Yosemite", state: "California", total_acres: 10000000, charges_fee: true, created_at: Time.now - 1)  
      @national_park3 = NationalPark.create!(name: "Glacier", state: "Montana", total_acres: 50000, charges_fee: true, created_at: Time.now - 2) 
    end

    it "can sort national parks and order them by most recent" do
      expect(NationalPark.order_by_most_recent).to eq([@national_park2, @national_park3, @national_park1])
    end

 

  end
end
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
      @trail = Trail.create!(name: "Longs Peak", length_miles: 14, feet_elevation_gain: 4960, water_source: true, national_park_id: @national_park1.id)
      @trail2 = Trail.create!(name: "Mosca Pass", length_miles: 6,feet_elevation_gain: 1400, water_source: false, national_park_id: @national_park1.id)
    end

    it "can sort national parks and order them by most recent" do
      expect(NationalPark.order_by_most_recent).to eq([@national_park2, @national_park3, @national_park1])
    end

    it "can calulcate the number of children for a specific parent" do
      expect(@national_park1.count_children).to eq(2)
    end
  end
end
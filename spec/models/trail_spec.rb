require 'rails_helper'

RSpec.describe Trail do

  describe 'relationships' do
    it {should belong_to :national_park}
  end

  describe 'methods' do
    before :each do
      @national_park1 = NationalPark.create!(name: "Rocky Mountain", state: "Colorado", total_acres: 265807, charges_fee: true, created_at: Time.now - 3)
      @trail = Trail.create!(name: "Longs Peak", length_miles: 14, feet_elevation_gain: 4960, water_source: true, national_park_id: @national_park1.id)
      @trail2 = Trail.create!(name: "Mosca Pass", length_miles: 6,feet_elevation_gain: 1400, water_source: false, national_park_id: @national_park1.id)
    end
    
    it "can return all trails with the water source value of true" do
      expect(Trail.only_true.first).to eq(@trail)
      expect((Trail.only_true).count). to eq(1)
    end  
  end
end
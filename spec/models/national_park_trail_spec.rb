require 'rails_helper'

RSpec.describe NationalParkTrail, type: :model do 

  describe 'instance methods' do
    it "sorts trails by alphabetical order" do
      glacier = NationalPark.create!(name: 'Glacier', state: 'Montana', total_acres: 1012837, charges_fee: true)
      highline = glacier.trails.create!(name: 'Highline', length_miles: 15, water_source: false, feet_elevation_gain: 2600)
      grinell = glacier.trails.create!(name: 'Grinell Glacier', length_miles: 11, water_source: true, feet_elevation_gain: 2181)
      swiftcurrent = glacier.trails.create!(name: 'Swiftcurrent Peak', length_miles: 13, water_source: true, feet_elevation_gain: 4000)
  
      expect(glacier.trails.sort_by_name).to eq([grinell, highline, swiftcurrent])
    end  
  end
end

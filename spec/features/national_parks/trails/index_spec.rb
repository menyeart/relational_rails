require 'rails_helper'

RSpec.describe "National Park's trails index" do
 it "shows all of the trails associated with the national park" do
  glacier = NationalPark.create!(name: 'Glacier', state: 'Montana', total_acres: 1012837, charges_fee: true)
  highline = glacier.trails.create!(name: 'Highline', length_miles: 15, water_source: false, feet_elevation_gain: 2600)
  grinell = glacier.trails.create!(name: 'Grinell Glacier', length_miles: 11, water_source: true, feet_elevation_gain: 2181)

  visit "/national_parks/#{glacier.id}/trails"

  expect(page).to have_content(highline.name)
  expect(page).to have_content(grinell.name)
 end


#  it "shows all each trails attributes" do
#   glacier = NationalPark.create!(name: 'Glacier', state: 'Montana', total_acres: 1012837, charges_fee: true)
#   highline = glacier.trails.create!(name: 'Highline', length_miles: 15, water_source: false, feet_elevation_gain: 2600)
#   grinell = glacier.trails.create!(name: 'Grinell Glacier', length_miles: 11, water_source: true, feet_elevation_gain: 2181)

#   visit "/national_parks/#{glacier.id}/trails"
#  end
end

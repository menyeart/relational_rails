require 'rails_helper'

RSpec.describe "National Park's trails index" do
  it "shows all of the trails associated with the national park" do
    glacier = NationalPark.create!(name: 'Glacier', state: 'Montana', total_acres: 1012837, charges_fee: true)
    highline = glacier.trails.create!(name: 'Highline', length_miles: 15, water_source: false, feet_elevation_gain: 2600)
    grinell = glacier.trails.create!(name: 'Grinell Glacier', length_miles: 11, water_source: true, feet_elevation_gain: 2181)

    visit "/national_parks/#{glacier.id}/trails"

    expect(page).to have_content(highline.name)
    expect(page).to have_content("Total Distance(miles): #{highline.length_miles}")
    expect(page).to have_content(grinell.name)
    expect(page).to have_content("Total Distance(miles): #{grinell.length_miles}")
  end

  describe 'sort' do
    let(:trail1) { "<h2>Highline</h2>" }
    let(:trail2) { "<h2>Grinell Glacier</h2>" }
    let(:trail3) { "<h2>Swiftcurrent Peak</h2>" }
  
  it "sorts trails by alphabetical order when the link is clicked" do
    glacier = NationalPark.create!(name: 'Glacier', state: 'Montana', total_acres: 1012837, charges_fee: true)
    highline = glacier.trails.create!(name: 'Highline', length_miles: 15, water_source: false, feet_elevation_gain: 2600)
    grinell = glacier.trails.create!(name: 'Grinell Glacier', length_miles: 11, water_source: true, feet_elevation_gain: 2181)
    swiftcurernt = glacier.trails.create!(name: 'Swiftcurrent Peak', length_miles: 13, water_source: true, feet_elevation_gain: 4000)
    
    visit "/national_parks/#{glacier.id}/trails"
  
    click_link('Sort trails by alphabetical order')
   
    expect(trail2).to appear_before(trail1)
    expect(trail1).to appear_before(trail3)
  end
end
end
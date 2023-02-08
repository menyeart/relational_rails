require 'rails_helper'

RSpec.describe 'destory a national park' do
  it 'can delete the national park from the index page' do
    glacier = NationalPark.create!(name: 'Glacier', state: 'Montana', total_acres: 1012837, charges_fee: true)
    highline = glacier.trails.create!(name: 'Highline', length_miles: 15, water_source: false, feet_elevation_gain: 2600)
    grinell = glacier.trails.create!(name: 'Grinell Glacier', length_miles: 11, water_source: true, feet_elevation_gain: 2181)
    swiftcurernt = glacier.trails.create!(name: 'Swiftcurrent Peak', length_miles: 13, water_source: true, feet_elevation_gain: 4000)

    visit "/national_parks/#{glacier.id}"
    expect(page).to have_content('Glacier')
    click_link('Delete Glacier')
    expect(current_path).to eq('/national_parks/')
    expect(page).to_not have_content('Glacier')
  end
end


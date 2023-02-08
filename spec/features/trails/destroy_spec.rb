require 'rails_helper'

RSpec.describe 'destory a trail' do
  it 'can delete the trail park from the show page' do
    glacier = NationalPark.create!(name: 'Glacier', state: 'Montana', total_acres: 1012837, charges_fee: true)
    highline = glacier.trails.create!(name: 'Highline', length_miles: 15, water_source: false, feet_elevation_gain: 2600)
    grinell = glacier.trails.create!(name: 'Grinell Glacier', length_miles: 11, water_source: true, feet_elevation_gain: 2181)
    swiftcurernt = glacier.trails.create!(name: 'Swiftcurrent Peak', length_miles: 13, water_source: true, feet_elevation_gain: 4000)

    visit "/trails/#{highline.id}"
    expect(page).to have_content('Highline')
    click_link('Delete Highline')
    expect(current_path).to eq('/trails')
    expect(page).to_not have_content('Highline')
  end
end
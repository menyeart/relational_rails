require 'rails_helper'

RSpec.describe 'the trails show page' do
  before :each do
    @national_park1 = NationalPark.create!(name: "Rocky Mountain", state: "Colorado", total_acres: 265807, charges_fee: true)
    @national_park2 = NationalPark.create!(name: "Yosemite", state: "California", total_acres: 10000000, charges_fee: true)
    @trail = Trail.create!(name: "Longs Peak", length_miles: 14, feet_elevation_gain: 4960, water_source: true, national_park_id: @national_park1.id)
    @trail2 = Trail.create!(name: "Mosca Pass", length_miles: 6, feet_elevation_gain: 1400, water_source: false, national_park_id: @national_park2.id)
  end

  it 'displays the trails attributes' do
    visit "/trails/#{@trail.id}"

    expect(page).to have_content(@trail.name)
    expect(page).to have_content("Elevation Gain(ft): #{@trail.feet_elevation_gain}")
    expect(page).to have_content("Length(miles): #{@trail.length_miles}")
    expect(page).to have_content("Water Source: #{@trail.water_source}")
    expect(page).to_not have_content(@trail2.name)
    expect(page).to_not have_content("Elevation Gain(ft): #{@trail2.feet_elevation_gain}")
  end

  it 'displays links for the national parks index page and trails index page' do
    visit "/trails/#{@trail.id}"

    expect(page).to have_link 'All National Parks', href: '/national_parks'
    expect(page).to have_link 'All Trails', href: '/trails'
  end
end
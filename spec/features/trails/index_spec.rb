require 'rails_helper'

RSpec.describe 'the trails index page' do
  it "displays the name of every trail" do
    national_park1 = NationalPark.create!(name: "Rocky Mountain", state: "Colorado", total_acres: 265807, charges_fee: true)
    national_park2 = NationalPark.create!(name: "Yosemite", state: "California", total_acres: 10000000, charges_fee: true)
    trail = Trail.create!(name: "Longs Peak", length_miles: 14, feet_elevation_gain: 4960, water_source: true, national_park_id: national_park1.id)
    trail2 = Trail.create!(name: "Mosca Pass", length_miles: 6,feet_elevation_gain: 1400, water_source: false, national_park_id: national_park1.id)
  
    visit "/trails/"

    expect(page).to have_content(trail.name)
    expect(page).to have_content("Total Distance(miles): #{trail.length_miles}")
    expect(page).to have_content("Elevation Gain(ft): #{trail.feet_elevation_gain}")
    expect(page).to have_content(trail2.name)
    expect(page).to have_content("Total Distance(miles): #{trail2.length_miles}")
    expect(page).to have_content("Elevation Gain(ft): #{trail2.feet_elevation_gain}")
  end

  it "it displays links for the national parks index page and trails index page" do
    national_park1 = NationalPark.create!(name: "Rocky Mountain", state: "Colorado", total_acres: 265807, charges_fee: true)
    national_park2 = NationalPark.create!(name: "Yosemite", state: "California", total_acres: 10000000, charges_fee: true)
    trail = Trail.create!(name: "Longs Peak", length_miles: 14, feet_elevation_gain: 4960, water_source: true, national_park_id: national_park1.id)
    trail2 = Trail.create!(name: "Mosca Pass", length_miles: 6,feet_elevation_gain: 1400, water_source: false, national_park_id: national_park1.id)
    
    visit "/trails/"

    expect(page).to have_link 'All National Parks', href: '/national_parks'
    expect(page).to have_link 'All Trails', href: '/trails'
  end

  it "only shows true or false records when the selector is chosen" do
    national_park1 = NationalPark.create!(name: "Rocky Mountain", state: "Colorado", total_acres: 265807, charges_fee: true)
    trail = Trail.create!(name: "Longs Peak", length_miles: 14, feet_elevation_gain: 4960, water_source: true, national_park_id: national_park1.id)
    trail2 = Trail.create!(name: "Mosca Pass", length_miles: 6,feet_elevation_gain: 1400, water_source: false, national_park_id: national_park1.id)
    
    visit '/trails/'
    click_button('Show only trails with water')

    expect(current_path).to eq("/trails/")
    expect(page).to have_content("Longs Peak")
    expect(page).to_not have_content("Mosca Pass")
    expect(page).to_not have_content("Water Source: false")
  end

end
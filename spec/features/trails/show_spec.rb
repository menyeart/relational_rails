require 'rails_helper'

RSpec.describe 'the trails show page' do
  it 'displays the trails attributes' do
    trail = Trail.create!(name: "Longs Peak", length_miles: 14, feet_elevation_gain: 4960, water_source: true)
    trail2 = Trail.create!(name: "Mosca Pass", length_miles: 6, feet_elevation_gain: 1400, water_source: false)

    visit "/trails/#{trail.id}"

    expect(page).to have_content(trail.name)
    expect(page).to have_content("Elevation Gain(ft): #{trail.feet_elevation_gain}")
    expect(page).to have_content("Length(miles): #{trail.length_miles}")
    expect(page).to have_content("Water Source: #{trail.water_source}")
    expect(page).to_not have_content(trail2.name)
    expect(page).to_not have_content("Elevation Gain(ft): #{trail2.feet_elevation_gain}")
  end
end
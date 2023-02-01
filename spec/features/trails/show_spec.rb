require 'rails_helper'

RSpec.describe 'the trails parks show page' do
  it 'displays the trails name' do
    trail = Trail.create!(name: "Longs Peak", length_miles: 14, feet_elevation_gain: 4960, water_source: true)
    trail2 = Trail.create!(name: "Mosca Pass", length_miles: 6, feet_elevation_gain: 1400, water_source: false)
    visit "/trails/#{trail.id}"

    expect(page).to have_content(trail.name)
    expect(page).to_not have_content(trail2.name)
  end

  it 'displays the trails length' do
    trail = Trail.create!(name: "Longs Peak", length_miles: 14, feet_elevation_gain: 4960, water_source: true)
    trail2 = Trail.create!(name: "Mosca Pass", length_miles: 5, feet_elevation_gain: 1400, water_source: false)
    visit "/trails/#{trail.id}"

    expect(page).to have_content(trail.length_miles)
    expect(page).to_not have_content(trail2.length_miles)
  end

  it 'displays the trails elevation gain' do
    trail = Trail.create!(name: "Longs Peak", length_miles: 14, feet_elevation_gain: 4960, water_source: true)
    trail2 = Trail.create!(name: "Mosca Pass", length_miles: 5, feet_elevation_gain: 1400, water_source: false)
    visit "/trails/#{trail.id}"

    expect(page).to have_content(trail.feet_elevation_gain)
    expect(page).to_not have_content(trail2.feet_elevation_gain)
  end

  it 'displays the trails park id' do
    trail = Trail.create!(name: "Longs Peak", length_miles: 14, feet_elevation_gain: 4960, water_source: true, park_id: 1)
    trail2 = Trail.create!(name: "Mosca Pass", length_miles: 5, feet_elevation_gain: 1400, water_source: false, park_id: 2)
    visit "/trails/#{trail.id}"

    expect(page).to have_content(trail.park_id)
    expect(page).to_not have_content(trail2.park_id)
  end
end
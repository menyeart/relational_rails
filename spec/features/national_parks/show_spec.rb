require 'rails_helper'

RSpec.describe 'the national parks show page' do
  it 'displays the national park name' do
    national_park = NationalPark.create!(name: "Rocky Mountain", state: "Colorado", total_acres: 265807, charges_fee: true)
    national_park2 = NationalPark.create!(name: "Yosemite", state: "California", total_acres: 10000000, charges_fee: true)
    visit "/national_parks/#{national_park.id}"

    expect(page).to have_content(national_park.name)
    expect(page).to_not have_content(national_park2.name)
  end

  it 'displays the national park state' do
    national_park = NationalPark.create!(name: "Rocky Mountain", state: "Colorado", total_acres: 265807, charges_fee: true)
    visit "/national_parks/#{national_park.id}"

    expect(page).to have_content(national_park.state)
  end

  it 'displays the national park total acres' do
    national_park = NationalPark.create!(name: "Rocky Mountain", state: "Colorado", total_acres: 265807, charges_fee: true)
    visit "/national_parks/#{national_park.id}"

    expect(page).to have_content(national_park.total_acres)
  end

  it 'displays the national park total acres' do
    national_park = NationalPark.create!(name: "Rocky Mountain", state: "Colorado", total_acres: 265807, charges_fee: true)
    visit "/national_parks/#{national_park.id}"

    expect(page).to have_content(national_park.charges_fee)
  end
end
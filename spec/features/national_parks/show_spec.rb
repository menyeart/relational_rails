require 'rails_helper'

RSpec.describe 'the national parks show page' do
  it 'displays the national park name and attributes' do
    national_park = NationalPark.create!(name: "Rocky Mountain", state: "Colorado", total_acres: 265807, charges_fee: true)
    national_park2 = NationalPark.create!(name: "Yosemite", state: "California", total_acres: 10000000, charges_fee: true)

    visit "/national_parks/#{national_park.id}"

    expect(page).to have_content(national_park.name)
    expect(page).to have_content("Total Acres: #{national_park.total_acres}")
    expect(page).to have_content("State: #{national_park.state}")
    expect(page).to have_content("Charges Fee: #{national_park.charges_fee}")
    expect(page).to_not have_content(national_park2.name)
    expect(page).to_not have_content("Total Acres: #{national_park2.total_acres}")
  end

  it "it displays links for the national parks index page and trails index page" do
    national_park = NationalPark.create!(name: "Rocky Mountain", state: "Colorado", total_acres: 265807, charges_fee: true)
    national_park2 = NationalPark.create!(name: "Yosemite", state: "California", total_acres: 10000000, charges_fee: true)

    visit "/national_parks/#{national_park.id}"

    expect(page).to have_link 'All National Parks', href: '/national_parks'
    expect(page).to have_link 'All Trails', href: '/trails'
  end

end
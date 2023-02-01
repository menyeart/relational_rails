require 'rails_helper'

RSpec.describe 'the national parks index page' do
  it 'displays the names of every national park' do
    national_park1 = NationalPark.create!(name: "Rocky Mountain", state: "Colorado", total_acres: 265807, charges_fee: true)
    national_park2 = NationalPark.create!(name: "Yosemite", state: "California", total_acres: 10000000, charges_fee: true)

  visit "/national_parks"

  expect(page).to have_content(national_park1.name)
  expect(page).to have_content(national_park2.name)
  end
end

  


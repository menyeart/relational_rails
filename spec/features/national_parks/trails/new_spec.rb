require 'rails_helper'

RSpec.describe 'the National Park Trail creation' do
  before :each do
    @glacier = NationalPark.create!(name: 'Glacier', state: 'Montana', total_acres: 1012837, charges_fee: true)
    @highline = @glacier.trails.create!(name: 'Highline', length_miles: 15, water_source: false, feet_elevation_gain: 2600)
    @grinell = @glacier.trails.create!(name: 'Grinell Glacier', length_miles: 11, water_source: true, feet_elevation_gain: 2181)
  end

  it "links to the new page from national parks trails index" do
    visit "/national_parks/#{@glacier.id}/trails"

    click_link('Create Trail')
    
    expect(current_path).to eq("/national_parks/#{@glacier.id}/trails/new")
  end

  it "can create a new national park trail" do
    visit "/national_parks/#{@glacier.id}/trails/new"

    fill_in('name', with: 'River Walk')
    fill_in('length_miles', with: 3 )
    fill_in('feet_elevation_gain', with: 100 )
    choose('water_source', with: true)
    click_button('Create Trail')

    expect(current_path).to eq("/national_parks/#{@glacier.id}/trails")
    expect(page).to have_content("River Walk")
  end
end
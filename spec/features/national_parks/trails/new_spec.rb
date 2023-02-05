# User Story 13, Parent Child Creation 

# As a visitor
# When I visit a Parent Children Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

require 'rails_helper'

RSpec.describe 'the National Park Trail creation' do
  it "links to the new page from national parks trails index" do
    glacier = NationalPark.create!(name: 'Glacier', state: 'Montana', total_acres: 1012837, charges_fee: true)
    highline = glacier.trails.create!(name: 'Highline', length_miles: 15, water_source: false, feet_elevation_gain: 2600)
    grinell = glacier.trails.create!(name: 'Grinell Glacier', length_miles: 11, water_source: true, feet_elevation_gain: 2181)
    
    visit "/national_parks/#{glacier.id}/trails"

  click_link('Create Trail')
  expect(current_path).to eq("/national_parks/#{glacier.id}/trails/new")
  end

  it "can create a new national park trail" do
    glacier = NationalPark.create!(name: 'Glacier', state: 'Montana', total_acres: 1012837, charges_fee: true)
    highline = glacier.trails.create!(name: 'Highline', length_miles: 15, water_source: false, feet_elevation_gain: 2600)
    grinell = glacier.trails.create!(name: 'Grinell Glacier', length_miles: 11, water_source: true, feet_elevation_gain: 2181)

    visit "/national_parks/#{glacier.id}/trails/new"

    fill_in('name', with: 'River Walk')
    fill_in('length_miles', with: 3 )
    fill_in('feet_elevation_gain', with: 100 )
    choose('water_source', with: true)
    click_button('Create Trail')
    # new_park_id = NationalPark.last.id
    expect(current_path).to eq("/national_parks/#{glacier.id}/trails")
    expect(page).to have_content("River Walk")
  end

 
end
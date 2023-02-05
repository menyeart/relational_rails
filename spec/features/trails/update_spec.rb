

# User Story 14, Child Update 

# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information




require 'rails_helper'

RSpec.describe 'the Trail edit' do
  it "links to the edit page" do
    national_park1 = NationalPark.create!(name: "Rocky Mountain", state: "Colorado", total_acres: 265807, charges_fee: true)
    trail = Trail.create!(name: "Longs Peak", length_miles: 14, feet_elevation_gain: 4960, water_source: true, national_park_id: national_park1.id)

    visit "/trails/#{trail.id}"

    click_button "Edit #{trail.name}"

    expect(current_path).to eq("/trails/#{trail.id}/edit")
  end

  it "can edit the trail" do
    national_park1 = NationalPark.create!(name: "Rocky Mountain", state: "Colorado", total_acres: 265807, charges_fee: true)
    trail = Trail.create!(name: "Longs Peak", length_miles: 14, feet_elevation_gain: 4960, water_source: true, national_park_id: national_park1.id)

    visit "/trails/#{trail.id}/edit"

    expect(page).to have_content('Longs Peak')

    fill_in('name', with: 'Bear Lake')
    fill_in('length_miles', with: '2')
    fill_in('feet_elevation_gain', with: 30)
    choose('water_source', with: true)
    click_button('Update Trail')
    
    expect(current_path).to eq("/trails/#{trail.id}")
    expect(page).to have_content("Bear Lake")

  end
end

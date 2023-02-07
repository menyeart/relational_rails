require 'rails_helper'

RSpec.describe 'the Trail edit' do
  before :each do 
    @national_park1 = NationalPark.create!(name: "Rocky Mountain", state: "Colorado", total_acres: 265807, charges_fee: true)
    @trail = Trail.create!(name: "Longs Peak", length_miles: 14, feet_elevation_gain: 4960, water_source: true, national_park_id: @national_park1.id)
  end

  it "links to the edit page" do
    visit "/trails/#{@trail.id}"
    click_button "Edit #{@trail.name}"

    expect(current_path).to eq("/trails/#{@trail.id}/edit")
  end

  it "can edit the trail" do
    visit "/trails/#{@trail.id}/edit"

    expect(page).to have_content('Longs Peak')

    fill_in('name', with: 'Bear Lake')
    fill_in('length_miles', with: '2')
    fill_in('feet_elevation_gain', with: 30)
    choose('water_source', with: true)
    click_button('Update Trail')
    
    expect(current_path).to eq("/trails/#{@trail.id}")
    expect(page).to have_content("Bear Lake")
  end
end

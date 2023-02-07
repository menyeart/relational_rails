require 'rails_helper'

RSpec.describe 'the National Park edit' do
  it "links to the edit page" do
    park = NationalPark.create!(name: 'Rocky')

    visit '/national_parks'

    click_button "Edit #{park.name}"
    expect(current_path).to eq("/national_parks/#{park.id}/edit")
  end

  it "can edit the national park" do
    park = NationalPark.create!(name: 'Rock')

    visit "/national_parks/"

    expect(page).to have_content('Rock')
    click_button 'Rock'

    fill_in('name', with: 'Rocky')
    fill_in('state', with: 'Colorado')
    fill_in('total_acres', with: 100000)
    choose('charges_fee', with: true)
    click_button('Update National Park')
    
    expect(current_path).to eq("/national_parks/#{park.id}")
    expect(page).to have_content("Rocky")
  end
end
require 'rails_helper'

RSpec.describe 'the National Park Creation' do
  it "links to the new page from national parks index" do
    visit '/national_parks'
    click_link('New National Park')

    expect(current_path).to eq('/national_parks/new')
  end

  it "can create a new national park" do
    visit '/national_parks/new'

    fill_in('name', with: 'Denali')
    fill_in('state', with: 'Alaska')
    fill_in('total_acres', with: 100000)
    choose('charges_fee', with: true)
    click_button('Create National Park')
    
    expect(current_path).to eq("/national_parks/")
    expect(page).to have_content("Denali")
  end
end
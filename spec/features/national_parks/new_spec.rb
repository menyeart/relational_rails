require 'rails_helper'

 #   As a visitor
  # When I visit the Parent Index page
  # Then I see a link to create a new Parent record, "New Parent"
  # When I click this link
  # Then I am taken to '/parents/new' where I  see a form for a new parent record

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
      new_park_id = NationalPark.last.id
      expect(current_path).to eq("/national_parks/")
      expect(page).to have_content("Denali")
    end

   
  end
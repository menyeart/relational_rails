require 'rails_helper'

RSpec.describe "National Park's trails index" do
  describe 'page featueres' do
    let(:trail1) { "<h2>Highline</h2>" }
    let(:trail2) { "<h2>Grinell Glacier</h2>" }
    let(:trail3) { "<h2>Swiftcurrent Peak</h2>" }

    it "shows all of the trails associated with the national park" do
      glacier = NationalPark.create!(name: 'Glacier', state: 'Montana', total_acres: 1012837, charges_fee: true)
      highline = glacier.trails.create!(name: 'Highline', length_miles: 15, water_source: false, feet_elevation_gain: 2600)
      grinell = glacier.trails.create!(name: 'Grinell Glacier', length_miles: 11, water_source: true, feet_elevation_gain: 2181)

      visit "/national_parks/#{glacier.id}/trails"

      expect(page).to have_content(highline.name)
      expect(page).to have_content("Total Distance(miles): #{highline.length_miles}")
      expect(page).to have_content(grinell.name)
      expect(page).to have_content("Total Distance(miles): #{grinell.length_miles}")
    end

    it "sorts trails by alphabetical order when the link is clicked" do
      glacier = NationalPark.create!(name: 'Glacier', state: 'Montana', total_acres: 1012837, charges_fee: true)
      highline = glacier.trails.create!(name: 'Highline', length_miles: 15, water_source: false, feet_elevation_gain: 2600)
      grinell = glacier.trails.create!(name: 'Grinell Glacier', length_miles: 11, water_source: true, feet_elevation_gain: 2181)
      swiftcurernt = glacier.trails.create!(name: 'Swiftcurrent Peak', length_miles: 13, water_source: true, feet_elevation_gain: 4000)
      
      visit "/national_parks/#{glacier.id}/trails"
    
      click_link('Sort trails by alphabetical order')
    
      expect(trail2).to appear_before(trail1)
      expect(trail1).to appear_before(trail3)
    end

    it "has individual links to edit each trail" do
      glacier = NationalPark.create!(name: 'Glacier', state: 'Montana', total_acres: 1012837, charges_fee: true)
      highline = glacier.trails.create!(name: 'Highline', length_miles: 15, water_source: false, feet_elevation_gain: 2600)
      grinell = glacier.trails.create!(name: 'Grinell Glacier', length_miles: 11, water_source: true, feet_elevation_gain: 2181)
      swiftcurernt = glacier.trails.create!(name: 'Swiftcurrent Peak', length_miles: 13, water_source: true, feet_elevation_gain: 4000)

      visit "/national_parks/#{glacier.id}/trails"
      click_link("Edit #{highline.name}")
    
      expect(current_path).to eq("/trails/#{highline.id}/edit")
  
      visit "/national_parks/#{glacier.id}/trails"
      click_link("Edit #{grinell.name}")
      
      expect(current_path).to eq("/trails/#{grinell.id}/edit")
    end

    it "has a form to input a number value and get records that match that specification" do
      glacier = NationalPark.create!(name: 'Glacier', state: 'Montana', total_acres: 1012837, charges_fee: true)
      highline = glacier.trails.create!(name: 'Highline', length_miles: 15, water_source: false, feet_elevation_gain: 2600)
      grinell = glacier.trails.create!(name: 'Grinell Glacier', length_miles: 5, water_source: true, feet_elevation_gain: 2181)
      swiftcurernt = glacier.trails.create!(name: 'Swiftcurrent Peak', length_miles: 2, water_source: true, feet_elevation_gain: 4000)

      visit "/national_parks/#{glacier.id}/trails"
      
      fill_in('Find only trails with lengths over:', with: 5 )
   
      click_button("Search")
   
      expect(current_path).to eq("/national_parks/#{glacier.id}/trails")
      expect(page).to have_content("Highline")
      expect(page).to_not have_content("Grinell Glacier")
      expect(page).to_not have_content("Swiftcurrent Peak")

    end
  end
end
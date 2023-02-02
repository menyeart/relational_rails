# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Trail.destroy_all
NationalPark.destroy_all

rocky = NationalPark.create!(name: 'Rocky Mountain', state: 'Colorado', total_acres: 265807, charges_fee: true)

dunes = NationalPark.create!(name: 'Great Sand Dunes', state: 'Colorado', total_acres: 149028, charges_fee: false)

yosemite = NationalPark.create!(name: 'Yosemite', state: 'California', total_acres: 747956, charges_fee: true)

glacier = NationalPark.create!(name: 'Glacier', state: 'Montana', total_acres: 1012837, charges_fee: true)

rocky.trails.create!(name: 'Sky Pond', length_miles: 9, water_source: true, feet_elevation_gain: 1750)
rocky.trails.create!(name: 'Longs Peak', length_miles: 14, water_source: true, feet_elevation_gain: 4960)
rocky.trails.create!(name: 'Dream Lake', length_miles: 2, water_source: true, feet_elevation_gain: 425)

dunes.trails.create!(name: 'High Dune', length_miles: 3, water_source: false, feet_elevation_gain: 600)
dunes.trails.create!(name: 'Mosca Pass', length_miles: 6, water_source: false, feet_elevation_gain: 1400)

yosemite.trails.create!(name: 'Vernal Falls', length_miles: 4, water_source: true, feet_elevation_gain: 1300)
yosemite.trails.create!(name: 'Glacier Point', length_miles: 1, water_source: false, feet_elevation_gain: 167)
yosemite.trails.create!(name: 'Columbia Rock', length_miles: 2, water_source: false, feet_elevation_gain: 970)

glacier.trails.create!(name: 'Highline', length_miles: 15, water_source: false, feet_elevation_gain: 2600)
glacier.trails.create!(name: 'Grinell Glacier', length_miles: 11, water_source: true, feet_elevation_gain: 2181)
glacier.trails.create!(name: 'Swiftcurrent Pass', length_miles: 16, water_source: true, feet_elevation_gain: 3760)
glacier.trails.create!(name: 'Hidden Lake', length_miles: 4, water_source: true, feet_elevation_gain: 1374)




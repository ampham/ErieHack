# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# generates a random float for an Update's values
def random_range
  rand * (9) + 1
end

seed_locations = ["Ransom Creek", "Tonawanda Creek", "Buffalo Creek", "Cazenovia Creek",
"Buffalo River", "Erie Basin & Black Rock Canal", "Scajaquada Creek", "Ellicott Creek",
"Cayuga Creek (Erie County)", "Tonawanda Creek (Lower Main Stem)", "Cayuga & Bergholtz Creek (Niagara Falls)", 
"Gill Creek"]

the_description = "A location"

for location in seed_locations
  Location.create(title: location, 
    description: the_description
    )
end

=begin
20.times do |p|
  lead = random_range
  mercury = random_range
  plutonium = random_range
  location = rand(1..2)
  user = rand(2)
  Update.create(lead: lead,
    mercury: mercury,
    plutonium: plutonium,
    location_id: location,
    user_id: user
    )
end
=end

=begin
20.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@riverkeeper.com"
  password = "password"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end
=end
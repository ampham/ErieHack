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

i = 0
20.times do |p|
  lead = random_range
  mercury = random_range
  plutonium = random_range
  location = rand(3..4)
  user = rand(2)
  Update.create(id: i
    lead: lead,
    mercury: mercury,
    plutonium: plutonium,
    location_id: location,
    user_id: user
    )
  i += 1 
end

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
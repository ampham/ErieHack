# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

options = ['Received', 'Under Investigation', 'Resolved']

for x in options
  StatusOption.create(name: x)
end

=begin
# get an array and read the numbers in
lines = []
File.open('buffdata.txt', 'r') do |x|  
  while line = x.gets  
    lines << line 
  end  
end  

streets = []
zips = []
leads = []

counter = 6
for w in lines
  if counter % 6 == 0
    streets << w 
  elsif counter % 6 == 1
    zips << w 
  elsif counter % 6 == 5
    leads << w 
  end
  counter += 1
end

for q in 0..117
  street = streets[q].strip
  zip = zips[q].strip
  lead = leads[q] == "ND" ? -1 : leads[q].strip.to_f

  if lead == 0.0
    lead = -1
  end

  BuffaloReport.create(street: street, zip: zip, lead: lead)
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
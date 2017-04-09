# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

bodies = ['blah', 'The water is bad', 'Cthulhu is emerging from the faucet', 'Something is very wrong']
account_ids = [0, 1, 2, 3]
statuses = ['blah', 'Received', 'Under Investigation', 'Resolved']
note = 'Received'
addresses = ['blah', '23 Null St.', '55 Pointer Dr.', '45 Tree Ln']

for x in 1..3
  Report.create(  body: bodies[x],
                  account_id: 1,
                  status: 1,
                  created_at: DateTime.now,
                  updated_at: DateTime.now,
                  notes: note,
                  address: addresses[x])
  puts bodies[x]
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
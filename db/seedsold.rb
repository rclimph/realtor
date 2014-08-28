# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name(role)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.add_role :admin

puts 'DUMMY PROPERTY OWNERS'
owner_list = [
  [ "Sharie Realty Corporation",
    "Mactan Road",
    "Kasambagan",
    "Cebu City",
    "6000",
    "Philippines",
    "sharie_ruiz@icloud.com",
    "+63.917.6240800",
    "Sharmine Ruiz",
    "President"],
  [ "Cebu R3LP Corporation",
    "Chatswood Avenue",
    "A.S. Fortuna Road",
    "Mandaue City",
    "6014",
    "Philippines",
    "rclim_ph@me.com",
    "+63.917.6240880",
    "Raymond Lim",
    "Vice President"]
]

owner_list.each do |a, b, c, d, e, f, g, h, i, j|
  p = PropertyOwner.new(company_name: a,
                        email: g,
                        contact_number: h,
                        representative_name: i,
                        representative_position: j)
  p.build_address(address_1: b,
                  address_2: c,
                  city: d,
                  zip: e,
                  country: f)
  p.save!

                       
end

development_area_list = [
  [ "Chatswood Center",
    "Chatswood Avenue",
    "A.S. Fortuna Corner Hernan Cortes",
    "Mandaue City",
    "CEBU",
    "6014",
    "Philippines",
    "2400",
    "8000000"],
  [ "Astana Square",
    "M.J. Cuenco Avenue",
    "",
    "Cebu City",
    "CEBU",
    "6000",
    "Philippines",
    "10000",
    "12000000"    
  ]
]

puts "ADDING DUMMY DEVELOPMENTS TO PROPERTY OWNERS"
num = 0

owners = PropertyOwner.find(:all)
owners.each do |pow|
  num += 1
  development_area_list.each do |a, b, c, d, e, f, g, h, i|
    pow.development_areas.create( name: num.to_s + a, 
                                  address_1: b,
                                  address_2: c,
                                  city: d,
                                  province: e,
                                  zip: f,
                                  country: g,
                                  area: h,
                                  valuation: i )
  end
end

puts "ADDING DUMMY BUILDINGS TO DEVELOPMENT AREAS"

building_list = [
  [ "Chatswood Residences",
    "Mixed Use",
    true,
    "",
    "",
    "",
    "",
    ""],
  [ "Building B",
    "Offices",
    false,
    "Germania Street",
    "",
    "Lapu-Lapu City",
    "6000",
    "Philippines"]
]

owners = PropertyOwner.find(:all)
owners.each do |pow|
  num = 0
  pow.development_areas.each do |dev|
    num += 1
    building_list.each do |a, b, c, d, e, f, g, h|
      building = dev.buildings.new( name: num.to_s + a,
                         building_type: b,
                         address_same_as_development: c,
                         address_1: d,
                         address_2: e,
                         city: f,
                         zip: g,
                         country: h )
      building.copy_address_if_same(dev)
      building.save!
    end
  end
  
end

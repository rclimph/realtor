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
                  region: e,
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
    8000000],
  [ "Astana Square",
    "M.J. Cuenco Avenue",
    "",
    "Cebu City",
    "CEBU",
    "6000",
    "Philippines",
    "10000",
    12000000    
  ]
]

puts 'Adding development areas to property owners.'

num = 0

owners = PropertyOwner.find(:all)
owners.each do |pow|
  num += 1
  development_area_list.each do |a, b, c, d, e, f, g, h, i|
    da = pow.development_areas.new( name: num.to_s + a,
                                  area: h,
                                  valuation: i)
    da.build_address( address_1: b,
                      address_2: c,
                      city: d,
                      region: e,
                      zip: f,
                      country: g )
    da.save!
  end
end

puts "ADDING DUMMY BUILDINGS TO DEVELOPMENT AREAS"

building_list = [
  [ "Chatswood Residences",
    "Serviced Apartment",
    true,
    "",
    "",
    "",
    "",
    "",
    "",
    -2,
    5],
  [ "Building B",
    "Offices",
    false,
    "Germania Street",
    "",
    "Lapu-Lapu City",
    "CEBU",
    "6000",
    "Philippines",
    -4,
    1]
]

owners = PropertyOwner.find(:all)

owners.each do |pow|
  pow.development_areas.each do |dev|
    building_list.each do |a, b, c, d, e, f, g, h, i, j, k|
      building_name = (a + " @ " + dev.name)
      puts "Adding building " + building_name
      building = dev.buildings.new( name: building_name,
                                    building_type: b,
                                    address_same_as_development: c,
                                    lowest_floor: j,
                                    highest_floor: k )
      if building.address_same_as_development
        building.build_address( address_1: dev.address.address_1,
                                address_2: dev.address.address_2,
                                city: dev.address.city,
                                region: dev.address.region,
                                zip: dev.address.zip,
                                country: dev.address.country )
      else
        building.build_address( address_1: d,
                                address_2: e,
                                city: f,
                                region: g,
                                zip: h,
                                country: i )
      end
      building.save!
    end
  end
end

puts "ADDING UNIT TEMPLATES FOR APARTMENT UNITS FOR ALL BUILDINGS"

unit_list = [
  [ "One Bedroom Premier",
    "Residential - Serviced Apartment",
    43,
    true
  ],
  [ "Two Bedroom Deluxe",
    "Residential - Serviced Apartment",
    55,
    true
  ],
  [ "One Bedroom Standard",
    "Residential - Apartment",
    42,
    false
  ]
]

buildings = Building.find(:all)

buildings.each do |building|
  unit_list.each do |a,b,c,d|
    unit_template = building.unit_templates.new( name: a, unit_type: b, area: c, furnished: d )
    unit_template.save!
  end
end
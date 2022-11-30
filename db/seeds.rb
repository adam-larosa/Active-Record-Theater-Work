# This seed file requires the Faker Gem!  Please type:
#       bundle add faker
# from the root directory of the repo OR manually add the line
#       gem "faker"
# to the Gemfile then bundle install again.

Faker::UniqueGenerator.clear

Audition.destroy_all
Role.destroy_all

puts "\nCreating Roles..."
3.times do
    Role.create(
        character_name: Faker::TvShows::Seinfeld.character
    )
end

puts "Creating Auditions..."
7.times do
    Audition.create( 
        actor: Faker::Name.unique.name, 
        location: Faker::Movies::Hobbit.location, 
        phone: rand( 3400..7322), 
        hired: false, 
        role_id: Role.pluck( :id ).sample
    )
end

puts "Making sure the first Role has two hired actors..."
2.times do
    Audition.create(
        actor: Faker::Name.unique.name, 
        location: Faker::Movies::Hobbit.location, 
        phone: rand( 3400..7322), 
        hired: true, 
        role_id: Role.pluck( :id ).first
    )
end

puts "Making sure the second Role has one hired actor..."
Audition.create( 
    actor: Faker::Name.unique.name, 
    location: Faker::Movies::Hobbit.location, 
    phone: rand( 3400..7322), 
    hired: true, 
    role_id: Role.pluck( :id )[1]
)

third_role_id = Role.pluck( :id )[2]
r = Role.find( third_role_id )
role_name = r.character_name
puts "The third role has no actor.  Why is #{role_name} so hard to cast for?"

puts "\nSeeded!"
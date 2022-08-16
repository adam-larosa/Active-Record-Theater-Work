Audition.destroy_all
Role.destroy_all

dv = Role.create( character_name: "Darth Vader" )
ls = Role.create( character_name: "Luke Skywalker" )
hs = Role.create( character_name: "Han Solo" )

ids = Role.pluck( :id )

5.times do
    Audition.create(
        actor: Faker::Name.name,
        location: Faker::Movies::Hobbit.location,
        phone: Faker::PhoneNumber.cell_phone.to_i,
        hired: true,
        role_id: ids.sample
    )
end
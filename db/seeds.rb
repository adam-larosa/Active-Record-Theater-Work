puts "seeding!"

Role.destroy_all
Audition.destroy_all

chars = [
    "Darth Vader", "Sauron", "Dylan McKay", "Frodo", "Luke Skywalker"
]
chars.each {|character| Role.create(character_name: character)}

175.times {
    Audition.create(
        actor: Faker::Name.name,
        location: Faker::Books::Dune.planet,
        phone: (rand * 100).to_i,
        hired: false,
        role: Role.all.sample
    )
}
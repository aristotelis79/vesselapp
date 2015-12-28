Vessel.create({
  title: 'A fantastic sailing boat',
  description: 'This is a test boat, please ignore',
  daily_price: 200,
  fee_pc: 20,
})

User.create!(name: "Example Admin_IT",
             email: "Admin_IT@mail.com",
             password: "foobar",
             admin: true)
             
User.create!(name: "Aristotelis Example",
             email: "aristotelis@example.com",
             password: "foobar",
             admin: false)
             
20.times do |n|
    Vessel.create!(
        title: Faker::Lorem.sentence(3),
        description: Faker::Lorem.sentence(10),
        daily_price: 10 + n*10,
        fee_pc: 20 )
end
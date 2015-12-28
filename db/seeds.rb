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
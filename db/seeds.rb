1.upto(2) do |i|
  name = Faker::Name.name
  email = "user#{i}@bbq.com"
  password = '123456'
  User.create!(name:  name, email: email,
               password: password, password_confirmation: password)
end

2.times do
  title = Faker::Lorem.word
  description = Faker::Lorem.sentence
  address = Faker::Address.full_address
  datetime = Faker::Date.forward(60)
  User.first.events.create!(title: title, description: description,
                            address: address, datetime: datetime)
end

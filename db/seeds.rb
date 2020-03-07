# coding: utf-8

User.create!( name: "Sample User",
              email: "sample@email.com",
              password: "password",
              password_confirmation: "password",
              admin: true)
              
99.times do |n|
  name = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end

puts "UserCreate"


@users = User.order(:created_at).task(3)

50.times do |w|
  work = Faker::Name.name(2)
  details= Faker::Lorem.sentence(5)
  @users.each { |user| user.tasks.create!(work: work, details: details)}
end

puts "TaskCreate"
  

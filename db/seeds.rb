User.create! name: "matthew ess",
    email: "mess@croakr.xyz",
    password: "password",
    password_confirmation: "password",
    admin: true

99.times do |n|
  name = Faker::Name.name
  email = "user#{n + 1}@croakr.xyz"
  password = "password"
  User.create! name: name,
      email: email,
      password: password,
      password_confirmation: password
end
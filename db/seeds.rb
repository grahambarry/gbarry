Use.create!(name:  "Example Use",
             email: "example@railstutorial.org",
             password:              "12345678",
             password_confirmation: "12345678",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

50.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  Use.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end
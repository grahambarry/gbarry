uses = Use.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  uses.each { |use| use.microposts.create!(content: content) }
end
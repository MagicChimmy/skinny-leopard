# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

Instrument.destroy_all
User.destroy_all

# Admin User
User.create!(first_name: "Joe", last_name: "Blogs", password: "123456", email: "joe@blogs.com")
puts "created #{User.first.email} as an admin!"

# puts 'creating instrument db'
3.times do
  user = User.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: 'password')
  user.email = "#{user.first_name}@email.com"
  user.save!
end


category = %w[electronic percussion classical strings woodwind]
names = %w[guitar keyboard trumpet flute drums banjo saxophone bass cello]
20.times do
  Instrument.create!(name: names.sample.capitalize, location: Faker::Address.city, price: rand(2..20) * 10, user: User.all.sample, category: category.sample, photo: "https://source.unsplash.com/random/?instrument")
end


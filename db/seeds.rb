# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'
require 'faker'

User.destroy_all
Instrument.destroy_all
Booking.destroy_all
Review.destroy_all

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
6.times do
  Instrument.create!(name: names.sample.capitalize, location: Faker::Address.city, price: rand(2..20) * 10, user: User.all.sample, category: category.sample, remote_photo_url: "https://source.unsplash.com/random/?instrument", description: Faker::ChuckNorris.fact)
end


10. times do
  instrument = Instrument.all.sample
  checkin = Faker::Date.backward((1..20).to_a.sample)
  checkout =  Faker::Date.forward((1..20).to_a.sample)
  value = instrument.price * (checkout - checkin).to_i
  Booking.create!(instrument: instrument, user: User.all.sample, checkin: checkin, checkout: checkout, value: value)
end

10. times do
  instrument = Instrument.all.sample
  checkin = Faker::Date.backward((20..40).to_a.sample)
  checkout =  Faker::Date.backward((1..20).to_a.sample)
  value = instrument.price * (checkout - checkin).to_i
  Booking.create!(instrument: instrument, user: User.all.sample, checkin: checkin, checkout: checkout, value: value)
end

10.times do
  Review.create!(content: Faker::Movies::HarryPotter.quote , rating: rand(1..5), booking: Booking.all.sample)
end



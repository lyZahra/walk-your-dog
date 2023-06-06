require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning up database..."
Pet.destroy_all
User.destroy_all
puts "Database cleaned"

juliette = User.create!(email: "walkyourdog.user@gmail.com", password: "secret", name: "Juliette")
tom = User.create!(email: "what.a.email.@gmail.com", password: "secret", name: "Tom")
chris = User.create!(email: "guywholovesdogs@gmail.com", password: "secret", name: "Chris")
safia = User.create!(email: "example@gmail.com", password: "secret", name: "Safia")
nurra = User.create!(email: "example.example@gmail.com", password: "secret", name: "Nurra")

bella_file = URI.open("https://images.pexels.com/photos/4587998/pexels-photo-4587998.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
bella = Pet.new(name: "Bella", availability: true, breed: "poodle", description: "cuddling and love chicken")
bella.user = juliette
bella.photo.attach(io: bella_file, filename: "bella.png", content_type: "image/png")
bella.save

max_file = URI.open("https://images.pexels.com/photos/4587998/pexels-photo-4587998.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
max = Pet.new(name: "Max", availability: true, breed: "labrador", description: "super loyal, don't like to run")
max.user = tom
max.photo.attach(io: max_file, filename: "max.png", content_type: "image/png")
max.save

luna_file = URI.open("https://images.pexels.com/photos/4587998/pexels-photo-4587998.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
luna = Pet.new(name: "Luna", availability: false, breed: "golden retriever", description: "yound and super athletic")
luna.user = chris
luna.photo.attach(io: luna_file, filename: "luna.png", content_type: "image/png")
luna.save

cooper_file = URI.open("https://images.pexels.com/photos/4587998/pexels-photo-4587998.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
cooper = Pet.new(name: "Cooper", availability: true, breed: "bulldog", description: "very social ! Cooper loves others dogs")
cooper.user = safia
cooper.photo.attach(io: cooper_file, filename: "cooper.png", content_type: "image/png")
cooper.save

daisy_file = URI.open("https://images.pexels.com/photos/4587998/pexels-photo-4587998.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
daisy = Pet.new(name: "Daisy", availability: false, breed: "german sheperd", description: "Daisy is super kind, she loves walking under rain")
daisy.user = nurra
daisy.photo.attach(io: daisy_file, filename: "daisy.png", content_type: "image/png")
daisy.save

# Seed for bookings
a = Booking.new(start_date: "2023-08-01", end_date: "2023-08-05", booking_date: "2023-06-20", status: "pending")
a.pet = bella
a.user = tom
a.save

b = Booking.new(start_date: "2021-08-01", end_date: "2021-08-05", booking_date: "2023-06-20", status: "pending")
b.pet = max
b.user = juliette
b.save

c = Booking.new(start_date: "2021-08-01", end_date: "2021-08-05", booking_date: "2023-06-20", status: "pending")
c.pet = luna
c.user = chris
c.save

d = Booking.new(start_date: "2021-08-01", end_date: "2021-08-05", booking_date: "2023-06-20", status: "pending")
d.pet = cooper
d.user = safia
d.save

e = Booking.new(start_date: "2021-08-01", end_date: "2021-08-05", booking_date: "2023-06-20", status: "pending")
e.pet = daisy
e.user = nurra
e.save

# create reviews
review_a = Review.new(comment: "Bella is a very good dog, she is very kind and she loves to play with other dogs", rating: 5)
review_a.booking = a
review_a.pet_id = bella
review_a.save

review_b = Review.new(comment: "Max is a very good dog, he is very kind and he loves to play with other dogs", rating: 5)
review_b.booking = b
review_b.pet_id = max
review_b.save

review_c = Review.new(comment: "Luna is a very good dog, she is very kind and she loves to play with other dogs", rating: 5)
review_c.booking = c
review_c.pet_id = luna
review_c.save

review_d = Review.new(comment: "Cooper is a very good dog, he is very kind and he loves to play with other dogs", rating: 5)
review_d.booking = d
review_d.pet_id = cooper
review_d.save

review_e = Review.new(comment: "Daisy is a very good dog, she is very kind and she loves to play with other dogs", rating: 5)
review_e.booking = e
review_e.pet_id = daisy
review_e.save

puts "Finished!"

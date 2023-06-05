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

bella_file = URI.open("https://images.pexels.com/photos/4588435/pexels-photo-4588435.jpeg")
bella = Pet.new(name: "Bella", availability: true, breed: "poodle", description: "cuddling and love chicken")
bella.user = juliette
bella.photo.attach(io: bella_file, filename: "bella.png", content_type: "image/png")
bella.save

max_file = URI.open("https://images.pexels.com/photos/4588435/pexels-photo-4588435.jpeg")
max = Pet.new(name: "Max", availability: true, breed: "labrador", description: "super loyal, don't like to run")
max.user = tom
max.photo.attach(io: max_file, filename: "max.png", content_type: "image/png")
max.save

luna_file = URI.open("https://images.pexels.com/photos/4588435/pexels-photo-4588435.jpeg")
luna = Pet.new(name: "Luna", availability: false, breed: "golden retriever", description: "yound and super athletic")
luna.user = chris
luna.photo.attach(io: luna_file, filename: "luna.png", content_type: "image/png")
luna.save

cooper_file = URI.open("https://images.pexels.com/photos/4588435/pexels-photo-4588435.jpeg")
cooper = Pet.new(name: "Cooper", availability: true, breed: "bulldog", description: "very social ! Cooper loves others dogs")
cooper.user = safia
cooper.photo.attach(io: cooper_file, filename: "cooper.png", content_type: "image/png")
cooper.save

daisy_file = URI.open("https://images.pexels.com/photos/4588435/pexels-photo-4588435.jpeg")
daisy = Pet.new(name: "Daisy", availability: false, breed: "german sheperd", description: "Daisy is super kind, she loves walking under rain")
daisy.user = nurra
daisy.photo.attach(io: daisy_file, filename: "daisy.png", content_type: "image/png")
daisy.save

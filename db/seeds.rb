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

juliette = User.create!(email: "walkyourdog.user@gmail.com", password: "secret")
tom = User.create!(email: "what.a.email.@gmail.com", password: "secret")
chris = User.create!(email: "guywholovesdogs@gmail.com", password: "secret")
safia = User.create!(email: "example@gmail.com", password: "secret")
nurra = User.create!(email: "example.example@gmail.com", password: "secret")

bella = Pet.new(name: "Bella", availability: true, breed: "poodle", description: "cuddling and love chicken")
bella.user = juliette
bella.save

max = Pet.new(name: "Max", availability: true, breed: "labrador", description: "super loyal, don't like to run")
max.user = tom
max.save

luna = Pet.new(name: "Luna", availability: false, breed: "golden retriever", description: "yound and super athletic")
luna.user = chris
luna.save

cooper = Pet.new(name: "Cooper", availability: true, breed: "bulldog", description: "very social ! Cooper loves others dogs")
cooper.user = safia
cooper.save

daisy = Pet.new(name: "Daisy", availability: false, breed: "german sheperd", description: "Daisy is super kind, she loves walking under rain")
daisy.user = nurra
daisy.save

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

puts "Deleting seed"
Bookmark.destroy_all
Movie.destroy_all
List.destroy_all
User.destroy_all

puts "Creating movies"
url = 'https://api.themoviedb.org/3/movie/top_rated?api_key=4aa434daa023809deee08630db596914&language=en-US&page=1'
results_serialized = URI.open(url).read
results = JSON.parse(results_serialized)
movies = results["results"]
movies.each do |movie|
  Movie.create(title: movie["original_title"], overview: movie["overview"], poster_url: "https://image.tmdb.org/t/p/w500#{movie["poster_path"]}", rating: movie["vote_average"])
end

url = 'https://api.themoviedb.org/3/movie/top_rated?api_key=4aa434daa023809deee08630db596914&language=en-US&page=2'
results_serialized = URI.open(url).read
results = JSON.parse(results_serialized)
movies = results["results"]
movies.each do |movie|
  Movie.create(title: movie["original_title"], overview: movie["overview"], poster_url: "https://image.tmdb.org/t/p/w500#{movie["poster_path"]}", rating: movie["vote_average"])
end

url = 'https://api.themoviedb.org/3/movie/top_rated?api_key=4aa434daa023809deee08630db596914&language=en-US&page=3'
results_serialized = URI.open(url).read
results = JSON.parse(results_serialized)
movies = results["results"]
movies.each do |movie|
  Movie.create(title: movie["original_title"], overview: movie["overview"], poster_url: "https://image.tmdb.org/t/p/w500#{movie["poster_path"]}", rating: movie["vote_average"])
end

url = 'https://api.themoviedb.org/3/movie/top_rated?api_key=4aa434daa023809deee08630db596914&language=en-US&page=4'
results_serialized = URI.open(url).read
results = JSON.parse(results_serialized)
movies = results["results"]
movies.each do |movie|
  Movie.create(title: movie["original_title"], overview: movie["overview"], poster_url: "https://image.tmdb.org/t/p/w500#{movie["poster_path"]}", rating: movie["vote_average"])
end

url = 'https://api.themoviedb.org/3/movie/top_rated?api_key=4aa434daa023809deee08630db596914&language=en-US&page=5'
results_serialized = URI.open(url).read
results = JSON.parse(results_serialized)
movies = results["results"]
movies.each do |movie|
  Movie.create(title: movie["original_title"], overview: movie["overview"], poster_url: "https://image.tmdb.org/t/p/w500#{movie["poster_path"]}", rating: movie["vote_average"])
end

puts "Creating users"
camille = User.create(email: "camille@gmail.com", username: "Camille", password: "password")
User.create(email: "pierrelouis@gmail.com", username: "Pierre-Louis", password: "password")

puts "Creating Lists"
List.create(name: "Classic movies", user_id: camille.id)
List.create(name: "Superhero", user_id: camille.id)
List.create(name: "Drama", user_id: camille.id)
List.create(name: "Nineties", user_id: camille.id)

puts "Seed created"

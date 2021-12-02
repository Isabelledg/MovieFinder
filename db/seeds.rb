# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

MovieGenre.destroy_all
Movie.destroy_all
Genre.destroy_all
genre_movies = {"Action": ["Matrix", "Zorro", "Star Wars", "Terminator"], "Horror": ["Chuckie"], "Drama": ["Zorro"], "Fantasy": ["Star Wars", "Terminator"], "Comedy": ["Zoolander"]}
genre_movies.each do |genre_name, movies|
  genre = Genre.create(name: genre_name)
  movies.each do |movie_title|
    movie = Movie.where(title: movie_title).first
    movie = Movie.create(title: movie_title) if movie.nil?
    MovieGenre.create(movie: movie, genre: genre)
  end
end

require 'yaml'
require 'json'
require_relative 'scraper'

links = fetch_top_movie_urls(3)

movies = []
links.each do |link|
  movies << scrape_movie(link)

  # puts "Title: #{info[:title]}"
  # puts "Year: #{info[:year]}"
  # puts "Plot: #{info[:storyline]}"
  # puts '-' * 80
end

File.open('movies.json', 'wb') do |file|
 file.write(JSON.generate({movies: movies}))
end

File.open('movies.yml', 'wb') do |file|
  file.write({movies: movies}.to_yaml)
 end

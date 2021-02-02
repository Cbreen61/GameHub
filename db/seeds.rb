require 'rest-client'
require 'json'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

url = "https://api.rawg.io/api/games"
resp = RestClient.get(url)
data = JSON.parse(resp.body)

data["results"].each do |game|
    Game.create(title: game["name"], release_date: game["released"], audience_rating: game["esrb_rating"]["name"], image: game["background_image"])
end
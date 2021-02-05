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

data["results"].each do |g|
    Game.create(title: g["name"], release_date: g["released"], audience_rating: g["esrb_rating"]["name"], image: g["background_image"])
end
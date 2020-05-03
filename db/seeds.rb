require 'json'
require 'open-uri'

Cocktail.destroy_all

file = URI.open('https://images.unsplash.com/photo-1556679343-c7306c1976bc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1300&q=80')
cocktail = Cocktail.new(name: "Cuba Libre")
cocktail.photo.attach(io: file, filename: 'cuba-img', content_type: 'image/jpg')
cocktail.save

file = URI.open('https://source.unsplash.com/lwoTuByIuC4')
cocktail = Cocktail.new(name: "Mint Julep")
cocktail.photo.attach(io: file, filename: 'julep-img', content_type: 'image/jpg')
cocktail.save

file = URI.open('https://source.unsplash.com/dmkmrNptMpw')
cocktail = Cocktail.new(name: "Old Fashioned")
cocktail.photo.attach(io: file, filename: 'old-img', content_type: 'image/jpg')
cocktail.save

file = URI.open('https://source.unsplash.com/T7heq8rawkc')
cocktail = Cocktail.new(name: "Mai Tai")
cocktail.photo.attach(io: file, filename: 'mai-img', content_type: 'image/jpg')
cocktail.save

file = URI.open('https://source.unsplash.com/7hHRTw_-1SY')
cocktail = Cocktail.new(name: "Lemon Sour")
cocktail.photo.attach(io: file, filename: 'sour-img', content_type: 'image/jpg')
cocktail.save

file = URI.open('https://source.unsplash.com/2ssSOO2pPK8')
cocktail = Cocktail.new(name: "Martini")
cocktail.photo.attach(io: file, filename: 'martini-img', content_type: 'image/jpg')
cocktail.save

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients_json = JSON.parse(ingredients_serialized)
ingredients = ingredients_json["drinks"]
ingredients.each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end

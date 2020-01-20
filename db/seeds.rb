require 'json'
require 'open-uri'

Cocktail.destroy_all

file = URI.open('https://images.unsplash.com/photo-1556679343-c7306c1976bc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1300&q=80')
cocktail = Cocktail.new(name: "Cuba Libre")
cocktail.photo.attach(io: file, filename: 'cuba-img', content_type: 'image/jpg')
cocktail.save

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients_json = JSON.parse(ingredients_serialized)
ingredients = ingredients_json["drinks"]
ingredients.each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end

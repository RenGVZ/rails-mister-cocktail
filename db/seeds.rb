require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients_json = JSON.parse(ingredients_serialized)
ingredients = ingredients_json["drinks"]
ingredients.each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end

# ingredients.each do |ingredient|
#   Ingredient.create(name: ingredient)
# end

# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")



Cocktail.create(name: "Gin & Tonic")
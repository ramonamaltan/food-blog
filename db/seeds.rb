require "faker"

User.destroy_all
Recipe.destroy_all
Category.destroy_all
Dose.destroy_all
Ingredient.destroy_all

puts 'deleted'

ramona = User.create(email: 'ramona@gmail.com', password: '123456')
recipe1 = Recipe.create( name: Faker::Food.dish, user: ramona)
category1 = Category.create(name: 'vegan', recipe_id: recipe1.id)
ingredient1 = Ingredient.create(name: Faker::Food.ingredient)

2.times do
  dose = Dose.create(
    unit: ['grams', 'liters', 'cups'].sample,
    amount: rand(10..100),
    recipe_id: recipe1.id,
    ingredient_id: ingredient1.id)
end

puts "Created #{Recipe.count} recipes, #{Dose.count} doses, #{Ingredient.count} ingredients, in #{Category.count} categories"
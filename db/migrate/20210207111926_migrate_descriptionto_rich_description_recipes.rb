class MigrateDescriptiontoRichDescriptionRecipes < ActiveRecord::Migration[6.0]
  def up
    Recipe.find_each do |recipe|
      recipe.update(rich_description: recipe.description)
    end
  end

  def down
    Recipe.find_each do |recipe|
      recipe.update(description: recipe.rich_description)
      recipe.update(rich_description: nil)
    end
  end
end

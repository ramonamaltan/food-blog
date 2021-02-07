class MigrateDescriptiontoRichDescriptionRecipes < ActiveRecord::Migration[6.0]
  def up
    Recipe.find_each do |recipe|
      recipe.update(rich_body: recipe.description)
    end
  end

  def down
    Recipe.find_each do |recipe|
      recipe.update(description: recipe.rich_body)
      recipe.update(rich_body: nil)
    end
  end
end

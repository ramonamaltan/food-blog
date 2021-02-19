class FavoriteRecipesController < ApplicationController
  def index
    @favorite_recipes = policy_scope(FavoriteRecipe).where(user: current_user)
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    favorite_exists = FavoriteRecipe.where(recipe: @recipe, user: current_user)
    authorize favorite_exists
    if favorite_exists.count.positive?
      favorite_exists.destroy_all
    else
      @favorite_recipe = FavoriteRecipe.new(recipe: @recipe, user: current_user)
      authorize @favorite_recipe
      if @favorite_recipe.save
        redirect_to recipe_path(@recipe)
      else
        render 'recipes/show'
      end
    end
  end
end

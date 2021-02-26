class FavoriteRecipesController < ApplicationController
  def index
    @favorite_recipes = policy_scope(FavoriteRecipe).where(user: current_user)
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    favorite_exists = FavoriteRecipe.where(recipe: @recipe, user: 1)
    authorize favorite_exists
    if favorite_exists.count.positive?
      favorite_exists.destroy_all
    else
      @favorite_recipe = FavoriteRecipe.new(recipe: @recipe, user: current_user)
      authorize @favorite_recipe
      if @favorite_recipe.save
        redirect_to back_with_anchor anchor: @recipe.id
      else
        render 'recipes/show'
      end
    end
  end

  private

  def back_with_anchor(anchor: '')
    "#{request.referrer}##{anchor}"
  end
end

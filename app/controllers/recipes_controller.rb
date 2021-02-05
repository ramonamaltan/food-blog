class RecipesController < ApplicationController
  def index
    @recipes = policy_scope(Recipe).order(created_at: :desc)
  end

  def show
    @recipe = Recipe.find(params[:id])
    authorize @recipe
  end
end

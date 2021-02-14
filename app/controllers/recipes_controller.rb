class RecipesController < ApplicationController
  def index
    @recipes = policy_scope(Recipe).order(created_at: :desc)
  end

  def show
    @recipe = Recipe.includes(:doses, :ingredients).find(params[:id])
    authorize @recipe
  end

  def new
    @recipe = Recipe.new
    authorize @recipe
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    authorize @recipe
    if @recipe.save
      redirect_to new_recipe_dose_path(@recipe)
    else
      render :new
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :photo)
  end
end

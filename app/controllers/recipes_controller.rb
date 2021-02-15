class RecipesController < ApplicationController
  def index
    @recipes = policy_scope(Recipe).where(nil)
    @recipes = Recipe.search_by_name(params[:search]) if params[:search].present?
    @recipes = Recipe.sort_by_most_recent if params[:recent].present?
    @recipes = Recipe.sort_by_alphabet if params[:alphabetical].present?
  end

  def show
    @recipe = Recipe.includes(:doses, :ingredients).find(params[:id])
    authorize @recipe
  end

  def new
    @recipe = Recipe.new
    2.times { @recipe.categories.build }
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

  def destroy
    @recipe = Recipe.find(params[:id])
    authorize @recipe
    @recipe.destroy
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :photo, categories_attributes: [:id, :name])
  end
end

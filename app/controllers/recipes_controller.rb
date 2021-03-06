class RecipesController < ApplicationController
  before_action :find_recipe, only: [:edit, :update, :destroy]
  def index
    @admin = !current_user.nil? && current_user.admin == true
    @recipes = policy_scope(Recipe).includes(:favorite_recipes, photo_attachment: :blob).where(nil)
    @recipes = Recipe.search_by_name(params[:search]) if params[:search].present?
    @recipes = Recipe.sort_by_most_recent if params[:recent].present?
    @recipes = Recipe.sort_by_alphabet if params[:alphabetical].present?

    @favorite_recipe = FavoriteRecipe.new
  end

  def show
    @admin = !current_user.nil? && current_user.admin == true
    @recipe = Recipe.includes(:doses, :ingredients).find(params[:id])
    authorize @recipe
    @favorite_recipe = FavoriteRecipe.new
    @favorite_exists = FavoriteRecipe.where(recipe: @recipe, user: current_user).count.positive?
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

  def edit
    authorize @recipe
  end

  def update
    authorize @recipe
    if @recipe.update(recipe_params)
      redirect_to new_recipe_dose_path(@recipe)
    else
      render :edit
    end
  end

  def destroy
    authorize @recipe
    @recipe.destroy
    redirect_to recipes_path
  end

  private

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :photo, categories_attributes: [:id, :name])
  end
end

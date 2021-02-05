class RecipesController < ApplicationController
  def index
    @recipes = policy_scope(Recipe).order(created_at: :desc)
  end
end

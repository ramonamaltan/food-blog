class DosesController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @dose = Dose.new
    authorize @dose
  end

  def create
    
  end
end

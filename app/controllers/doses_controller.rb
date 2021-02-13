class DosesController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @dose = Dose.new
    @dose.build_ingredient
    authorize @dose
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @dose = Dose.new(dose_params)
    authorize @dose
    @dose.create_ingredient(name: 'test')
    @dose.recipe = @recipe
    if @dose.save
      redirect_to recipes_path
    else
      render :new
    end
  end

  def dose_params
    params.require(:dose).permit(:unit, :amount, ingredient_attributes: [:id, :name])
  end
end

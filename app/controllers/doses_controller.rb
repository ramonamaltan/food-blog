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
    @dose.create_ingredient(name: params[:dose][:ingredient_attributes][:name])
    @dose.recipe = @recipe
    if @dose.save
      redirect_to new_recipe_dose_path(@recipe)
    else
      render :new
    end
  end

  def dose_params
    params.require(:dose).permit(:unit, :amount, ingredient_attributes: [:id, :name])
  end
end

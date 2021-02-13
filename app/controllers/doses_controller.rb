class DosesController < ApplicationController
  def new
    @dose = Dose.new
    authorize @dose
  end
end

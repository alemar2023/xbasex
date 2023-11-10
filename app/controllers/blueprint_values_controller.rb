class BlueprintValuesController < ApplicationController
  before_action :set_blueprint_value, only: %i[ show edit update destroy]

  def index
    @blueprint_values = BlueprintValue.all
  end

  def show
  end
  def new
    @blueprint_value = BlueprintValue.new
  end

  def edit
  end

  def create
  end
  def update
  end

  def destroy
  end

  private

  def set_blueprint_value
    @blueprint_value = BlueprintValue.find(params[:id])
  end
  def blueprint_params
    params.require(blueprint-value).permit(:name)
  end
end
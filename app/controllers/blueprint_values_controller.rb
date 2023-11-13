class BlueprintValuesController < ApplicationController
  before_action :set_blueprint
  before_action :set_blueprint_value, only: %i[ show edit update destroy]



  def show
  end

  def new
    @blueprint_value = BlueprintValue.new
  end

  def edit
  end

  def create
    @blueprint_value = BlueprintValue.new(blueprint_value_params)

    respond_to do |format|
      if @blueprint_value.save
        format.html { redirect_to blueprint_path(@blueprint), notice: "Blueprint Value successfully created" }
        format.json { render json: @blueprint_value, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blueprint_value.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    respond_to do |format|
      if @blueprint_value.update(blueprint_values_params)
        format.html { redirect_to blueprint_path(@blueprint), notice: "Blueprint Value successfully updated" }
        format.json { render json: @blueprint_value, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blueprint_value.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private

  def set_blueprint
    @blueprint = Blueprint.find(params[:blueprint_id])
  end



  def set_blueprint_value
    @blueprint_value = BlueprintValue.find(params[:id])
  end

  def blueprint_value_params
    params.require(:blueprint_value).permit(:value, :blueprint_id, :property_id)
  end
end
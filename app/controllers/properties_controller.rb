class PropertiesController < ApplicationController
  before_action :set_blueprint_value
  before_action :set_property, only: %i[ show edit update destroy]
  def index
    @properties = Property.all
  end
  def show
  end
  def new
    @property = Property.new
  end
  def edit
  end
  def create
    @property = Property.new(property_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to properties_url, notice: "Property was succesfully created."}
        format.json { render :show, status: :created, location: @property}
      else
        format.html { render :new, status: :unprocessable_entity}
        format.json { render json: @property.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to properties_url, notice: "Property was succesfully updated!"}
        format.json { render :show, status: ok, location: @property}
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @property.destroy!

    respond_to do |format|
      format.html { redirect_to properties_url, notice: "Property was succesfully destroyed"}
      format.json { head :no_content}
    end
  end

  private
  def set_blueprint_value
    @blueprint_value = BlueprintValue.find(params[:id])
  end
  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:name)
  end

end
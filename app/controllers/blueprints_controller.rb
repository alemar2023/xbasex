class BlueprintsController < ApplicationController
  before_action :set_blueprint, only: %i[ show update edit destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @blueprints = Blueprint.all.includes(:category, :brand, :expansion, :rarity, :property,    :en_translation , blueprint_values: :property   )

    #@blueprints = Blueprint.includes(blueprint_values: :property).all
  end

  def show
    @blueprint = Blueprint.find(params[:id])
    @blueprint_values = @blueprint.blueprint_values.includes(:property)
    @blueprint_translations = @blueprint.blueprint_translations
  end

  def new
    @blueprint = Blueprint.new
    @blueprint.blueprint_translations.build
    @blueprint.blueprint_values.build

  end

  def edit
  end

  def create
    @blueprint = Blueprint.new(blueprint_params)

    respond_to do |format|
      if @blueprint.save
        format.html { redirect_to blueprints_path, notice: "Blueprint successfully created" }
        format.json { render :show, status: :created, location: @blueprint }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blueprint.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    respond_to do |format|
      if @blueprint.update(blueprint_params)
        format.html { redirect_to blueprints_url, notice: "Blueprint successfully updated" }
        format.json { render json:, status: :ok, location: @blueprint }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blueprint.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @blueprint.destroy!

    respond_to do |format|
      format.html { redirect_to blueprints_url, notice: "Blueprint was successfully destroyed" }
      format.json { head :non_content }
    end
  end

  private

  def set_blueprint
    @blueprint = Blueprint.find(params[:id])
  end

  def blueprint_params
    params.require(:blueprint).permit(
      :id, :category_id, :brand_id, :expansion_id,
      blueprint_translations_attributes: [:id, :name, :locale],
     blueprint_values_attributes: [:id, :property_id, :value]
    )
  end

end
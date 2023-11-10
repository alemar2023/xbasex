class BlueprintTranslationsController < ApplicationController
   before_action :set_blueprint
   before_action :set_blueprint_translation , only: %i[show edit update destroy]

   def show

   end

  def new
    @blueprint_translation = BlueprintTranslation.new
  end
  def edit
  end

  def create

    @blueprint_translation = BlueprintTranslation.new(blueprint_translation_params)

    respond_to do |format|
      if @blueprint_translation.save
        format.html { redirect_to blueprint_path(@blueprint), notice: "Blueprint Translation successfully created" }
        format.json { render json: @blueprint_translation, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blueprint_translation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @blueprint_translation.update(blueprint_translation_params)
        format.html { redirect_to blueprint_path(@blueprint), notice: "Blueprint Translation successfully updated" }
        format.json { render json: @blueprint_translation, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blueprint_translation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private

  def set_blueprint
    @blueprint = Blueprint.find(params[:blueprint_id])
  end
  def set_blueprint_translation
    @blueprint_translation = BlueprintTranslation.find(params[:id])
  end
  def blueprint_translation_params
    params.require(:blueprint_translation).permit(:blueprint_id, :name, :locale)
  end


end
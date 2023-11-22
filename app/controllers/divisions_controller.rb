class DivisionsController < ApplicationController
  before_action :set_division, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]
  def index
    @divisions = Division.all.includes(:eng_translation, children: [:eng_translation, children: :eng_translation ], ).where(parent_id: nil)
    #@divisions = @divisions = Division.includes(:children, :voices)

    #@divisions = Division.all.includes( :children, :voices  )
    #@root_divs = Division.parent_divs
    #@divisions = Division.includes(:voices).where(parent_id:)

  end

  def new
    @division = Division.new
    @voice = @division.voices.build

  end

  def create




    @division = Division.new(division_params)

    if @division.save
      redirect_to divisions_path, notice: 'Division was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @division.update(division_params)
      redirect_to divisions_path, notice: 'Division was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @division.destroy!
    redirect_to divisions_path, notice: 'Division was successfully destroyed.'
  end

  private

  def set_division
    @division = Division.find(params[:id])
  end

  def division_params
    params.require(:division).permit(:parent_id, voices_attributes: [:id, :name, :locale])
  end
end

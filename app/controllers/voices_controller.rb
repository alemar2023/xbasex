class VoicesController < ApplicationController
  before_action :set_voice, only: [:edit, :update, :destroy]

  def index
    @voices = Voice.all
  end

  def new
    @voice = Voice.new
  end

  def create
    @voice = Voice.new(voice_params)
    if @voice.save
      redirect_to voices_path, notice: 'Voice was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @voice.update(voice_params)
      redirect_to voices_path, notice: 'Voice was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @voice.destroy
    redirect_to voices_path, notice: 'Voice was successfully destroyed.'
  end

  private

  def set_voice
    @voice = Voice.find(params[:id])
  end

  def voice_params
    params.require(:voice).permit(:name, :division_id, :locale)
  end
end

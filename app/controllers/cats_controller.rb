class CatsController < ApplicationController
  before_action :set_cat, only: [:edit, :update, :destroy]

  def index
    #@cats = Cat.where(parent_id: nil)
    @cats = Cat.all
    @root_cats = Cat.root_cats
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cats_path, notice: 'Cat was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @cat.update(cat_params)
      redirect_to cats_path, notice: 'Cat was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @cat.destroy
    redirect_to cats_path, notice: 'Cat was successfully destroyed.'
  end

  private

  def set_cat
    @cat = Cat.find(params[:id])
  end

  def cat_params
    params.require(:cat).permit(:name, :parent_id)
  end
end

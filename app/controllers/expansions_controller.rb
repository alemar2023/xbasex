class ExpansionsController < ApplicationController

  def index
    @expansions= Expansion.all
  end

  def show
  end
  def new
    @expansion = Expansion.new
    @brand = Brand.all

  end
  def edit
    @brand = Brand.all

  end

  def create
    @expansion = Expansion.new(expansion_params)
    respond_to do |format|
      if @expansion.save
        format.html { redirect_to expansions_url, notice: "Expansion was succesfully created"}
        format.json { render :show , status: :created, location: @expansion}
      else
        format.html { render :new, status: :unprocessable_entity}
        format.json { render json: @expansion.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @expansion.update(expansion_params)
        format.html {redirect_to expansions_url, notice: "Expansion was succesfully updated "}
        format.json { render :show, status: ok, location: @expansion}
      else
        format.hrml { render :edit, status: :unprocessable_entity}
        format.json { render json: @expansion.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @expansion.destroy!

    respond_to do |format|
      format.html { redirect_to expansions_url, notice: "Expansion was succesfully destroyed"}
      format.json { head :no_content}
    end
  end

  private

  def set_expansion
    @expansion = Expansion.find(params[:id])
  end

  def expansion_params
    params.require(:expansion).permit(:name, :brand_id)
  end

end
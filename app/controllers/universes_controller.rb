class UniversesController < ApplicationController

  def index
    @universes = Universe.all
  end

  def new
    @universe = Universe.new
  end

  def create
    @universe = Universe.new(universe_params)

    if @universe.save
      redirect_to universe_path(@universe), notice: "Universe was successfully created, hope you know what you're doing"
    else
      flash.now[:error] = "You screwed something up so Universe was not created"
      render :new
    end
  end

  def edit
    @universe = Universe.find(params[:id])
  end

  def show
    @universe = Universe.find(params[:id])
  end

  def update
    @universe = Universe.find(params[:id])

    if @universe.update(universe_params)
      redirect_to universe_path(@universe), notice: "Universe was successfully updated"
    else
      flash.now[:error] = "You screwed something up so Universe was not updated"
      render :edit
    end
  end

  def destroy
    @universe = Universe.find(params[:id])

    @universe.destroy
    redirect_to universes_path
  end

  private
  def universe_params
    params.require(:universe).permit(:name)
  end

end

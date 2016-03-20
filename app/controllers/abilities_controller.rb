class AbilitiesController < ApplicationController

  def index
    @abilities = Ability.all
  end

  def new
    @ability = Ability.new
  end

  def create
    @ability = Ability.new(ability_params)

    if @ability.save
      redirect_to ability_path(@ability), notice: "Ability successfully created, what creativity!"
    else
      flash.now[:error] = "You screwed something up, try again"
      render :new
    end
  end

  def show
    @ability = Ability.find(params[:id])
  end

  def update
    @ability = Ability.find(params[:id])

    if @ability.update(ability_params)
      redirect_to ability_path(@ability), notice: "Ability successfully updated"
    else
      flash.now[:error] = "You screwed something up, try again"
      render :edit
    end
  end

  def edit
    @ability = Ability.find(params[:id])
  end

  def destroy
    @ability = Ability.find(params[:id])

    @ability.destroy
    redirect_to abilities_path
  end

  private
  def ability_params
    params.require(:ability).permit(:name)
  end
end

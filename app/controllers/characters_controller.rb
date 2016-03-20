class CharactersController < ApplicationController



  def index
    @characters = Character.all
  end

  def new
    @character = Character.new #initialize an empty object and pass it to view     
  end

  def create
    @character = Character.new(character_params) #changing the above create action to a new action so we can perform validations rather than create it right away

    if @character.save #note: everything that isn't nil or false is true
      flash[:notice] = "Character was successfully created" #now need to put a placeholder in our view to show this flash message
      redirect_to character_path(@character) #so if this is true, return the user back to the main page
    else
      flash.now[:error] = "An error occurred while saving this dude" #added .now so that the error will only be availble on this request, and will not be avialable on the next, i.e. when user goes back to the index page
      render :new #this is saying: if there's an error with my character, don't rerun the code associated with my view, just display the view associated with new and that's it
    end
    #it is not recommended to have views for actions that alter data, i.e. create, update, delete, because they aren't responsible for viewing data
  end

  def edit
    @character = Character.find(params[:id])
  end

  def show
    @character = Character.find(params[:id])
  end

  def update
    @character = Character.find(params[:id])

    if @character.update(character_params)
      redirect_to character_path(@character), notice: "Character was successfully updated" #one line approach for adding flash message. Either works
    else
      flash.now[:error] = "An error occurred trying to update this character"
      render :edit
    end
  end

  def destroy
    @character = Character.find(params[:id])

    @character.destroy
    redirect_to characters_path
  end


  private #means that any methods deﬁned after this line have restricted access and can only be used from within this controller

  def character_params     # using strong params to only permit the attributes (fields) that we explicitly allow     
    params.require(:character).permit(:hero_name, :first_name, :last_name, :universe_id, :bio, :ability_ids =>[])   
  end

end
class CowsController < ApplicationController

  def index
    @cows = Cow.all
  end

  def new
    @cow = Cow.new
  end

  def create
    @cow = Cow.new(cow_params)
    @cow.user_id = current_user.id
    if @cow.save
      #redirect_to list_path(@list)
      redirect_to cows_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @cow = Cow.find(params[:id])
  end

  def edit
    @cow = Cow.find(params[:id])
  end

  def update
    @cow = Cow.find(params[:id])
    if @cow.update(cow_params)
      redirect_to cow_path(@cow)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private



  def cow_params
    params.require(:cow).permit(:name, :description, :price_per_day, :photo)
  end
end

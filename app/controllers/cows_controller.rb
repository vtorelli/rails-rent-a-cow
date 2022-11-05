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
      redirect_to mycows_cows_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @cow = Cow.find(params[:id])
  end

  def edit
    @cow = Cow.find(params[:id])
    cows_authorization(@cow)
  end

  def update
    @cow = Cow.find(params[:id])
    cows_authorization(@cow)

    if @cow.update(cow_params)
      redirect_to mycows_cows_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @cow = Cow.find(params[:id])
    cows_authorization(@cow)

    @cow.destroy
    redirect_to mycows_cows_path, status: :see_other
  end

  def mycows
    @cows = Cow.where(user_id: current_user.id)
  end

  private

  def cows_authorization(cow)
    if cow.user_id != current_user.id
      redirect_to root_path
    end
  end

  def cow_params
    params.require(:cow).permit(:name, :description, :price_per_day, :photo)
  end
end

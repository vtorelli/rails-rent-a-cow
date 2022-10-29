class CowsController < ApplicationController
  def new
    @cow = Cow.new
  end

  def create
    @cow = Cow.new(cow_params)
    if @cow.save
      #redirect_to list_path(@list)
      redirect_to new_cow_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def cow_params
    params.require(:cow).permit(:name, :description, :price_per_day, :image_url)
  end
end

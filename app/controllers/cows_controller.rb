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
    tags_attributes=(cow_params["tag_attributes"])

    if @cow.save
      # redirect_to list_path(@list)
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
    cows_authorization(@cow)
  end

  def update
    @cow = Cow.find(params[:id])
    cows_authorization(@cow)

    if @cow.update(cow_params)
      redirect_to cow_path(@cow)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @cow = Cow.find(params[:id])
    cows_authorization(@cow)

    @cow.destroy
    redirect_to root_path, status: :see_other
  end

  def mycows
    @cows = Cow.where(user_id: current_user.id)
  end

  private

  def cows_authorization(cow)
    redirect_to root_path if cow.user_id != current_user.id
  end

  def cow_params
    params.require(:cow).permit(:name,
                                :description,
                                :price_per_day,
                                :photo,
                                tags_attributes: [:name])
  end

  def tags_attributes=(tag_attributes)
    tag_attributes.each_value do |tag_attribute|
      tag1 = Tag.find_or_create_by!(tag_attribute)
      CowTag.find_or_create_by!(cow: self, tag: tag1)
    end
  end
end

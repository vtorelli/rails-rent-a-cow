class CowsController < ApplicationController
  def index

    @cows = Cow.all
    # The `geocoded` scope filters only cows with coordinates
    @markers = @cows.geocoded.map do |cow|
      {
        lat: cow.latitude,
        lng: cow.longitude,
        info_window: render_to_string(partial: "shared/info_window", locals: {cow: cow})
      }
    end

  end

  def new
    @cow = Cow.new
    @cow.tags.build
  end

  def create
    @cow = Cow.new(cow_params)
    @cow.user_id = current_user.id
    # tags_attributes=(cow_params["tag_attributes"])

    if @cow.save
      redirect_to mycows_cows_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @cow = Cow.find(params[:id])
    @tag = Tag.new
    # authorize @cow

    @markers =
      [{
        lat: @cow.latitude,
        lng: @cow.longitude,
        info_window: render_to_string(partial: "shared/info_window", locals: {cow: @cow})
      }]

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
    redirect_to root_path if cow.user_id != current_user.id
  end

  def cow_params
    params.require(:cow).permit(:name,
                                :description,
                                :location,
                                :price_per_day,
                                :photo,
                                tags_attributes: [:name])
  end
end

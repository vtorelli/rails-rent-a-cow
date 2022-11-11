class TagsController < ApplicationController

  def create
    @cow = Cow.find(params[:cow_id])
    @tag = Tag.find_or_create_by(name: tag_params[:name])
    # @cow_tag = CowTag.create(tag: @tag, cow: @cow)
    unless @tag.cows.include?(@cow)
      @tag.cows << @cow
    end

    if @tag.save
      redirect_to cow_path(@cow)
    else
      render "cows/show"
      # redirect_to cow_path(@cow)
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name, cow_attributes: [:name])
  end
end

class TagsController < ApplicationController

  def create
    @cow = Cow.find(params[:cow_id])
    @tag = Tag.new(tag_params)
    @tag.cow = @cow
  end

  private

  def tag_params
    params.require(:tag).permit(:name, cow_attributes: [:name])
  end
end

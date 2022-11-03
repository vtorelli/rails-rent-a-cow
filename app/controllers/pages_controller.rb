class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @cows = Cow.all
  end
end

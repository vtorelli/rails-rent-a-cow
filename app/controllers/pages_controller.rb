class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if params[:query].present?
      sql_query = <<~SQL
        cows.name @@ :query
        OR cows.description @@ :query
        OR cows.location @@ :query
        OR tags.name @@ :query
      SQL
      @cows = Cow.left_outer_joins(:tags).where(sql_query, query: "%#{params[:query]}%")
      @cows = @cows.uniq
    else
      @cows = Cow.all
    end
  end
end

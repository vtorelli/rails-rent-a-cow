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
      @cows = Cow.left_outer_joins(:tags).where(sql_query, query: "%#{params[:query]}%").distinct
    else
      @cows = Cow.all
    end

    @markers = @cows.geocoded.map do |cow|
      {
        lat: cow.latitude,
        lng: cow.longitude,
        info_window: render_to_string(partial: "shared/info_window", locals: {cow: cow})
      }
    end

  end
end

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :menu]

  def home
    @locations = Location.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
      marker.lat location.latitude
      marker.lng location.longitude
      marker.infowindow render_to_string(partial: "/shared/map_box", locals: { location: location })
    end
  end

  def landing
  end

  def menu
    if params[:category].present?
      @items = Item.where(category: params[:category])
    else
      @items = Item.all
    end
  end

  def dashboard
    redirect_to root_path unless current_user.manager?
  end
end

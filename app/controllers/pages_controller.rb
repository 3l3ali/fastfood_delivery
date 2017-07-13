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

    @items_list = {}
    session[:items_ids].each do |item_id|
      item = Item.find(item_id)
      @items_list[item.name] ||= {
        id: item_id.to_i,
        count: 0,
        price: item.price
      }
      @items_list[item.name][:count] += 1
    end if session[:items_ids].present?


    # self.bill = self.items.map(&:price).inject(&:+)
    @bill = @items_list.values.map{|item| item[:price] * item[:count] }.inject(:+)

  end
end

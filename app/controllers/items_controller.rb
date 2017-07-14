class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    if params[:category].present?
      @items = Item.where(category: params[:category])
    else
      @items = Item.all
    end
  end

  def show
  end

  def new
    if current_user.manager?
      @item = Item.new
    else
      redirect_to root_path
    end
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def edit
    redirect_to root_path unless current_user.manager?
  end

  def update
    @item.update(item_params)
    redirect_to root_path
  end

  def destroy
    @item.destroy
    redirect_to edit_menu_pages_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :price, :description, :category, :photo, :photo_cache)
  end

end

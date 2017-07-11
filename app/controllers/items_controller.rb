class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :destroy]

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
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @item = Item.update(item_params)
    redirect_to root_path
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :price, :description, :category)
  end

end
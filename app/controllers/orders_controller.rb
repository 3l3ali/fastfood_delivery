class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:index]

  def index
    if @user == current_user
      @orders = current_user.orders
    else
      redirect_to current_user
    end
  end

  def add_cart
    session[:items_ids] ||= []
    session[:items_ids] << params[:item_id]
    redirect_to menu_pages_path(category: params[:category])
  end

  def remove_cart
    if session[:items_ids].include?(params[:item_id])
      session[:items_ids].delete_at(session[:items_ids].index(params[:item_id]))
      redirect_to menu_pages_path(category: params[:category])
    end
  end

  def clear_cart
    session[:items_ids] = nil
    redirect_to menu_pages_path(category: params[:category])
  end

  def show
  end

  def new
    @order = Order.new
  end

  def create
    @order = current_user.orders.new(order_params)

    session[:items_ids].each { |item| @order.items << Item.find(item) }

    if @order.save
      session[:items_ids] = nil
      redirect_to user_orders_path(current_user)
    else
      render :new
    end
  end

  def edit
    @order = current_user.orders.find(params[:id])
  end

  def update
    @order.update(order_params)
    redirect_to root_path
  end

  def destroy
    @order.destroy
    redirect_to root_path
  end

  private

  def set_order
    @order = current_user.orders.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def order_params
    params.require(:order).permit(:notes, :status, :bill, :address_id)
  end
end

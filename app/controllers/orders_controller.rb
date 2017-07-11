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

  def show
  end

  def new
    @order = Order.new
  end

  def create
    @order = current_user.orders.new(order_params)

    if @order.save
      redirect_to root_path
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
    params.require(:order).permit(:notes, :status, :bill)
  end
end

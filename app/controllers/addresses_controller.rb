class AddressesController < ApplicationController
  before_action :set_user, only: [:index, :new]
  before_action :set_address, only: [:edit, :update, :destroy]

  def index         # GET /address
    if @user == current_user
      @addresses = current_user.addresses
    else
      redirect_to current_user
    end
  end

  def new           # GET /address/new
    @address = Address.new
  end

  def create        # POST /address
    @address = current_user.addresses.new(address_params)
    if @address.save
      redirect_to new_user_order_path(current_user)
    else
      render 'new'
    end
  end

  def edit          # GET /address/:id/edit
  end

  def update        # PATCH /address/:id
    @address.update(address_params)
    redirect_to user_addresses_path(current_user)
  end

  def destroy       # DELETE /address/:id
    @address.destroy
    redirect_to user_addresses_path(current_user)
  end

  private

  def address_params
    params.require(:address).permit(:street, :apartment, :city, :building, :state, :zipcode)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_address
    @address = current_user.addresses.find(params[:id])
  end
end

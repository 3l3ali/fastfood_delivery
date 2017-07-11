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

  # def show          # GET /address/:id
  #   @address = @user.addresses.find(params[:id])
  # end

  def new           # GET /address/new
    @address = Address.new
  end

  def create        # POST /address
    @address = current_user.addresses.new(address_params)
    # @address.user = set_user
    if @address.save
      redirect_to current_user
    else
      render 'new'
    end
  end

  def edit          # GET /address/:id/edit
    # @address = current_user.addresses.find(params[:id])
  end

  def update        # PATCH /address/:id
    # @address = current_user.addresses.find(params[:id])
    @address.update(address_params)
    redirect_to user_addresses_path
  end

  def destroy       # DELETE /address/:id
    # @address = current_user.addresses.find(params[:id])
    @address.destroy
    redirect_to user_addresses_path
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

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :nullify

  validates :first_name, presence: true
  validates :last_name, presence: true
  #validates :phone_number, presence: true
  #validates_format_of :phone_number, :with => /\A\d{10}\Z/i

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable #, :confirmable
  devise :omniauthable, omniauth_providers: [:facebook]

  enum role: {
    manager: 0,
    employee: 1,
    delivery_guy: 2,
    customer: 3
  }

  def self.roles_for_select
    roles.to_a.unshift(["all", ""])
  end

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

end

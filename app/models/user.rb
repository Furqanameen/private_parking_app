class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, format: URI::MailTo::EMAIL_REGEXP


  enum role: %i[admin customer]

  before_create :set_the_user_role

  has_many :reservations
  has_many :slots, through: :reservations

  private

  def set_the_user_role
    self.role = 1 if role.blank?
  end
end

class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true

  has_many :listings

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :send_welcome_message

  def send_welcome_message
    UserMailer.signup_confirmation(self).deliver
  end
end

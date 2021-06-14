class User < ApplicationRecord
  belongs_to :company, optional: true 
  has_one :administrated_company, foreign_key: "administrator_id", class_name: "Company"
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  after_create :welcome_send, :admin_user_notification

  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "enter a valid email address" }
  validates :password, presence: true


  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def admin_user_notification
    AdminMailer.new_user_registration.deliver_now
  end

end

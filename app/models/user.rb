class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  after_create :welcome_send

  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "enter a valid email address" }
  validates :password, :first_name, :last_name, :mobile_phone, :company_name, :company_proof, :company_type,  presence: true


  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end

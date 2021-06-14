class Company < ApplicationRecord
  has_many :users
  belongs_to :administrator, class_name: "User"

  after_create :admin_company_notification

  def find_colleagues
    colleagues = []
    User.all.each do |user|
      if user.company_id == self.id
      colleagues << user
      else
      end
    end
    return colleagues
  end

  def self.get_administrator_ids
    administrator_ids = []
    Company.all.each do |company|
      administrator_ids << company.administrator_id
    end
    return administrator_ids
  end

  def admin_company_notification
    AdminMailer.new_company_registration(self).deliver_now
  end
end

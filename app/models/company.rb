class Company < ApplicationRecord
  has_many :users
  belongs_to :administrator, class_name: "User"

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
end

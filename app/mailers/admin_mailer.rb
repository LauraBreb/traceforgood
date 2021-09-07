class AdminMailer < ApplicationMailer
  default from: "laura.breban@traceforgood.com"

  def new_user_registration(user)
    @user = user
    @url_admin = 'http://traceforgood.herokuapp.com/admin' 
    mail(to: 'laura.breban@traceforgood.com', subject: 'New user registration!')
  end

  def new_company_registration(company)
    @company = company
    @url_admin = 'http://traceforgood.herokuapp.com/admin/companies' 
    mail(to: 'laura.breban@traceforgood.com', subject: 'New company registration!')
  end
end

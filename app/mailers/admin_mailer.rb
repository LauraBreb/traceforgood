class AdminMailer < ApplicationMailer
  default from: "laura.traceforgood@gmail.com"

  def new_user_registration(user)
    @user = user
    @url_admin = 'http://traceforgood.herokuapp.com/admin' 
    mail(to: 'laura.traceforgood@gmail.com', subject: 'New user registration!')
  end

  def new_company_registration(company)
    @company = company
    @url_admin = 'http://traceforgood.herokuapp.com/admin/companies' 
    mail(to: 'laura.traceforgood@gmail.com', subject: 'New company registration!')
  end
end

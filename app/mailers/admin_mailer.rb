class AdminMailer < ApplicationMailer
  default from: "laurabreb123@yopmail.com"

  def new_user_registration
    @user = current_user
    @url_admin = 'http://traceforgood.herokuapp.com/admin' 
    mail(to: 'laurabreb123@yopmail.com', subject: 'New user registration!')
  end

  def new_company_registration(company)
    @user = current_user
    @company = company
    @url_admin = 'http://traceforgood.herokuapp.com/admin/companies' 
    mail(to: 'laurabreb123@yopmail.com', subject: 'New company registration!')
  end
end

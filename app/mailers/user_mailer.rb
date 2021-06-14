class UserMailer < ApplicationMailer
  default from: "laurabreb123@yopmail.com"
 
  def welcome_email(user)
    @user = user 
    @url_companies  = 'http://traceforgood.herokuapp.com/companies' 
    mail(to: @user.email, subject: 'Welcome on Trace For Good') 
  end

  def new_registration_email(admin , user, company)
    @admin = admin
    @company = company
    @user = user
    mail(to: @admin.email, subject: "#{@user.first_name} #{@user.last_name} has joined #{@company.name} on the TraceForGood platform")
  end

  def update_profile_email(user)
    @user = user
    @url_product = 'http://traceforgood.herokuapp.com//static_pages/index'
    @url_about = 'http://traceforgood.herokuapp.com//static_pages/index'
    mail(to: @user.email, subject: "#{@user.first_name}, find out more about Trace For Good") 
  end
end

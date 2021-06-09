class UserMailer < ApplicationMailer
  default from: "laurabreb123@yopmail.com"
 
  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://traceforgood.herokuapp.com/users/sign_in' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: '') 
  end

  def new_registration_email(admin , user, company)
    @admin = admin
    @company = company
    @user = user

    mail(to: @admin.email, subject: "#{@user.first_name} #{@user.last_name} has joined #{@company.name} on the TraceForGood platform")

  end
end

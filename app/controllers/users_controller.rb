class UsersController < ApplicationController
  def edit
    @company = Company.find(params[:company_id])
  end

  def update
    if current_user.id == params[:id].to_i # update par l'utilisteur de son propre profil
      post_params=params[:user]
      @company = Company.find(params[:company_id])
      if current_user.update_attribute(:first_name, post_params[:first_name]) && current_user.update_attribute(:last_name, post_params[:last_name]) && current_user.update_attribute(:mobile_phone, post_params[:mobile_phone]) && current_user.update_attribute(:company_job_title,post_params[:company_job_title]) && current_user.update_attribute(:company_id, @company.id)
        flash.now[:success]
        #render "devise/shared/links"
        redirect_to '/'
        if current_user.id != @company.administrator_id
          @admin = User.find(@company.administrator_id)
          UserMailer.new_registration_email(@admin, current_user, @company).deliver_now
        end
      else 
        render :edit
      end
    else # update par l'administrateur de l'entreprise du profil de l'utilisateur
      @user = User.find(params[:id])
      @user.update_attribute(:company_validation, "validated")
    end
  end
end

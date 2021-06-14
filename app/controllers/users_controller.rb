class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def edit
    @company = Company.find(params[:company_id])
  end

  def update
    post_params=params[:user]
    @company = Company.find(params[:company_id])
    if current_user.update_attribute(:first_name, post_params[:first_name]) && current_user.update_attribute(:last_name, post_params[:last_name]) && current_user.update_attribute(:mobile_phone, post_params[:mobile_phone]) && current_user.update_attribute(:company_job_title,post_params[:company_job_title]) && current_user.update_attribute(:company_id, @company.id)
      flash.now[:success]
      url = "/users/#{current_user.id}"
      redirect_to url
      UserMailer.update_profile_email(current_user).deliver_now
      if current_user.id != @company.administrator_id
        @admin = User.find(@company.administrator_id)
        UserMailer.new_registration_email(@admin, current_user, @company).deliver_now
      end
    else 
      render :edit
    end
  end

  def show
    company_id = current_user.company_id
    @company = Company.find(company_id)
  end
end

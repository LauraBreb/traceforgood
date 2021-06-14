class StaticPagesController < ApplicationController
  before_action :authenticate_user!, :user_registration_completed?, except: [:landing_page, :about, :team, :contact]
  
  def landing_page
  end

  def about
  end

  def team
  end

  def contact
  end

  def index
  end

  def phase0
  end

  def phase1
  end

  def phase2
  end

  def phase3
  end

  def phase4
  end

  private

  def user_registration_completed?
    if current_user.company_id != nil
      return true
    else
      redirect_to "/companies", flash: {notice: "You first need to complete your registration before accessing Trace For Good solution pages !"}
    end
  end
end

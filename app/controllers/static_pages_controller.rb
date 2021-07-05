class StaticPagesController < ApplicationController
  before_action :authenticate_user!, :user_registration_completed?, except: [:landing_page, :index, :about, :team, :contact]
  
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

  def phase1
  end

  def phase2
  end

  def phase3
  end

  def phase4
  end

  def dashboard_phase1
  end

  def dashboard_phase2
  end

  def dashboard_phase3
  end

  def traceability_card_product
  end

  def traceability_card_brand
  end

  def materials
  end

  def accessories
  end

  def internalized_operations
  end

  def externalized_operations
  end

  def packaging_logistic
    
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

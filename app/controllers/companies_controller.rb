class CompaniesController < ApplicationController
  before_action :set_company, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:index, :new]
  before_action :user_can_create_company!, only: [:new, :create]

  def index
    @companies = Company.all
  end

  def show
    @colleagues = @company.find_colleagues
  end

  def new
    @company = Company.new
  end

  def edit
  end

  def create
    @company = Company.new(company_params)
    @company.administrator_id = current_user.id

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: "Company was successfully created." }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: "Company was successfully updated." }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: "Company was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:name, :proof, :category, :product_positioning, :customer_positioning, :market_positioning, :csr_maturity)
    end

    def user_can_create_company!
      administrator_ids = Company.get_administrator_ids
      if administrator_ids.include?(current_user.id) || current_user.company_id != nil
        url = "/users/#{current_user.id}"
        redirect_to url , flash: {notice: "You are already registered within a company!"}
      else
        return true
      end
    end
end

require 'test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company = companies(:one)
  end

  test "should get index" do
    get companies_url
    assert_response :success
  end

  test "should get new" do
    get new_company_url
    assert_response :success
  end

  test "should create company" do
    assert_difference('Company.count') do
      post companies_url, params: { company: { csr_maturity: @company.csr_maturity, customer_spositioning: @company.customer_spositioning, market_positioning: @company.market_positioning, name: @company.name, product_positioning: @company.product_positioning, proof: @company.proof, type: @company.type } }
    end

    assert_redirected_to company_url(Company.last)
  end

  test "should show company" do
    get company_url(@company)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_url(@company)
    assert_response :success
  end

  test "should update company" do
    patch company_url(@company), params: { company: { csr_maturity: @company.csr_maturity, customer_spositioning: @company.customer_spositioning, market_positioning: @company.market_positioning, name: @company.name, product_positioning: @company.product_positioning, proof: @company.proof, type: @company.type } }
    assert_redirected_to company_url(@company)
  end

  test "should destroy company" do
    assert_difference('Company.count', -1) do
      delete company_url(@company)
    end

    assert_redirected_to companies_url
  end
end

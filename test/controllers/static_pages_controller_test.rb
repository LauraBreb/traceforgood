require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get static_pages_index_url
    assert_response :success
  end

  test "should get phase0" do
    get static_pages_phase0_url
    assert_response :success
  end

  test "should get phase1" do
    get static_pages_phase1_url
    assert_response :success
  end

  test "should get phase2" do
    get static_pages_phase2_url
    assert_response :success
  end

  test "should get phase3" do
    get static_pages_phase3_url
    assert_response :success
  end

  test "should get phase4" do
    get static_pages_phase4_url
    assert_response :success
  end

end

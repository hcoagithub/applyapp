require "test_helper"

class VacantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vacant = vacants(:one)
  end

  test "should get index" do
    get vacants_url
    assert_response :success
  end

  # test "should get new" do
  #   get new_vacant_url
  #   assert_response :success
  # end

  # test "should create vacant" do
  #   assert_difference("Vacant.count") do
  #     post vacants_url, params: { vacant: { description: @vacant.description, salary: @vacant.salary, title: @vacant.title, user_id: @vacant.user_id } }
  #   end

  #   assert_redirected_to vacant_url(Vacant.last)
  # end

  # test "should show vacant" do
  #   get vacant_url(@vacant)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_vacant_url(@vacant)
  #   assert_response :success
  # end

  # test "should update vacant" do
  #   patch vacant_url(@vacant), params: { vacant: { description: @vacant.description, salary: @vacant.salary, title: @vacant.title, user_id: @vacant.user_id } }
  #   assert_redirected_to vacant_url(@vacant)
  # end

  # test "should destroy vacant" do
  #   assert_difference("Vacant.count", -1) do
  #     delete vacant_url(@vacant)
  #   end

  #   assert_redirected_to vacants_url
  # end
end

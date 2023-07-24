require "application_system_test_case"

class VacantsTest < ApplicationSystemTestCase
  setup do
    @vacant = vacants(:one)
  end

  test "visiting the index" do
    visit vacants_url
    assert_selector "h1", text: "Vacants"
  end

  test "should create vacant" do
    visit vacants_url
    click_on "New vacant"

    fill_in "Description", with: @vacant.description
    fill_in "Salary", with: @vacant.salary
    fill_in "Title", with: @vacant.title
    fill_in "User", with: @vacant.user_id
    click_on "Create Vacant"

    assert_text "Vacant was successfully created"
    click_on "Back"
  end

  test "should update Vacant" do
    visit vacant_url(@vacant)
    click_on "Edit this vacant", match: :first

    fill_in "Description", with: @vacant.description
    fill_in "Salary", with: @vacant.salary
    fill_in "Title", with: @vacant.title
    fill_in "User", with: @vacant.user_id
    click_on "Update Vacant"

    assert_text "Vacant was successfully updated"
    click_on "Back"
  end

  test "should destroy Vacant" do
    visit vacant_url(@vacant)
    click_on "Destroy this vacant", match: :first

    assert_text "Vacant was successfully destroyed"
  end
end

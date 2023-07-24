require "test_helper"

class PostulationssControllerTest < ActionDispatch::IntegrationTest
    setup do
        @postulation = postulation(:one)
    end

    test "post postulations" do
        post postulations_url
        
        assert_response :success
    end
end
require "test_helper"

class DecrypterControllerTest < ActionDispatch::IntegrationTest
  test "should get decrypt" do
    get decrypter_decrypt_url
    assert_response :success
  end

  test "should get upload" do
    get decrypter_upload_url
    assert_response :success
  end
end

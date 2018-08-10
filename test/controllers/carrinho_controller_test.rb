require 'test_helper'

class CarrinhoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get carrinho_index_url
    assert_response :success
  end

end

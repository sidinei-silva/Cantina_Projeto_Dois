require 'test_helper'

class CatalogoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get catalogo_index_url
    assert_response :success
  end

  test "should get detalhe" do
    get catalogo_detalhe_url
    assert_response :success
  end

end

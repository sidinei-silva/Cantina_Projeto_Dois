class CarrinhoController < ApplicationController
  before_action :authenticate_cliente!
  def index
    if params[:item] != nil
      @item = Hash.new
      @item[:produto_id] = params[:item][:produto_id]
      @item[:adicionals_id] = params[:item][:adicionals_id]
      carrinho << @item
    end
  end
  private
  def carrinho
    session[:carrinho] ||= []
  end
end

class CarrinhoController < ApplicationController
  before_action :authenticate_cliente!

  def index
    if params[:item] != nil
      @item = Hash.new
      @item[:produto_id] = params[:item][:produto_id]
      @item[:acompanhamento_id] = params[:item][:acompanhamento_id]
      carrinho_insert << @item
    end

    #@acompanhamento = Acompanhamento.find(session[:carrinho][0]["acompanhamento_id"])
  end

  private

  def carrinho_insert
    session[:carrinho] ||= []
  end



end

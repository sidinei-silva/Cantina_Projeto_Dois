class CarrinhoController < ApplicationController
  before_action :authenticate_cliente!

  def index
    if params[:item] != nil
      items = Hash.new
      items[:produto_id] = params[:item][:produto_id]
      items[:acompanhamento_id] = params[:item][:acompanhamento_id]
      carrinho_insert << items
    end
    get_produtos_session
    get_acomoanhamentos_session
  end

  def get_produtos_session
    @produtos = Array.new
    session[:carrinho].each do |carrinho|
      begin
        @produtos.push(Produto.find(carrinho[:produto_id]))
      rescue ActiveRecord::RecordNotFound
        @produtos.push(Produto.find(carrinho["produto_id"]))
      end
    end
  end

  def get_acomoanhamentos_session
    @acompanhamentos_all = Array.new
    session[:carrinho].each do |carrinho|
      @acompanhamentos_all.push carrinho["acompanhamento_id"] # :nome (first request) "nome" (refresh)
    end

    @acompanhamentos_all.each do |acompanhamentos_item|
      acompanhamentos_item.each do |acompanhamento_item|
        unless acompanhamento_item.blank?
          @acompanhamento_item = acompanhamento_item
          #@acompanhamentos = Acompanhamentos.all
        end
      end
    end

  end

  private


  def carrinho_insert
    session[:carrinho] ||= []
  end
end

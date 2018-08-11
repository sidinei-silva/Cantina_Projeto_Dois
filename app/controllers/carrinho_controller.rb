class CarrinhoController < ApplicationController
  before_action :authenticate_cliente!

  def index
    if params[:item] != nil
      items = Hash.new
      items[:produto_id] = params[:item][:produto_id]
      items[:acompanhamento_id] = params[:item][:acompanhamento_id]
      carrinho_insert << items
    end
    capture_produtos
    capture_acompanhamentos
  end

  private
  def carrinho_insert
    session[:carrinho] ||= []
  end

  def capture_produtos
    @produtos = []
    if defined? session[:carrinho]
      session[:carrinho].each do |carrinho|
        # :nome (first request) "nome" (refresh)
        begin
          @produtos.push(Produto.find(carrinho[:produto_id]))
        rescue ActiveRecord::RecordNotFound
          @produtos.push(Produto.find(carrinho["produto_id"]))
        end
      end
    end
  end


  def capture_acompanhamentos
    @acompanhamentos_all = []
    @acompanhamentos = []
    acompanhamentos_in_session
    acompanhamentos_info
  end

  def acompanhamentos_in_session
    session[:carrinho].each do |carrinho|
      # :nome (first request) "nome" (refresh)
      if carrinho[:acompanhamento_id] != nil
        @acompanhamentos_all.push carrinho[:acompanhamento_id]
      else
        @acompanhamentos_all.push carrinho["acompanhamento_id"]
      end
    end
  end

  def acompanhamentos_info
    @acompanhamentos_all.each do |acompanhamentos_item|
      acompanhamentos_item.each do |acompanhamento_item|
        unless acompanhamento_item.blank?
          @acompanhamentos.push(Acompanhamento.find(acompanhamento_item))
        end
      end
    end
  end

end


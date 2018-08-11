# frozen_string_literal: true

# Value for View
# Index
#   @produtos
#     {All values the produtos from session in database}
#   @acompanhamentos
#     {All values the produtos from session in database}
#
class CarrinhoController < ApplicationController
  before_action :authenticate_cliente!

  def index
    unless params[:item].nil?
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
        @produtos.push(Produto.find(carrinho[:produto_id]))
      rescue ActiveRecord::RecordNotFound
        @produtos.push(Produto.find(carrinho['produto_id']))
      end
    end
  end

  def capture_acompanhamentos
    @acompanhamentos = []
    @acompanhamentos_item = acompanhamentos_item = [] #acom
    @acompanhamentos_item_info = []
    acompanhamentos_in_session(acompanhamentos_item)
    acompanhamentos_info(acompanhamentos_item)
  end

  def acompanhamentos_in_session(acompanhamentos_item)
    session[:carrinho].each do |carrinho|
      # :nome (first request) "nome" (refresh)
      if !carrinho[:acompanhamento_id].nil?
        acompanhamentos_item.push carrinho[:acompanhamento_id]
      else
        acompanhamentos_item.push carrinho['acompanhamento_id']
      end
    end
  end

  def acompanhamentos_info(acompanhamentos_item)
    acompanhamentos_item.each do |acompanhamento_item|
      acompanhamento_item.each do |acomp|
        unless acomp.blank?
          @acompanhamentos.push(Acompanhamento.find(acomp))
        end
      end
      @acompanhamentos_item_info.push(@acompanhamentos)
      @acompanhamentos = []
    end
  end

end


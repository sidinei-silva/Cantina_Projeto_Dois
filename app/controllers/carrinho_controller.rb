# frozen_string_literal: true
# Value for View
# Index
#   @produtos
#     {All values the produtos from session in database}
#   @acompanhamentos
#     {All values the acompanhamento from session in database}
#
class CarrinhoController < ApplicationController

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

  #@acompanhamentos_item_info
  #   {All values the acompanhamento from session in database }
  #@acompanhamento_info
  #   {-variable aux-Acompanhamento value separate}
  #acompanhamentos_all
  #   {All ids the acompanhemento in session separate in vector for item}
  def capture_acompanhamentos
    @acompanhamentos_item_info = []
    @acompanhamento_info = []
    acompanhamentos_all = []
    acompanhamentos_in_session(acompanhamentos_all)
    acompanhamentos_info(acompanhamentos_all)
  end

  def acompanhamentos_in_session(acompanhamentos_all)
    session[:carrinho].each do |carrinho|
      # :nome (first request) "nome" (refresh)
      if !carrinho[:acompanhamento_id].nil?
        acompanhamentos_all.push carrinho[:acompanhamento_id]
      else
        acompanhamentos_all.push carrinho['acompanhamento_id']
      end
    end
  end

  def acompanhamentos_info(acompanhamentos_all)
    acompanhamentos_all.each do |acompanhamento_item|
      acompanhamento_item.each do |acompanhamento_id|
        unless acompanhamento_id.blank?
          @acompanhamento_info.push(Acompanhamento.find(acompanhamento_id))
        end
      end
      @acompanhamentos_item_info.push(@acompanhamento_info)
      @acompanhamento_info = []
    end
  end

end


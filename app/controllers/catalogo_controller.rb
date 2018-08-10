class CatalogoController < ApplicationController
  def index
    @produtos = Produto.all
  end

  def detalhes
    begin
      @produto = Produto.find(params[:format])
      @acompanhamento = Acompanhamento.where(produto_id: @produto.id)
    rescue ActiveRecord::RecordNotFound => e
      flash[:notice] = "Produto não encontrado"
      redirect_to root_url
    end
  end
end

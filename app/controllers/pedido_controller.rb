class PedidoController < ApplicationController

  def index
    @pedidos = Pedido.all
  end

  def new
    @pedido = Pedido.new
    @item_pedido = @pedido.item_pedidos.build
    @item_pedido.item_acompanhamentos.build
  end

  def create
    @pedido = Pedido.new(pedido_params)
    if @pedido.save
      flash[:notice] = 'Successfully created project.'
      redirect_to only_path: @pedido
    else
      redirect_to pedido_index_path
    end
  end

  def pedido_params
    params.require(:pedido).permit(
      :status_pedido, :total_pedido, :cliente_id,
      item_pedidos_attributes: [
        :quantidade_item_pedido,
        :total_item_pedido,
        :produto_id,
        item_acompanhamentos_attributes: [
          :valor_acompanhamento
        ]
      ]
    )
  end

end

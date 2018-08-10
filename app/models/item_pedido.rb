class ItemPedido < ApplicationRecord
  belongs_to :produto
  belongs_to :pedido
  has_many :item_acompanhamentos
end

class Pedido < ApplicationRecord
  belongs_to :cliente
  has_many :item_pedidos
end

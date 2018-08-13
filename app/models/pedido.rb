class Pedido < ApplicationRecord
  belongs_to :cliente
  has_many :item_pedidos
  accepts_nested_attributes_for :item_pedidos, allow_destroy: true
end


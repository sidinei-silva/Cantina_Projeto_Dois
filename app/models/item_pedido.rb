class ItemPedido < ApplicationRecord
  belongs_to :produto
  belongs_to :pedido
  has_many :item_acompanhamentos
  accepts_nested_attributes_for :item_acompanhamentos, allow_destroy:  true
end

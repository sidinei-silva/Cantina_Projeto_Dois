class ItemAdicional < ApplicationRecord
  belongs_to :acompanhamento
  belongs_to :item_pedido
end

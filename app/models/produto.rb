class Produto < ApplicationRecord
  has_many :acompanhamentos
  has_many :item_pedidos
  has_one_attached :image
end

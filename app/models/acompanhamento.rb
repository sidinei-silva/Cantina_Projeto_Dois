class Acompanhamento < ApplicationRecord
  belongs_to :produto
  has_many :item_acompanhamentos
end

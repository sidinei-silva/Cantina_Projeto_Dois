class CreateItemAdicionals < ActiveRecord::Migration[5.2]
  def change
    create_table :item_adicionals do |t|
      t.float :valor_acompanhamento
      t.references :acompanhamento, foreign_key: true
      t.references :item_pedido, foreign_key: true

      t.timestamps
    end
  end
end

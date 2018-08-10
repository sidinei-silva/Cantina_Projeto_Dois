class CreateItemPedidos < ActiveRecord::Migration[5.2]
  def change
    create_table :item_pedidos do |t|
      t.integer :quantidade_item_pedido
      t.float :total_item_pedido
      t.references :produto, foreign_key: true
      t.references :pedido, foreign_key: true

      t.timestamps
    end
  end
end

class CreatePedidos < ActiveRecord::Migration[5.2]
  def change
    create_table :pedidos do |t|
      t.string :status_pedido
      t.float :total_pedido
      t.references :cliente, foreign_key: true

      t.timestamps
    end
  end
end

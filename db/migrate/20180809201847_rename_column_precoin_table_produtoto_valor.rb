class RenameColumnPrecoinTableProdutotoValor < ActiveRecord::Migration[5.2]
  def change
    rename_column :produtos, :preco_produto, :valor_produto
  end
end

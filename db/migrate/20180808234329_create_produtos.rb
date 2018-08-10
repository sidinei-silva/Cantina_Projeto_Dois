class CreateProdutos < ActiveRecord::Migration[5.2]
  def change
    create_table :produtos do |t|
      t.string :nome_produto
      t.string :descricao_produto
      t.float :preco_produto
      t.string :imagem_produto
      t.boolean :esta_ativo

      t.timestamps
    end
  end
end

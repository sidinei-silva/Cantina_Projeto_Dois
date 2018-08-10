class CreateAcompanhamentos < ActiveRecord::Migration[5.2]
  def change
    create_table :acompanhamentos do |t|
      t.string :nome_acompanhamento
      t.float :valor_acompanhamento
      t.boolean :esta_ativo
      t.references :produto, foreign_key: true

      t.timestamps
    end
  end
end

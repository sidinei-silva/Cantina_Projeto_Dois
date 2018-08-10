class RenameItemAdicionalToItemAcompanhamento < ActiveRecord::Migration[5.2]
  def change
    rename_table :item_adicionals, :item_acompanhamentos
  end
end

class AddBrandAndExpansionToBlueprints < ActiveRecord::Migration[7.1]
  def change
    add_reference :blueprints, :brand, null: true, foreign_key: true
    add_reference :blueprints, :expansion, null: true, foreign_key: true
  end
end

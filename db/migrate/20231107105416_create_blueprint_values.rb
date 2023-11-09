class CreateBlueprintValues < ActiveRecord::Migration[7.1]
  def change
    create_table :blueprint_values do |t|
      t.references :blueprint, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true
      t.string :value , null: false

      t.timestamps
    end
  end
end

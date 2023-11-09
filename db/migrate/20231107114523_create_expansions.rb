class CreateExpansions < ActiveRecord::Migration[7.1]
  def change
    create_table :expansions do |t|
      t.references :brand, null: false, foreign_key: true
      t.string :name , null: false

      t.timestamps
    end
    add_index :expansions, [:name , :brand_id] , unique: true
    add_index :expansions, :name
  end
end

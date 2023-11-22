class CreateBlueprintTranslations < ActiveRecord::Migration[7.1]
  def change
    create_table :blueprint_translations do |t|
      t.references :blueprint, null: false, foreign_key: true
      t.string :name , null: false
      t.string :locale , null: false

      t.timestamps
    end
    
    add_index :blueprint_translations, :name
    add_index :blueprint_translations, :locale
    add_index :blueprint_translations, [:locale , :blueprint_id ], unique: true

  end
end

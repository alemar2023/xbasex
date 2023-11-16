class CreateVoices < ActiveRecord::Migration[7.1]
  def change
    create_table :voices do |t|
      t.string :name
      t.references :division, null: false, foreign_key: true
      t.string :locale

      t.timestamps
    end
  end
end

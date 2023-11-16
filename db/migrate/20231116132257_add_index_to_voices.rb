class AddIndexToVoices < ActiveRecord::Migration[7.1]
  def change
    add_index :voices, :locale
    add_index :voices, [:locale , :division_id ], unique: true

  end
end

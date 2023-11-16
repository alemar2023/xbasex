class AddIndexNameTo < ActiveRecord::Migration[7.1]
  def change
    add_index :voices, :name
  end
end

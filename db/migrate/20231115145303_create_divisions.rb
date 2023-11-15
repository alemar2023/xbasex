class CreateDivisions < ActiveRecord::Migration[7.1]
  def change
    create_table :divisions do |t|
      t.integer :parent_id

      t.timestamps
    end
  end
end

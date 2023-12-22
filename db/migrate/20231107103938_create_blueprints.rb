railsclass CreateBlueprints < ActiveRecord::Migration[7.1]
  def change
    create_table :blueprints do |t|
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end

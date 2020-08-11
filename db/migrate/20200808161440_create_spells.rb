class CreateSpells < ActiveRecord::Migration[6.0]
  def change
    create_table :spells do |t|
      t.string :name, limit: 70, null: false
      t.integer :level, null: false
      t.string :school, null: false
      t.string :concentration, null: false
      t.string :description, limit: 4096


      t.timestamps
    end
  end
end

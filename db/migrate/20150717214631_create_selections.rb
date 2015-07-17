class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.integer :choice_id, null: false
      t.integer :taker_id, null: false

      t.timestamps null: false
    end
  end
end

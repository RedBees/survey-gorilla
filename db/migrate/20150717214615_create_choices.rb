class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.integer :question_id, null: false
      t.string :body, null: false

      t.timestamps null: false
    end
  end
end

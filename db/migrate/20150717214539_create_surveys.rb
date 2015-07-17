class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :title, null: false
      t.integer :creator_id, null: false
      t.boolean :status, null: false, default: false
      t.text :completion_message

      t.timestamps null: false
    end
  end
end

class CreateSurveyTakers < ActiveRecord::Migration
  def change
    create_table :survey_takers do |t|
      t.integer :survey_id, null: false
      t.integer :taker_id, null: false

      t.timestamps null: false
    end
  end
end

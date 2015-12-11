class CreateSurveyUsers < ActiveRecord::Migration
  def change
    create_table :survey_users do |t|
      t.references :survey
      t.references :user

      t.timestamps null: false
    end
  end
end

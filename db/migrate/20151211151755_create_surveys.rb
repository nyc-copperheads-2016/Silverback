class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :title, null: false
      # t.integer :author_id, null: false
      t.references :user
      t.timestamps null: false
    end
  end
end

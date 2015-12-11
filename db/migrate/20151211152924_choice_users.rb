class ChoiceUsers < ActiveRecord::Migration
  def change
    create_table :choice_users do |t|
      t.references :choice
      t.references :user

      t.timestamp null: false
    end
  end
end

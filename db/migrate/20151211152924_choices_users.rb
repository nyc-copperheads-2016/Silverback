class ChoicesUsers < ActiveRecord::Migration
  def change
    create_table :choices_users do |t|
      t.references :choice
      t.references :user

      t.timestamp null: false
    end
  end
end

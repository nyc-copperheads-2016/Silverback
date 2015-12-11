class Survey < ActiveRecord::Base
  has_many :questions
  has_and_belongs_to_many :users
  has_one :author, foreign_key: :user_id
end

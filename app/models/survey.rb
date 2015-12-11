class Survey < ActiveRecord::Base
  has_many :questions
  has_and_belongs_to_many :users
  belongs_to :user
  # belongs_to :author, class_name: :User
end

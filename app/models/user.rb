class User < ActiveRecord::Base
  has_and_belongs_to_many :surveys
  has_and_belongs_to_many :choices

end

require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt
  attr_accessor :password_confirmation

  has_and_belongs_to_many :surveys
  has_and_belongs_to_many :choices
  has_many :authored_surveys, class_name: :Survey

  # validates :password_confirmation, length: { minimum: 5}
  # validates_confirmation_of :password, :confirm => :password_confirmation

  # def password_confirmation_matches
  #   unless password_confirmation == self.password
  #     errors.add(:password_confirmation, "must be a match")
  #   end
  # end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end

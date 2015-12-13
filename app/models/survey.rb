class Survey < ActiveRecord::Base
  has_many :questions
  has_and_belongs_to_many :users
  belongs_to :user

  def total_attempt (survey)
    total = 0
    survey.questions.each do |question|
      question.choices.each do |choice|
        total += choice.users.length
      end
    end
    total
  end
end

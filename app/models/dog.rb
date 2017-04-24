class Dog < ApplicationRecord
	include ValidatesDateOnWithin
  belongs_to :user
  validates :name, :breed, :date_of_birth_on, presence: true
  validate :validate_dated_around_now


  protected

  def validate_dated_around_now
    # make sure dated_on isn't more than five years in the past or future
    self.errors.add(:date_of_birth_on, "is not valid") unless ((30.years.ago)..(0.years.from_now)).cover?(self.date_of_birth_on)

  end
end

class Dog < ApplicationRecord
  belongs_to :user
  has_one :ownership_registration, inverse_of: :dog
  accepts_nested_attributes_for :ownership_registration, 
  	reject_if: proc {|attributes| ["three_months", "six_months", "twelve_months"].include? attributes[:duration]} 

  validates :name, :breed, :date_of_birth_on, presence: true
  validate :validate_dated_around_now

  def ownership_registration
  	super || build_ownership_registration
  end

  protected

  def validate_dated_around_now
    self.errors.add(:date_of_birth_on, "is not valid") unless ((30.years.ago)..(0.years.from_now)).cover?(self.date_of_birth_on)
  end
end

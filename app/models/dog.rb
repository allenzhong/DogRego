class Dog < ApplicationRecord
  belongs_to :user
  has_one :ownership_registration, inverse_of: :dog
  accepts_nested_attributes_for :ownership_registration,
    reject_if: proc {|attributes| ["three_months", "six_months", "twelve_months"].exclude? attributes[:duration]} 

  validates :name, :breed, :date_of_birth_on, presence: true
  validate :validate_dated_around_now

  scope :users_dogs, ->(user) {where(user_id: user.id)}

  def registered?
    ownership_registration.persisted? and !ownership_registration.duration.nil?
  end

  def ownership_registration
    super || build_ownership_registration
  end

  def valid_duration
    return 'Have not been registered' unless ownership_registration.persisted?
    "#{ownership_registration.start_on.strftime("%d/%m/%Y")} - #{ownership_registration.will_end_on.strftime("%d/%m/%Y")}"
  end

  def send_ownership_registeration
    DogMailer.ownership_registered(self).deliver_later
    self.ownership_registration.email_sent = true
    self.save
  end

  protected
  
    def validate_dated_around_now
      self.errors.add(:date_of_birth_on, "is not valid") unless ((30.years.ago)..(0.years.from_now)).cover?(self.date_of_birth_on)
    end
end

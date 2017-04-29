class OwnershipRegistration < ApplicationRecord
	enum duration: [:three_months, :six_months, :twelve_months]
  belongs_to :dog
end
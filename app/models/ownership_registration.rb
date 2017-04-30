class OwnershipRegistration < ApplicationRecord
	enum duration: [:three_months, :six_months, :twelve_months]
  belongs_to :dog, inverse_of: :ownership_registration

  def self.durations_for_select
  	durations.map do |element|
  		[I18n.t("activerecord.attributes.#{model_name.i18n_key}.durations.#{element.first}"), element.first]
  	end
  end
end

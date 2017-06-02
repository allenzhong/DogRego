class OwnershipRegistration < ApplicationRecord
  enum duration: {three_months: 3, six_months: 6, twelve_months: 12}

  belongs_to :dog, inverse_of: :ownership_registration
  before_save :update_duration

  def self.durations_for_select
    durations.map do |element|
      dollar = AppConfig.durations[element.first]
      duration = I18n.t("activerecord.attributes.#{model_name.i18n_key}.durations.#{element.first}")
      ["#{dollar} for #{duration}", element.first]
    end
  end

  def will_end_on
    months = OwnershipRegistration.durations[duration]
    start_on + months.month 
  end

  private
    def update_duration
      self.start_on = Date.today
    end
end

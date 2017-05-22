class Profile < ApplicationRecord
  belongs_to :user, inverse_of: :profile

  def name
  	"#{first_name} #{last_name}"
  end

  def address
  	"#{street}, #{suburb}, #{town_city} #{postcode}"
  end
end

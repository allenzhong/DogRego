class User < ApplicationRecord

  has_one :profile, inverse_of: :user
  accepts_nested_attributes_for :profile, allow_destroy: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessor :login
	validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validates :username, 
  	:presence => true,
  	:uniqueness => {
  		:case_sensitive => false
  	}
	validate :validate_username

  def validate_username
  	if User.where(email: username).exists?
    	errors.add(:username, :invalid)
  	end
	end

  def profile
    super || build_profile
  end

  def login=(login)
  	@login = login
  end

  def login
  	@login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
  	conditions = warden_conditions.dup
  	if login = conditions.delete(:login)
  		where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase}]).first
  	elsif conditions.has_key?(:username) || conditions.has_key?(:email)
  		where(conditions.to_hash).first
  	end

  	conditions[:email].downcase! if conditions[:email]
  	where(conditions.to_hash).first
  end

  ROLES = %i[admin user]

  def roles=(roles)
    roles = [*roles].map { |r| r.to_sym }
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def has_role?(role)
    roles.include?(role)
  end
end

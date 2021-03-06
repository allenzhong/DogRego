class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  protected
    def after_sign_up_path_for(resource)
      if current_user.has_role? :admin
        report_index_path
      elsif current_user.has_role? :user
        dogs_path
      else
        super(resource)
      end
    end

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [roles: [], profile_attributes: [:first_name, :middle_name, :last_name, :street, :suburb, :town_city, :country, :postcode]])
    end

    # The path used after sign up for inactive accounts.
     def after_inactive_sign_up_path_for(resource)
       "/users/sign_up"
     end
end

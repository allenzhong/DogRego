class DashboardController < ApplicationController
  def index
    if current_user.has_role? :admin
      redirect_to report_index_path
    elsif current_user.has_role? :owner
      redirect_to dogs_path
    end
  end
end

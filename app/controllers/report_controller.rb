class ReportController < ApplicationController
	def index
  	@users = User.owners
  end
end

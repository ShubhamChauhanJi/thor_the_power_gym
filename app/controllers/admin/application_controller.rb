class Admin::ApplicationController < ApplicationController
	layout 'admin'
	before_action :admin?

  def admin?
  	if current_user && current_user.role.name.eql?("super_admin")
  	else
  		redirect_to root_path, alert: "You are not authorized! - A"
  	end
  end
end

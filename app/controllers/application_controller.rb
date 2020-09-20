class ApplicationController < ActionController::Base
	protected

  		def after_sign_in_path_for(resource)
  			if resource.role.name.eql?("user")
  				user_approval_documents_path
  			else
  				admin_home_index_path
  			end
    		# return the path based on resource
  		end
end

class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?
 


    def authorize_request(kind = nil)
        unless kind.include?(current_user.role)
            redirect_to vacants_path, notice: "You are not authorized to perform this action"
        end
    end
       

    def after_sign_in_path_for(resource)
        vacants_path
    end

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, :age, :address, :images])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :last_name, :age, :address, :images])
    end
end

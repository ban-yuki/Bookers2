class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    users_path(current_user.id)
    if @user.save
      flash[:notice] = "Welcome! You have signed up successfully."
      redirect_to users_path(current_user.id)
    else
      render :index
    end
  end

  def after_sign_out_path_for(resource)
    about_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def create

  end
end

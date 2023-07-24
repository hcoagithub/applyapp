class AdminsController < ApplicationController
  before_action :authenticate_user!

  before_action only: [:new, :create] do
    authorize_request(["author", "admin"])
  end

  before_action only: [:edit, :update, :destroy] do
    authorize_request(["admin"])
  end

  def authorize_request(kind = nil)
    unless kind.include?(current_user.role)
        redirect_to vacants_path, notice: "You are not authorized to perform this action"
    end
  end

  def new
    @user= User.new
  end

  def create
    @user = User.new(admin_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to vacants_url, notice: "User was successfully created." }

      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def admin_params
    #  devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation, :role])
    params.require(:user).permit(:name, :last_name, :age, :addres, :email, :password, :password_confirmation, :role, :images)
  end
end

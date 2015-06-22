class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = @users.order(:created_at, :email)
  end

  def new
  end

  def create
    @user.save
    respond_with @user, location: users_path
  end

  def edit
  end

  def update
    @user.update(user_params)
    respond_with @user, location: users_path
  end

  def destroy
    @user.save
    respond_with @user, location: users_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role_ids, role_ids: [])
  end
end

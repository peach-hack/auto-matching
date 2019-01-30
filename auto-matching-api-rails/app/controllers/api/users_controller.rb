module Api
  class UsersController < ApplicationController
    wrap_parameters :user, include: [:username, :password]

    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        response_success(:users, :create)
      else
        response_internal_server_error
      end
    end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end
  end
end

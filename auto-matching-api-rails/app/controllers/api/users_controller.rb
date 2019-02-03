module Api
  class UsersController < ::ApplicationController
    wrap_parameters :user, include: [:username, :password]

    def create
      # シングルユーザしか許可しない
      if User.count > 0
        response_unauthorized
      else
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          render json: UserSerializer.new(@user).serialized_json
        else
          response_internal_server_error
        end
      end
    end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end
  end
end

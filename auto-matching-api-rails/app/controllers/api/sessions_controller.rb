module Api
  class SessionsController < ::ApplicationController
    def create
      if @user = User.authenticate(session_params[:username], session_params[:password])

        session[:user_id] = @user.id
        # render json: UserSerializer.new(@user).serialized_json
        render status: :created
      else
        response_unauthorized
      end
    end

    def destroy
      session[:user_id] = nil
      head :ok
    end

  private

    def session_params
      params.require(:session).permit(:username, :password)
    end
  end
end

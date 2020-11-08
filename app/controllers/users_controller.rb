class UsersController < ApplicationController
    def new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id
        else
            flash.now.alert = "Oops, couldn't create account. Please make sure you are using a valid name and password and try again."
            redirect_to new_user_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end

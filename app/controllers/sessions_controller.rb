class SessionsController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(params.require(:user).permit(:name, :password))
        user = User.find_by(name: params[:user][:name])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
        else
            flash.now.alert = "Incorrect email or password, try again."
            return head(:forbidden)
        end
    end

    def destroy
    end
end

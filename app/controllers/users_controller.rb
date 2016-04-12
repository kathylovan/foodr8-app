class UsersController < ApplicationController
    before_action :is_authenticated?, except: [:new, :create]

    def new
        @user = User.new
    end

    def create
        user = User.create user_params
        session[:user_id] = user.id
        flash[:success] = "Welcome " + user.username + "!"
        redirect_to root_path
    end

    def edit
    end

    def show
    end

    def update
    end

    def destroy
    end

    private

    def user_params
        params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
    end
end

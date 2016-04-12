class UsersController < ApplicationController
    before_action :is_authenticated?, except: [:new, :create]
    
    def new
        @user = User.new
    end

    def create
        user = User.create user_params
        flash[:success] = "User created"
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
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end

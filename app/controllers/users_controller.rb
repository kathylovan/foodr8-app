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
        @my_reviews = Review.where(user_id: @current_user.id)
    end

    def update
    end

    def destroy
        # user = User.find(@current_user.id)
        # user_reviews = Review.where(user_id: @current_user.id)
        # user.delete
        # user_reviews.delete
        # flash[:success] = "Account deleted"
        # redirect_to root_path
    end

    private

    def user_params
        params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
    end
end

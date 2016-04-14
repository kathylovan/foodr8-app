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
        user_id = @current_user.id
        user = User.find(user_id)

        if user_params == nil
            flash[:danger] = "Passwords do not match"
            redirect_to "/myaccount/edit"
        else
            user.update user_params
            flash[:success] = "Account updated"
            redirect_to "/myaccount"
        end
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
        password = params[:user][:password]
        password_confirmation = params[:user][:password_confirmation]
        if password == password_confirmation
            params.require(:user).permit(:name, :username, :email)
        else
            nil
        end
    end
end

class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.authenticate user_params[:email], user_params[:password]

		if user
			session[:user_id] = user.id
			flash[:success] = "Welcome back " + user.username + "!"
			redirect_to root_path
		else
			flash[:danger] = "Invalid credentials. Try again."
			redirect_to login_path
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:warning] = "Logged out"
		redirect_to root_path
	end

	private

	def user_params
		params.require(:user).permit(:email, :password)
	end
end

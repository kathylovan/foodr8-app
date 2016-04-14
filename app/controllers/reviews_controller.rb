class ReviewsController < ApplicationController
    before_action :is_authenticated?
    
    def new
        @place = Place.find(params[:id])
        @user = User.find(@current_user[:id])
        @review = Review.new
    end

    def create
        new_review = Review.create(review_params)
        redirect_to root_path
    end

    def edit
    end

    def update
    end

    def showe
    end

    def destroy
    end

    private

    def review_params
        params.require(:review).permit(:food, :drinks, :service, :atmostphere, :parking, :family, :dog, :gluten, :comments)
    end
end

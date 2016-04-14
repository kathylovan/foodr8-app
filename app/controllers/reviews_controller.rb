class ReviewsController < ApplicationController
    before_action :is_authenticated?, except: [:show]

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

    def show
        @reviews = Review.where(place_id: @place.id)
    end

    def destroy
    end

    private

    def review_params
        params.require(:review).permit(:place_id, :user_id, :food, :drinks, :service, :atmosphere, :parking, :family, :dog, :gluten, :comments)
    end
end

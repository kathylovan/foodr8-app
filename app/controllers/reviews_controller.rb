class ReviewsController < ApplicationController
    def new
        @place = Place.find(params[:id])
    end

    def create
    end

    def edit
    end

    def update
    end

    def show
    end

    def destroy
    end
end

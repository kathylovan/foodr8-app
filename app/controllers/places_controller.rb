class PlacesController < ApplicationController
    require 'yelp'

    def new
        @place = Place.new
    end

    def create
        new_place = Place.find_or_create_by(place_params)
        redirect_to "/reviews/new/#{new_place.id}"
    end

    def show
        @place_id = params[:place].to_s
        @name = params[:name].to_s
        @address = params[:address].to_s
        @city = params[:city].to_s
        @state = params[:state].to_s
        @zip = params[:zip].to_s
        @image = params[:image].to_s
        @reviews = Review.all

    end

    def search
        client = Yelp::Client.new({
            consumer_key: ENV["CONSUMER_KEY"],
            consumer_secret: ENV["CONSUMER_SECRET"],
            token: ENV["TOKEN"],
            token_secret: ENV["TOKEN_SECRET"]
        })

        @term = params[:term].to_s
        @location = params[:location].to_s

        @results = client.search(@location, { term: @term })

        @total = @results.businesses.length
    end

    private

    def place_params
        params.require(:place).permit(:place_id, :name, :address, :city, :state, :zip, :image)
    end

    def search_params
        params.permit(:term, :location)
    end
end

class PlacesController < ApplicationController
    require 'yelp'

    def create
    end

    def new
    end

    def edit
    end

    def show
    end

    def search
        client = Yelp::Client.new({
            consumer_key: ENV["CONSUMER_KEY"],
            consumer_secret: ENV["CONSUMER_SECRET"],
            token: ENV["TOKEN"],
            token_secret: ENV["TOKEN_SECRET"]
        })

        params.permit(:term, :location)

        @term = params[:term].to_s
        @location = params[:location].to_s

        @results = client.search(@location, { term: @term })

        @total = @results.businesses.length
    end
end

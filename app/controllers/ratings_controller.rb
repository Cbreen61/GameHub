class RatingsController < ApplicationController
    def index 
    end

    def show
        @game = Game.find(params[:game_id])
        @rating = Rating.find(params[:id])
    end

    def new 
        @game = Game.find(params[:game_id])
        @rating = Rating.build
    end

    def create
        @rating = Rating.new(rating_params)
        if @rating.save
            redirect_to games_rating_path(params[:game_id], @rating)
        else
            render :new
        end
    end

    def edit 

    end

    def update
    end

    def destroy 

    end

    private 
    def rating_params
        params.require(:rating).permit(:comment, :stars, :user_id, :game_id)
    end

end
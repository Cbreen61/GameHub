class RatingsController < ApplicationController
    def index 
    end

    def show
        @game = Game.find(params[:game_id])
        @rating = Rating.find(params[:id])
    end

    def new 
        @game = Game.find(params[:game_id])
        @rating = @game.ratings.build
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
        @rating = Rating.find(params[:id])
        @game = Game.find(params[:game_id])
    end

    def update
        @rating = Rating.find(params[:id])
        @rating.update(rating_params)
        redirect_to game_path(@rating.game_id)
    end

    def destroy 
    end

    private 
    def rating_params
        params.require(:rating).permit(:comment, :stars)
    end

end
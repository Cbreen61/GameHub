class GamesController < ApplicationController
    before_action :find_game, only:[:show, :edit, :update, :destroy]
    def index
        @games = Game.all
    end
    def show
    end
    def new
        @game = Game.new
    end
    def create
    params
        @game = Game.new(game_params)
        if @game.save 
            redirect_to games_path
        else
            flash.now[:error] = @game.errors.full_messages
            render :new
        end
    end

    def edit
    end


    private
        def find_game
            @game = Game.find_by_id(params[:id])
        end

        def game_params
            params.require(:games).permit(:title, :release_date, :audience_rating, :image)
        end
end
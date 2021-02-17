class GamesController < ApplicationController
    before_action :find_game, only: [:show, :edit, :update]
    before_action :require_login, except: [:index, :show]
    def index
        @games = Game.all.ordered_by_title 
    end

    def show
        if find_game
        render :show
        else
            game_not_found
        end

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
    
    def update
        if @game.update(game_params)
            redirect_to game_path(@game)
        else
            flash.now[:error] = @game.errors.full_messages
            render :edit
        end
        
    end





    private
        def find_game
            @game = Game.find_by_id(params[:id])
        end

        def game_params
            params.require(:game).permit(:title, :release_date, :audience_rating, :image)
        end

        def game_not_found
            flash[:notice] = "Game does not exist"
            redirect_to games_path
        end

end
class GamesController < ApplicationController
    before_action :find_game, only: [:show, :edit, :update, :destroy]
    before_action :require_login, except: [:index, :show]
    def index
        @games = Game.all.ordered_by_title 
    end

    def show
        if @game = Game.find_by_id(params[:id])
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
        if game_user

        else
            flash[:notice] = "You can only edit games you add."
            redirect_to game_path(@game)
        end

    end
    
    def update
        if @game.update(game_params)
            redirect_to game_path(@game)
        else
            flash.now[:error] = @game.errors.full_messages
            render :edit
        end
        
    end

    def destroy
        if game_user
            @game.destroy
            flash[:notice] = "#{@game.title} was deleted."
            redirect_to games_path
        else
            flash[:notice] = "Only users that create games can delete them"
            redirect_to game_path(@game)
        end
    end



    private
        def find_game
            @game = Game.find_by_id(params[:id])
        end

        def game_params
            params.require(:game).permit(:title, :release_date, :audience_rating, :image)
        end
        def game_user
            @game.user_ids == current_user
        end
end
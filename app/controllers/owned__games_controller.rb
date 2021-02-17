class OwnedGamesController < ApplicationController
    before_action :collection_array, only: [:new, :edit, :destroy]
    before_action :find_owned, only: [:destroy]

    def show
        @platform = Platform.find(params[:platform_id])
        @owned = OwnedGame.find(params[:id])
        @game = Game.find(params[:game_id])

    
    end

    def new
        @platform = Platform.find(params[:platform_id])
        @owned = @platform.owned_games.build
      
    end

    def create
        @owned = OwnedGame.create(owned_params)
        redirect_to platforms_path
    end

    def destroy
        @owned.destroy
        redirect_to platforms_path
    end
   
    private 
   def owned_params
    params.require(:owned_game).permit(:game_id, :platform_id)
   end

   def collection_array
    @games = Game.all
    @platforms = Platform.all
   end

   def find_owned
    @platform = Platform.find(params[:platform_id])
    @owned = OwnedGame.find(params[:id])
   end
end

class GamesController < ApplicationController
    before_action :find_game, only:[:show, :edit, :destroy, :update]
    def index
        @games = Game.all
    end

    private
        def find_game
            @game = Game.find_by_id(params[:id])
        end
end
class ReviewsController < ApplicationController
  #before_action :redirect_if_not_logged_in
  
  def index
  end

  def show
    @game = Game.find(params[:game_id])
    @review = Review.find(params[:id])

  end

  def new
    @game = Game.find(params[:game_id])
    @review = @game.reviews.build
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to game_review_path(params[:game_id], @review)
    else 
      render :new 
    end 
  end

  def edit
    @review = Review.find(params[:id])
    @game = Game.find(params[:game_id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to game_path(@review.game_id)
  end

  def destory
  end 

  private 
   def review_params
    params.require(:review).permit(:comment,:user_id,:game_id)
   end 
end
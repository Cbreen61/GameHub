class ReviewsController < ApplicationController
  before_action :require_login
  
  def index
    redirect_to games_path
  end



  def new
    @game = Game.find(params[:game_id])
    @review = @game.reviews.build
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to game_path(params[:game_id])
    else 
      render :new 
    end 
  end

  def edit
    @review = Review.find(params[:id])
    @game = Game.find(params[:game_id])
    if review_user

    else
      flash[:notice] = "You can only edit your reviews"
      redirect_to game_path(@review.game_id)
    end
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to game_path(@review.game_id)
  end

  def destroy
    @review = Review.find(params[:id])
    if review_user
      @review.destroy
      flash[:notice] = "Review was deleted."
      redirect_to game_path(@review.game_id)
    else
      flash[:notice] = "You can not delete this review."
      redirect_to game_path(@review.game_id)
    end

  end 

  private 
   def review_params
    params.require(:review).permit(:comment,:user_id,:game_id)
   end 
   def review_user
    @review.user == current_user
   end


end
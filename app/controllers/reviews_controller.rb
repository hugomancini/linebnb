class ReviewsController < ApplicationController

  before_action :set_reservation

  def index
    @reviews = @reservation.reviews
  end

  def new
    @review = Review.new
  end

  def create
    @user = current_user
    @review = Review.new(review_params)
    @review.reservation = @reservation
    @review.user = @user
    if @review.save
      redirect_ to user_path(@user)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_reservation
    @reservation = Reservation.find(params[:reservation_id])
  end

end

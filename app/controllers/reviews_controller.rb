class ReviewsController < ApplicationController

  before_action :set_reservation
  before_action :set_queuer, only: [:index, :create]

  def index
    @reviews = @queuer.reviews
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
      redirect_ to queuer_path(@queuer)
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

  def set_queuer
    @queuer = @reservation.queuer
  end

end

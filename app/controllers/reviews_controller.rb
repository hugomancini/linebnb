class ReviewsController < ApplicationController

<<<<<<< HEAD
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
      redirect_to user_path(@user)
=======
  def show
    @user = User.find(params[:id])
    if @user.is_q?
      @queuer = @user.queuer
      @reviews = @user.reviews
    else
      @reviews = @user.reviews
    end
  end

  def new
    @review = Review.new()
  end

  def create
    @reservation = Reservation.find(params[:id])
    @user = @reservation.user
    @queuer = @reservation.queuer
    @review = Review.new(params[:reservation_id])
    @review.reservation = @reservation
    @review.user = @user
    if @review.save
      redirect_ to queuer_path(@queuer)
>>>>>>> c5e57d8a0aa4a2eb0105ec607ca47b4e7a8abd27
    else
      render :new
    end
  end

<<<<<<< HEAD
  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_reservation
    @reservation = Reservation.find(params[:reservation_id])
=======
  def edit
    @reservation = Reservation.find(params[:id])

  end

  def update

  end

  def destroy

>>>>>>> c5e57d8a0aa4a2eb0105ec607ca47b4e7a8abd27
  end

end

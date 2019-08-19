class ReviewsController < ApplicationController

  def index
  end

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
    else
      render :new
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])

  end

  def update

  end

  def destroy

  end

end

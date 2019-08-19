class ReservationsController < ApplicationController
 before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  def index
    @reservations = Reservation.all
  end

  def show
  end

  def new
    @queuer = Queuer.find(params[:queuer_id])
    @reservation = Reservation.new
  end

  def edit
  end

  def create
    @queuer = Queuer.find(params[:queuer_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.user = @user
    if @reservation.save
      redirect_to #profile du user ???
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        redirect_to #profile du user ???
      else
        render :edit
      end
    end
  end

  def destroy
    @queuer = Queuer.find(params[:queuer_id])
    @reservation.destroy
    redirect_to #profile du user ???
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:starts_at, :ends_at, :content, :adress)
  end
end

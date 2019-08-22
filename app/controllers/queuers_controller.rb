class QueuersController < ApplicationController
  def index
    if params[:query].present?
      @queuers = []
      @queuers_geocoded = []
      @myqueuers = Queuer.geocoded
      @myqueuers.each do |queuer|
        @queuers << queuer unless (queuer.distance_from(params[:query]).to_i > queuer.radius)
        @queuers_geocoded << queuer unless (queuer.distance_from(params[:query]).to_i > queuer.radius)
      end
    else
    @queuers = Queuer.all
    @queuers_geocoded = Queuer.geocoded
    end
    @markers = @queuers_geocoded.map do |queuer|
    {
      lat: queuer.latitude,
      lng: queuer.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { queuer: queuer })
    }
  end
  end

  def show
    @queuer = Queuer.find(params[:id])
  end

  def new
    @user = current_user
    @queuer = Queuer.new
  end

  def create
    @user = current_user
    @user.is_q = true
    @queuer = Queuer.new(queuer_params)
    @queuer.user = @user
    @queuer.save
    @user.save
    redirect_to user_path(@user)
  end


  def edit
    @user = current_user
    @queuer = @user.queuer
    raise
  end

  def update
    @queuer = Queuer.find(params[:id])
    @queuer.update(queuer_params)
    redirect_to queuer_path(@queuer)
  end

  def destroy
    @queuer = Queuer.find(params[:id])
    @queuer.destroy
    redirect_to queuers_path(@queuer)
  end

  private

  def queuer_params
    params.require(:queuer).permit(:address, :description, :radius, :price_per_hour)
  end
end

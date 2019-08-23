class QueuersController < ApplicationController
  def index
    if params[:query].present? && params[:price].present? && params[:rating].present?
      @queuers = []
      @queuers_geocoded = []
      @myqueuers = Queuer.geocoded
      @myqueuers.each do |queuer|
        if queuer.rating.nil?
          queuer.rating = 0
        end
        @queuers << queuer unless (queuer.price_per_hour > params[:price].to_s) || (queuer.distance_from(params[:query]).to_i > queuer.radius) || (queuer.rating < params[:rating].to_i)
        @queuers_geocoded << queuer unless (queuer.price_per_hour > params[:price].to_s) || (queuer.distance_from(params[:query]).to_i > queuer.radius) || (queuer.rating < params[:rating].to_i)
      end
    elsif params[:query].present? && params[:price].present?
      @queuers = []
      @queuers_geocoded = []
      @myqueuers = Queuer.geocoded
      @myqueuers.each do |queuer|
        if queuer.rating.nil?
          queuer.rating = 0
        end
        @queuers << queuer unless (queuer.price_per_hour > params[:price].to_i) || (queuer.distance_from(params[:query]).to_i > queuer.radius)
        @queuers_geocoded << queuer unless (queuer.price_per_hour > params[:price].to_i) || (queuer.distance_from(params[:query]).to_i > queuer.radius)
      end
    elsif params[:rating].present? && params[:query].present?
      @queuers = []
      @queuers_geocoded = []
      @myqueuers = Queuer.geocoded
      @myqueuers.each do |queuer|
        if queuer.rating.nil?
          queuer.rating = 0
        end
        @queuers << queuer unless (queuer.rating < params[:rating].to_i) || (queuer.distance_from(params[:query]).to_i > queuer.radius)
        @queuers_geocoded << queuer unless (queuer.rating < params[:rating].to_i) || (queuer.distance_from(params[:query]).to_i > queuer.radius)
      end
    elsif params[:rating].present? && params[:price].present?
      @queuers = []
      @queuers_geocoded = []
      @myqueuers = Queuer.geocoded
      @myqueuers.each do |queuer|
        if queuer.rating.nil?
          queuer.rating = 0
        end
        @queuers << queuer unless (queuer.rating < params[:rating].to_i) || (queuer.price_per_hour > params[:price].to_i)
        @queuers_geocoded << queuer unless (queuer.rating < params[:rating].to_i) || (queuer.price_per_hour > params[:price].to_i)
      end
    elsif params[:query].present?
      @queuers = []
      @queuers_geocoded = []
      @myqueuers = Queuer.geocoded
      @myqueuers.each do |queuer|
        if queuer.rating.nil?
          queuer.rating = 0
        end
        @queuers << queuer unless queuer.distance_from(params[:query]).to_i > queuer.radius
        @queuers_geocoded << queuer unless queuer.distance_from(params[:query]).to_i > queuer.radius
      end
    elsif params[:price].present?
      @queuers = []
      @queuers_geocoded = []
      @myqueuers = Queuer.geocoded
      @myqueuers.each do |queuer|
        if queuer.rating.nil?
          queuer.rating = 0
        end
        @queuers << queuer unless queuer.price_per_hour > params[:price].to_i
        @queuers_geocoded << queuer unless queuer.price_per_hour > params[:price].to_i
      end
     elsif params[:rating].present?
      @queuers = []
      @queuers_geocoded = []
      @myqueuers = Queuer.geocoded
      @myqueuers.each do |queuer|
        if queuer.rating.nil?
          queuer.rating = 0
        end
        @queuers << queuer unless queuer.rating < params[:rating].to_i
        @queuers_geocoded << queuer unless queuer.rating < params[:rating].to_i
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
    @geocoded_queuers = Queuer.geocoded
    @geocoded_queuers_filtered = []
    @queuer = Queuer.find(params[:id])
    @geocoded_queuers.each do |element|
      if element.id == @queuer.id
        @geocoded_queuers_filtered << element
      end
    end
    @markers = @geocoded_queuers_filtered.map do |geocoded|
        {
          lat: geocoded.latitude,
          lng: geocoded.longitude,
          infoWindow: render_to_string(partial: "info_window_for_show", locals: { geocoded: geocoded })
        }
    end
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

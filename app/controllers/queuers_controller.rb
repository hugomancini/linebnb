class QueuersController < ApplicationController
  def index
    @queuers = Queuer.all
  end

  def show
    @queuer = Queuer.find(params[:id])
  end

  def new
    @queuer = Queuer.new
  end

  def create
    @user = User.find(params[:user_id])
    @user.is_q = true
    @queuer = Queuer.new(queuer_params)
    @queuer.user = @user
    @queuer.rating = @user.rating
    @queuer.save
    redirect_to queuer_path(@queuer)
  end

  def edit
    @queuer = Queuer.find(params[:id])
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

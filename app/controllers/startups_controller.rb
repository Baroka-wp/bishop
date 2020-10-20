class StartupsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  before_action :set_startup, only: [:show, :edit, :update, :destroy]
  def index
    @startups = Startup.all
  end
  def new
    @startup = Startup.new
  end
  def create
    @startup = Startup.new(startup_params)
    if @startup.save
      ContactMailer.contact_mail(@startup).deliver
      flash[:success] = 'startup successfully create'
      redirect_to startups_path
    else
      render :new
  end
end
def show
end
def edit
end
def update
  if @startup.update(startup_params)
    flash[:success] = 'startup successfully update !'
    redirect_to startup_path(@startup.id)
  else
    render :edit
  end
end
def destroy
  @startup.destroy
  flash[:success] = 'startup successfully destroy !'
  redirect_to startups_path
end
private
  def startup_params
    params.require(:startup).permit(:name,:resume,
                                    :descrption,:descrption_cache,
                                    :trade_registre,
                                    :address,
                                    :banner,:banner_cache,
                                    :logo,:logo_cache, )
  end
  def set_startup
    @startup = Startup.find(params[:id])
  end
end

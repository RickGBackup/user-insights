class RegisteredAppsController < ApplicationController
  before_action :set_registered_app, only: [:show, :edit, :update, :destroy]

  # GET /registered_apps
  def index
    if current_user
      @registered_apps = current_user.registered_apps.all
    else
      redirect_to new_user_session_path
    end
  end

  #GET /registered_apps/1
  def show
    @events = @registered_app.events.group_by(&:name)
    @user = @registered_app.user
    if current_user != @user 
      flash[:alert] = "You may only view your own registered apps"
      redirect_to root_path
    end
  end

  # GET /registered_apps/new
  def new
    @registered_app = RegisteredApp.new
  end

  # GET /registered_apps/1/edit
  def edit
  end

  # POST /registered_apps
  def create
    @registered_app = RegisteredApp.new(registered_app_params)
    @registered_app.user = current_user
    if @registered_app.save
      redirect_to @registered_app, notice: 'Registered app was successfully created.'
    else
      render :new
    end
  end

  # DELETE /registered_apps/1
  def destroy
    @registered_app.destroy
    redirect_to root_path, notice: 'Registered app was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registered_app
      @registered_app = RegisteredApp.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def registered_app_params
      params.require(:registered_app).permit(:url, :name)
    end
end

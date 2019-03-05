class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_event, only: :show
  before_action :set_current_user_event, only: [:edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
    @new_comment = @event.comments.build(params[:comment])
    @new_subscription = @event.subscriptions.build(params[:subscription])
    @new_photo = @event.photos.build(params[:photo])
  end

  def new
    @event = current_user.events.build
  end

  def edit; end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      flash[:notice] = I18n.t('controllers.events.created')
      redirect_to @event
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      flash[:notice] = I18n.t('controllers.events.updated')
      redirect_to @event
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    flash[:notice] = I18n.t('controllers.events.destroyed')
    redirect_to events_url
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def set_current_user_event
    @event = current_user.events.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :address, :datetime, :description)
  end
end

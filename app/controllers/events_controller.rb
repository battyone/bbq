class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_event, only: [:show, :destroy, :edit, :update]
  before_action :password_guard!, only: :show
  after_action :verify_authorized, only: [:destroy, :edit, :update]

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

  def edit
    authorize @event
  end

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
    authorize @event

    if @event.update(event_params)
      flash[:notice] = I18n.t('controllers.events.updated')
      redirect_to @event
    else
      render :edit
    end
  end

  def destroy
    authorize @event

    @event.destroy
    flash[:notice] = I18n.t('controllers.events.destroyed')
    redirect_to events_url
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  # def set_current_user_event
  #   @event = current_user.events.find(params[:id])
  # end

  def password_guard!
    return true if @event.pincode.blank?
    return true if signed_in? && current_user == @event.user

    if params[:pincode].present? && @event.pincode_valid?(params[:pincode])
      cookies.permanent["events_#{@event.id}_pincode"] = params[:pincode]
    end

    pincode = cookies.permanent["events_#{@event.id}_pincode"]
    unless @event.pincode_valid?(pincode)
      flash.now[:alert] = I18n.t('controllers.events.wrong_pincode') if params[:pincode].present?
      render :password_form
    end
  end

  def event_params
    params.require(:event).permit(:title, :address, :datetime, :description, :pincode)
  end
end

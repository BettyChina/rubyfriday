class EventsController < ApplicationController
  def index
    if !session[:id]
      redirect_to '/users'
    else
      @user = User.find(session[:id])
      @event = Event.all
      #@other_event = Event.all
    end
  end

  def show
    if !session[:id]
      redirect_to '/users'
    else
      @user = User.find(session[:id])
      @event = Event.find(params[:id])
      #@message = Message.where(event_id:@event.id)
    end
  end

  def create
    if !session[:id]
      redirect_to '/users'
    else
      @event = Event.new(events_params)
      @event.host_id = session[:id]
      if @event.save
        redirect_to :root
      else
        flash[:errors] = @event.errors.full_messages
        redirect_to :back
      end
    end
  end

  def edit
    if !session[:id]
      redirect_to '/users'
    else
      @event = Event.find(params[:id])
    end
  end

  def update
    if !session[:id]
      redirect_to '/users'
    else
      @event = Event.find(params[:id])
      if @event.update(events_params)
        redirect_to :root
      else
        flash[:errors] = @event.errors.full_messages
        redirect_to :back
      end
    end
  end

  def destroy
    if !session[:id]
      redirect_to '/users'
    else
      @event = Event.find(params[:id])
      @event.destroy
      redirect_to :back
    end 
  end

  private
    def events_params
      params.require(:event).permit(:desc, :date, :city, :state)
    end
end

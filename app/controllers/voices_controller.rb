class VoicesController < ApplicationController
  before_action :set_voice, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]
  
  def index 
    @voices = Voice.includes(:user).order("created_at DESC")
  end
  def new
    @voice = Voice.new
  end

  def create
    Voice.create(voice_params)
  end

  def show
    @comment = Comment.new
    @comments = @voice.comments.includes(:user)
  end

  def destroy
    voice = Voice.find(params[:id])
    voice.destroy
  end

  def edit
    @voice = Voice.find(params[:id])
  end

  def update
    voice = Voice.find(params[:id])
    voice = update(voice_params)
  end




  private
  def voice_params
    params.require(:voice).permit(:image, :text).merge(user_id: current_user.id)
  end

  def set_voice
    @voice = Voice.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end

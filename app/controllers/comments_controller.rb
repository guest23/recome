class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/voices/#{comment.voice.id}"

  end

  private
  def comment_params
    params.require(:comment).permit(text).merge(user_id: current_user.id, voice_id: params[:voice_id])
  end

end


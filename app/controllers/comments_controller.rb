class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @gram = Gram.find_by_id(params[:gram_id])
    if !@gram.blank?
      @comment = @gram.comments.create(comment_params.merge(user: current_user))
      redirect_to root_path
    else
      render_not_found(:not_found)
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:message)
  end

  def render_not_found(status=:not_found)
    render plain: "#{status.to_s.titleize} :(", status: status
  end
end

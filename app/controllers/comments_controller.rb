class CommentsController < ApplicationController
  def index
  end

  def show
  end

  def create
  	@message = Message.find(params[:message_id])
  	@comment = @message.comments.create! content: params[:comment][:content]
    redirect_to message_path(@message)
  end

  def destroy
  end
end

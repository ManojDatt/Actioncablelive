class MessagesController < ApplicationController
  def index
  	@messages=Message.all
  end

  def show
  	message=Message.find(params[:id])
  	@comments=message.comments.all
  end

  def create

  end

  def destroy
  end
  
end

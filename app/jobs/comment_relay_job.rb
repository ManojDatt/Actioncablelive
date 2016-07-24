class CommentRelayJob < ApplicationJob
  def perform(comment)
    ActionCable.server.broadcast "messages:#{comment.message_id}:comments",
      comment: comment.content, locals: { comment: comment }
  end
end
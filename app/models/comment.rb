class Comment < ApplicationRecord
  belongs_to :message
  after_create_commit { CommentRelayJob.perform_now(self) }
end

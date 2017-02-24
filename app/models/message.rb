class Message < ApplicationRecord
  belongs_to :users
  belongs_to :chat_room

  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
    validates :body, presence: true, length: {minimum: 2, maximum: 1000}
    after_create_commit { MessageBroadcastJob.perform_later(self) }

  end
  validates :body, presence: true, length: {minimum: 2, maximum: 1000}
  after_create_commit { MessageBroadcastJob.perform_later(self) }

end
